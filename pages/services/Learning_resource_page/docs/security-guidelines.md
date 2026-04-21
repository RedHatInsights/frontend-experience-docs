# Security Guidelines — learning-resources

## Authentication

### Chrome-Based Auth
All authentication is handled by insights-chrome. The app never manages tokens or sessions directly.

**How to get the current user:**
```typescript
import useChrome from '@redhat-cloud-services/frontend-components/useChrome';

const { auth } = useChrome();
const user = await auth.getUser();
const accountId = user.identity.internal.account_id;
```

**Rules:**
- Never import OIDC packages directly — always go through Chrome's `auth` API
- Never store tokens in localStorage/sessionStorage — Chrome handles token lifecycle
- Never hardcode user IDs or account numbers
- API calls must include the user's `account_id` for proper scoping (see `fetchQuickstarts.ts`)

### Auth in API Calls
All API calls in `src/utils/fetch*.ts` follow this pattern:
```typescript
export async function fetchQuickstarts(
  getUser: ChromeAPI['auth']['getUser'],
  options?: FetchOptions
) {
  const user = await getUser();
  if (!user) {
    throw new Error('User not logged in');
  }
  const accountId = user.identity.internal.account_id;
  // Include accountId in API params
}
```

The `getUser` function is passed as a parameter (dependency injection) to keep API utilities testable.

## Feature Flags (Unleash)

**Package:** `@unleash/proxy-client-react` ^4.5.2

### Usage Patterns
```typescript
import { useFlag, useFlags } from '@unleash/proxy-client-react';

// Simple boolean check
const isEnabled = useFlag('platform.chrome.help-panel_search');

// Check from flags array (when flag name is dynamic)
const flags = useFlags();
const flag = flags.find(({ name }) => name === flagName);
const isEnabled = flag?.enabled ?? false;
```

### Active Feature Flags
| Flag Name | Controls | Location |
|-----------|----------|----------|
| `platform.chrome.help-panel_search` | Search tab visibility | `HelpPanelCustomTabs.tsx` |
| `platform.chrome.help-panel_knowledge-base` | Knowledge Base tab | `HelpPanelCustomTabs.tsx` |
| `platform.chrome.help-panel_direct-ask-redhat` | Virtual Assistant button | `HelpPanelCustomTabs.tsx` |
| `platform.chrome.quickstarts.creator` | Creator tool access | `Viewer.tsx` |

### Rules
- Never hardcode feature availability — always use feature flags
- Feature flags may differ between stage and production
- In Storybook, Unleash is mocked (`.storybook/hooks/unleash.js`) — all flags return enabled by default
- In tests, mock `@unleash/proxy-client-react` to control flag state

## Data Access & API Security

### Account Scoping
All API calls to the quickstarts backend are scoped to the user's account ID. This ensures tenants cannot access each other's data (favorites, custom resources).

### Favorite Operations
`src/utils/toggleFavorite.ts` and `src/utils/serviceFavorites.ts` handle user-specific data. These always include the account ID parameter.

### No Secrets in Frontend
This is a frontend application — it contains no secrets, API keys, or credentials. All sensitive configuration is handled via:
- Chrome (auth tokens, SSO)
- Unleash (feature flags from proxy)
- Environment variables in CI (E2E test credentials)

## Content Security

### YAML Processing
The Creator tool (`src/components/creator/CreatorYAMLView.tsx`) parses user-provided YAML using the `yaml` npm package. The parsed YAML is used for preview rendering only — it is never executed as code.

### Monaco Editor
The Monaco Editor in the Creator tool runs entirely client-side. User input is parsed as YAML data, not executed. No `eval()` or dynamic code execution occurs.

## Storybook Security Mocks

Storybook provides mock implementations for security-related APIs:
- **Chrome mock** (`.storybook/mocks/chromeMock.ts`): Returns a mock user with a test account ID
- **Unleash mock** (`.storybook/hooks/unleash.js`): Returns all feature flags as enabled
- **Scalprum mock** (`.storybook/hooks/scalprum.js`): Mock module federation

These mocks ensure stories render correctly without live Chrome/Unleash connections.
