# Testing Guidelines — learning-resources

## Testing Hierarchy

1. **Jest unit tests** — fast, isolated, for utilities and component logic
2. **Storybook stories** — visual, for component rendering and interaction
3. **Cypress component tests** — for complex component behavior with real DOM
4. **Playwright E2E tests** — for full user flows against stage environment

## Jest Unit Tests

### Configuration
- **Config file:** `jest.config.js`
- **Environment:** `jsdom`
- **Transform:** SWC via `@swc/jest` (fast TypeScript compilation)
- **Setup:** `config/jest.setup.js` (includes `crypto.randomUUID` polyfill)
- **CSS handling:** `identity-obj-proxy` maps all `.css`/`.scss` imports

### Running Tests
```bash
npm test                    # Run all unit tests
npm test -- --watch         # Watch mode
npm test -- --coverage      # With coverage report
npm test -- path/to/file    # Run specific test file
```

### Test Patterns
- **Location:** Colocate test files next to source (`Foo.test.tsx` beside `Foo.tsx`)
- **Framework:** `@testing-library/react` + `@testing-library/jest-dom`
- **Mocking:** Standard Jest mocks. MSW is available but primarily used in Storybook.
- **Transform exceptions:** `uuid` package needs transpiling (`transformIgnorePatterns` allows it)

### Existing Unit Tests
| File | Tests |
|------|-------|
| `src/components/HelpPanel/HelpPanelCustomTabs.test.tsx` | Help panel tab rendering |
| `src/components/HelpPanel/HelpPanelLink.test.tsx` | Help panel link component |
| `src/utils/fetchQuickstarts.test.ts` | API call logic |
| `src/utils/bundleUtils.test.ts` | Bundle URL/name mapping |
| `src/utils/openQuickStartInHelpPanel.test.ts` | Cross-component event |

### Writing New Tests
```typescript
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import { MyComponent } from './MyComponent';

describe('MyComponent', () => {
  it('renders expected content', () => {
    render(<MyComponent />);
    expect(screen.getByText('Expected')).toBeInTheDocument();
  });
});
```

## Storybook

### Configuration
- **Framework:** `@storybook/react-webpack5` (Storybook 9.x)
- **Addons:** `addon-docs` (with remark-gfm), `addon-webpack5-compiler-swc`, `msw-storybook-addon`
- **Dev server:** Port 6006

### Mocked Dependencies
Storybook aliases these external dependencies to local mocks:
- `@redhat-cloud-services/frontend-components/useChrome` → `.storybook/hooks/useChrome.tsx`
- `@unleash/proxy-client-react` → `.storybook/hooks/unleash.js`
- `@scalprum/react-core` → `.storybook/hooks/scalprum.js`

When adding new external Chrome/platform dependencies, you may need to add a mock alias in `.storybook/main.ts`.

### Running Storybook
```bash
npm run storybook           # Dev server on port 6006
npm run build-storybook     # Build static Storybook
npm run test-storybook      # Automated tests (requires running server)
npm run test-storybook:ci   # CI mode with --ci flag
```

### Story Patterns
Stories are colocated with components (`.stories.tsx` suffix).

```typescript
import type { Meta, StoryObj } from '@storybook/react';
import { MyComponent } from './MyComponent';

const meta: Meta<typeof MyComponent> = {
  title: 'Components/MyComponent',
  component: MyComponent,
};
export default meta;
type Story = StoryObj<typeof MyComponent>;

export const Default: Story = {
  args: { /* props */ },
};

export const ErrorState: Story = {
  args: { /* error scenario props */ },
};
```

### Test Runner Error Detection
The test runner (`.storybook/test-runner.ts`) automatically fails on:
- React warnings (`Warning:`)
- JavaScript errors
- Router and i18n errors

To skip testing for a story: `tags: ['test-skip']`

### MDX Documentation
- Located in `src/docs/*.mdx`
- Rendered in Storybook under "Documentation" category
- Use `remark-gfm` for GitHub-flavored Markdown support

## Cypress Component Tests

### Configuration
- **Config file:** `cypress.config.ts`
- **Spec pattern:** `cypress/component/**/*.cy.{js,jsx,ts,tsx}`
- **Framework:** React with Webpack bundler
- **Webpack config:** `config/webpack.cy.js`

### Running
```bash
npm run cypress:component   # Run component tests headless
npm run cypress:open        # Interactive Cypress runner
```

## Playwright E2E Tests

### Configuration
- **Config file:** `playwright.config.ts`
- **Workers:** 1 (serial execution)
- **Base URL:** `https://stage.foo.redhat.com:1337` (override with `PLAYWRIGHT_BASE_URL`)
- **Auth:** Global setup via `@redhat-cloud-services/playwright-test-auth/global-setup`
- **Storage state:** `./playwright/.auth/user.json`

### Running
```bash
# Set credentials
export E2E_USER="username"
export E2E_PASSWORD="password"

npx playwright test                 # Run all E2E tests
npx playwright test --debug         # Debug mode
npx playwright test help-panel      # Run specific test file
```

### Test Patterns

**Baseline counts:** Tests have intentional count assertions with tolerances (e.g., "at least 5 Ansible resources"). These detect backend seeding issues. Do NOT remove them.

**Utilities:** `playwright/test-utils.ts` provides:
- `LEARNING_RESOURCES_URL` — URL constant
- `waitForCountInRange(page, min, max)` — wait for resource count
- `extractResourceCount(page)` — get displayed count from UI

**Skipped tests:** Some tests are skipped with `test.skip()` due to stage environment limitations (e.g., zero Quick Start content). Re-enable when data is available.

## CI/CD Test Jobs

### GitHub Actions (`.github/workflows/test.yml`)
1. **install** — npm install + cache + @swc/core fix
2. **test-component** — Cypress component tests
3. **test-storybook** — Build Storybook, serve, run test-storybook:ci

### Tekton Pipeline (`.tekton/learning-resources-pull-request.yaml`)
- Unit tests via `npm ci`
- E2E tests via Playwright (using `mcr.microsoft.com/playwright:v1.59.0-jammy` image)
- Dev proxy for E2E: Caddy proxying to stage via `HCC_ENV_URL`
