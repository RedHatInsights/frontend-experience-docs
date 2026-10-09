# Navigation

**Owner:** Services  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Menus, bundles, routes, and access-aware navigation.

## Backing repositories and responsibilities

The implementation records below describe the backing code, its broader responsibilities, lifecycle, and source evidence.

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [Console Shell](insights-chrome.md) | [insights-chrome](https://github.com/RedHatInsights/insights-chrome) | Masthead, navigation, authentication integration, micro-frontend hosting, public Chrome API, and shared shell state. |
| [Chrome Backend](chrome-service-backend.md) | [chrome-service-backend](https://github.com/RedHatInsights/chrome-service-backend) | User configuration/preferences, generated configuration and search-index processing/serving, integration metadata, and browser-event WebSocket bridge. |

## Capability boundaries

<a id="f05"></a>

### Navigation

**Capability ID:** F05

Rendering, bundles, visibility rules, and federated navigation extensions.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Upstream providers and application owners retain their own boundaries. Confirm operational contacts and any unresolved stewardship or migration status with the relevant component owner.

The linked backing implementations carry pinned source evidence and implementation guidance. Relevant provider and owner references are listed below.

## Dependencies and owner references

- **Entitlements** — Entitlements service owner to confirm. [Shell auth and visibility](../navigation-and-auth.md).
- **RBAC, Kessel, and inventory permission APIs** — Upstream authorization/inventory owners; UI application ownership is separate. [Navigation/auth](../navigation-and-auth.md).
- **UI integration:** [insights-rbac-ui](https://github.com/RedHatInsights/insights-rbac-ui) and [access-requests-frontend](https://github.com/RedHatInsights/access-requests-frontend) — Workspace selection and internal TAM context-switch/access-request integrations in [Console Shell](insights-chrome.md).
