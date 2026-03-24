# Backend fuzzy search integration

## Reference

**Quickstarts service API:** See the quickstarts repo documentation for the fuzzy search contract, examples, and configuration:

- **Fuzzy Search (service):** `docs/developers/FUZZY_SEARCH.md` in [RedHatInsights/quickstarts](https://github.com/RedHatInsights/quickstarts)

That doc describes:
- Query params: `display-name=<term>` and `fuzzy=true`
- Ranking: match count (DESC) → total Levenshtein distance (ASC)
- Config: `FUZZY_SEARCH_DISTANCE_THRESHOLD` (server-side; default 3)
- Tag filters work together with fuzzy (e.g. `bundle=ansible`)

---

## Overview

Integrate the quickstarts service fuzzy search (Levenshtein, `fuzzy` query param from PR #436) so the help panel Search panel and the catalog use server-side fuzzy matching on `spec.displayName` instead of or in addition to client-side behavior. Replace the Search panel's Fuse.js-based quickstart search with the backend API; enable fuzzy for the catalog "Find by name" filter.

## Context

The quickstarts service supports optional fuzzy search via [PR #436](https://github.com/RedHatInsights/quickstarts/pull/436):

- **Query params:** `display-name` (existing) and **`fuzzy`** (boolean, default `false`).
- **Behavior:** When `fuzzy=true`, backend uses Levenshtein distance on **spec.displayName** (word-by-word), with typo tolerance configurable via `FUZZY_SEARCH_DISTANCE_THRESHOLD` (server-side env).
- **Scope:** Search is only on `spec.displayName` for now; extending to `spec.description` or `spec.tasks` is a possible future backend change.

In this app:

- **Search panel** ([`SearchPanel.tsx`](src/components/HelpPanel/HelpPanelTabs/SearchPanel/SearchPanel.tsx)): Previously fetched all quickstarts via `fetchAllData(getUser, {})` and ran **Fuse.js** over quickstarts + services + API docs. Fuse.js has been removed and replaced by the backend fuzzy search: the search path now calls `fetchAllData(getUser, { 'display-name': query.trim(), fuzzy: true })` for quickstarts and filters services and API docs client-side.
- **Learn panel** ([`LearnPanel.tsx`](src/components/HelpPanel/HelpPanelTabs/LearnPanel.tsx)): No free-text search today (only bundle, content type, bookmarks). No change unless we add a "search by name" input later.
- **Catalog** ([`GlobalLearningResourcesPage`](src/components/GlobalLearningResourcesPage/GlobalLearningResourcesPage.tsx), filters): Uses `loaderOptions['display-name']` when the user types in "Find by name". Pass `fuzzy: true` when a display-name filter is present so catalog search is typo-tolerant.

---

## 1. API layer: add `fuzzy` support

**File:** [`src/utils/fetchQuickstarts.ts`](src/utils/fetchQuickstarts.ts)

- Add **`fuzzy?: boolean`** to `FetchQuickstartsOptions`.
- In the `axios.get` params, when `fuzzy === true` and there is a non-empty `display-name`, pass **`fuzzy: true`** in the request (query param name from the API is `fuzzy`).
- Keep existing behavior when `fuzzy` is omitted or `false`.

**File:** [`src/utils/fetchAllData.ts`](src/utils/fetchAllData.ts)

- No signature change; it already forwards `FetchQuickstartsOptions` to `fetchQuickstarts`.

---

## 2. Search panel: use backend fuzzy for quickstarts

**File:** [`src/components/HelpPanel/HelpPanelTabs/SearchPanel/SearchPanel.tsx`](src/components/HelpPanel/HelpPanelTabs/SearchPanel/SearchPanel.tsx)

- **`performSearch(query)`:** Call `fetchAllData(chrome.auth.getUser, { 'display-name': query.trim(), fuzzy: true })` for quickstarts; fetch bundles and bundleInfo for services and API docs. Build quickstart SearchResults from returned quickstarts. Filter services and API docs client-side by query. Combine: quickstarts first (backend order), then filtered services, then filtered API docs.
- **No Fuse.js:** Fuse.js is not used. Services and API docs are filtered with simple substring (case-insensitive) matching; there is no global Fuse index and no `fuse.js` dependency in the codebase.

---

## 3. Catalog: enable fuzzy when "Find by name" is used

**Files:** [`GlobalLearningResourcesFilters.tsx`](src/components/GlobalLearningResourcesPage/GlobalLearningResourcesFilters.tsx), [`GlobalLearningResourcesFiltersMobile.tsx`](src/components/GlobalLearningResourcesPage/GlobalLearningResourcesFiltersMobile.tsx)

- When updating `loaderOptions` for the display-name input, set **`fuzzy: true`** whenever **`'display-name'`** is non-empty.

---

## 4. Learn panel

- No code change: LearnPanel has no display-name search field. Add later if product wants "search by name" there.

---

## 5. Tests and mocks

- Add tests for `fuzzy: true` in request params when display-name is set.
- Update quickstarts API mocks to accept optional `fuzzy` query parameter (e.g. in `helpPanelJourneyHelpers.ts` and Storybook/Cypress intercepts).

---

## 6. Cleanup (done)

- **`fuse.js`** has been removed and is no longer a project dependency.
- Typo tolerance for quickstart search is controlled by the backend env **`FUZZY_SEARCH_DISTANCE_THRESHOLD`** (no frontend configuration).

---

## Out of scope (future)

- Backend extending fuzzy to **spec.description** or **spec.tasks** (backend change; frontend keeps passing `fuzzy=true`).
- Frontend configuration for Levenshtein distance (server env only).
