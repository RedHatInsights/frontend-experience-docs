# Internationalization

**Owner:** Services  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Translatable messages, locale catalogs, and translation workflows.

## Backing repositories and responsibilities

The implementation records below describe the backing code, its broader responsibilities, lifecycle, and source evidence.

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [Console Shell](insights-chrome.md) | [insights-chrome](https://github.com/RedHatInsights/insights-chrome) | Masthead, navigation, authentication integration, micro-frontend hosting, public Chrome API, and shared shell state. |
| [Shared Frontend Components](frontend-components.md) | [frontend-components](https://github.com/RedHatInsights/frontend-components) | Shared UI components, Chrome bindings, utilities, build configuration, test helpers, and development tools. |
| [Internationalization Tooling](i18n-tooling.md) | [i18n-tooling](https://github.com/RedHatInsights/i18n-tooling) | ICU catalog validation, ESLint rules, catalog adapters/CLI, reusable workflows, and Phrase TMS submission/reconciliation. |

## Capability boundaries

<a id="f07"></a>

### Internationalization

**Capability ID:** F07

Locale/catalog infrastructure exists; inspected shell bootstrap uses English. Tooling existence does not establish multilingual rollout.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Upstream providers and application owners retain their own boundaries. Confirm operational contacts and any unresolved stewardship or migration status with the relevant component owner.

The linked backing implementations carry pinned source evidence and implementation guidance. Relevant provider and owner references are listed below.

## Dependencies and owner references

- **Phrase translation management** — Translation-platform/account owners; Services owns tooling integration. [i18n-tooling](https://github.com/RedHatInsights/i18n-tooling).
