# Integration Guidelines — learning-resources

## Module Federation

### Overview
This app runs as a federated module within the HCC (Hybrid Cloud Console) shell powered by insights-chrome. It exposes 6 modules consumed by other apps via Webpack Module Federation + Scalprum.

### Exposed Modules
See `fec.config.js` for the full list. Key modules:
- `./RootApp` — main app entry, mounted in the chrome shell
- `./HelpPanel` — loaded by insights-chrome into the help panel drawer
- `./HelpPanelLink` — standalone link component for other apps
- `./BookmarkedLearningResourcesWidget` — widget for dashboards
- `./Creator` — creator tool (behind feature flag)
- `./GlobalLearningResourcesPage` — full catalog page

### Shared Singletons
- `react-router-dom` (singleton, any version) — shared with host app

### Breaking Change Protocol
Since these modules are consumed by other HCC apps, changes to their public API (props, exports) are breaking changes. When modifying an exposed module:
1. Check who consumes it (search the HCC ecosystem)
2. Ensure backward compatibility or coordinate changes
3. Update `fec.config.js` if adding/removing exposed modules

## Chrome API Integration

### useChrome Hook
The primary integration point with insights-chrome:

```typescript
import useChrome from '@redhat-cloud-services/frontend-components/useChrome';

const {
  auth,           // { getUser() } — SSO authentication
  isBeta,         // () => boolean — beta environment check
  getBundle,      // () => string — current bundle name
  getApp,         // () => string — current app name
  on,             // (event, handler) — event subscription
  updateDocumentTitle, // (title) — set page title
  quickStarts,    // Quickstarts API
} = useChrome();
```

### Rules
- Always use `useChrome()` for Chrome features — never import Chrome internals
- Chrome context is available only inside the app shell, not in Storybook (mocked)
- The `getUser()` function is async — always `await` it

## Scalprum Cross-Component Communication

### Shared Store Pattern
The app uses a Scalprum shared store for cross-component events:

**File:** `src/store/openQuickstartInHelpPanelStore.ts`
```typescript
import { createSharedStore } from '@scalprum/core';
const store = createSharedStore({ OPEN_QUICKSTART: null, CONSUMED_OPEN: false });
```

This enables the main app to tell the help panel to open a specific quickstart, even though they are separate federated modules.

### Rules
- Use `@scalprum/core` `createSharedStore` for cross-module state
- Scalprum is mocked in Storybook (`.storybook/hooks/scalprum.js`)

## Data Driven Forms

### Creator Wizard
The creator wizard uses `@data-driven-forms/react-form-renderer` with the PF4 component mapper:

```typescript
import FormRenderer from '@data-driven-forms/react-form-renderer';
import componentMapper from '@data-driven-forms/pf4-component-mapper/component-mapper';
```

**Note:** The PF4 mapper (`pf4-component-mapper`) is intentionally used, not PF6. The PF4 mapper is compatible with PF6 at runtime. Do NOT migrate to a PF6 mapper unless one is officially released by Data Driven Forms.

### Schema Definition
Form schemas are defined in `src/components/creator/schema.tsx`. Steps are in `src/components/creator/steps/`.

## Internationalization (react-intl)

### Message Definitions
All translatable strings are defined in `src/Messages.ts`:

```typescript
import { defineMessages } from 'react-intl';

export default defineMessages({
  learningResources: {
    id: 'learningResources',
    defaultMessage: 'Learning Resources',
  },
  // ... extensive message catalog
});
```

### Usage
```typescript
import { useIntl } from 'react-intl';
import messages from '../../Messages';

const intl = useIntl();
const text = intl.formatMessage(messages.learningResources);
```

### Rules
- All user-facing strings must go through react-intl
- Define messages in `src/Messages.ts`, not inline
- Use `defineMessages` for extraction tooling compatibility

## Storybook Integration

### Mock Infrastructure
Storybook requires mocking Chrome, Unleash, and Scalprum since they are not available outside the HCC shell:

| Dependency | Mock Location |
|-----------|---------------|
| `useChrome` | `.storybook/hooks/useChrome.tsx` |
| `@unleash/proxy-client-react` | `.storybook/hooks/unleash.js` |
| `@scalprum/react-core` | `.storybook/hooks/scalprum.js` |
| Chrome global | `.storybook/mocks/chromeMock.ts` |

Mocks are configured as webpack aliases in `.storybook/main.ts`.

### MSW (Mock Service Worker)
API calls are mocked using MSW in Storybook:
- Initialized in `.storybook/preview.tsx` via `msw-storybook-addon`
- Handlers defined per-story in `parameters.msw.handlers`
- Worker directory: `public/`

### Adding New External Dependencies
When adding a new Chrome/platform dependency that is not available in Storybook:
1. Create a mock in `.storybook/hooks/` or `.storybook/mocks/`
2. Add a webpack alias in `.storybook/main.ts` resolve.alias
3. Verify stories still render with `npm run test-storybook`

## CI/CD Integration

### GitHub Actions
**File:** `.github/workflows/test.yml`
- Triggers on push to master, PRs to master
- Jobs: install → test-component (Cypress) + test-storybook (Storybook test runner)
- Caches node_modules between jobs
- Fixes `@swc/core` platform bindings (ARM/x86 compatibility)

### Tekton/Konflux Pipeline
**File:** `.tekton/learning-resources-pull-request.yaml`
- Runs on PRs via Konflux/Tekton
- Stages: build → unit tests → E2E tests
- E2E uses Playwright image `mcr.microsoft.com/playwright:v1.59.0-jammy`
- Dev proxy: Caddy with `learning-resources-dev-proxy-caddyfile-v2` configmap
- Secrets: `learning-resources-credentials-secret` for E2E auth

### Deployment
- **Dev:** `npm run start` (FEC dev-proxy with HMR, hot reload)
- **Build:** `npm run build` (production build via FEC)
- **Static:** Built assets served by Caddy in production containers
- **Frontend CRD:** `deploy/frontend.yml` defines the Kubernetes Frontend Custom Resource

### Build Submodule
The `build-tools/` directory is a git submodule pointing to `insights-frontend-builder-common`. It provides the Dockerfile and build scripts for container builds.
