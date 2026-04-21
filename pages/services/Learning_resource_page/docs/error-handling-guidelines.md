# Error Handling Guidelines — learning-resources

## Error Handling Architecture

This repo does **not** have a global React Error Boundary. Error handling is done per-component using fallback components, try/catch blocks, and conditional rendering.

## Fallback Components

### Pattern
Components that load async data provide dedicated fallback variants:

| Component | Fallback |
|-----------|----------|
| `GlobalLearningResourcesContent.tsx` | `GlobalLearningResourcesContentFallback.tsx` |
| `GlobalLearningResourcesFilters.tsx` | `GlobalLearningResourcesFiltersFallback.tsx` |

Fallback components render skeleton/loading states and are used with `React.Suspense`.

### Empty States
The `EmptyState.tsx` component handles scenarios where no data is available after a successful API call. This is distinct from error states — empty state means the API succeeded but returned zero results.

## API Error Handling

### fetch* Utilities
API call utilities in `src/utils/` throw errors that bubble up to the consuming component:

```typescript
// src/utils/fetchQuickstarts.ts
const user = await getUser();
if (!user) {
  throw new Error('User not logged in');
}
```

### Component-Level Catch
Components that call APIs wrap them in try/catch:

```typescript
// HelpPanelCustomTabs.tsx
try {
  const quickstarts = await fetchQuickstarts(getUser, options);
  setData(quickstarts);
} catch (err) {
  console.error('Help Panel: failed to load quickstarts', err);
  // Render empty/error state
}
```

### Rules
- Always log errors with `console.error()` — the Storybook test runner detects critical errors
- Never silently swallow errors — at minimum log them
- Show user-friendly error states, not raw error messages
- API errors should result in graceful degradation, not crashes

## Storybook Error Stories

Components with API dependencies should include error story variants to demonstrate error handling:

```typescript
export const ApiError: Story = {
  parameters: {
    msw: {
      handlers: [
        http.get('/api/endpoint', () => {
          return new HttpResponse(null, { status: 500 });
        }),
      ],
    },
  },
};
```

Existing error stories:
- `APIPanel.stories.tsx` — `ApiError` variant
- `SupportPanel.stories.tsx` — `ApiError` variant

## Console Error Detection

The Storybook test runner (`.storybook/test-runner.ts`) automatically fails stories that emit:
- React warnings (e.g., `Warning: Each child in a list...`)
- JavaScript errors
- React Router errors
- react-intl errors

### Ignored Patterns (Not Errors)
- MSW mock API responses
- Storybook informational warnings
- Testing Library async logs

### Skipping Error Detection
For stories that intentionally produce errors:
```typescript
export const IntentionalError: Story = {
  parameters: {
    testRunner: { ignoreConsoleErrors: true },
  },
};
```

## Loading States

### Suspense Boundaries
Components loaded lazily or with async data use `React.Suspense` with fallback components:

```tsx
<Suspense fallback={<ContentFallback />}>
  <GlobalLearningResourcesContent />
</Suspense>
```

### useSuspenseLoader
The app uses `useSuspenseLoader` from Chrome for data loading:
```typescript
const { fetchAllData } = useSuspenseLoader(fetchAllData);
```
This integrates with React Suspense for seamless loading states.

## Feature Flag Error Handling

Feature flags can fail silently. Components using `useFlag` / `useFlags` should handle the case where a flag is undefined:

```typescript
const flags = useFlags();
const flag = flags.find(({ name }) => name === 'feature.name');
const isEnabled = flag?.enabled ?? false; // Default to false if flag is missing
```

This ensures the UI degrades gracefully if the Unleash proxy is unavailable.
