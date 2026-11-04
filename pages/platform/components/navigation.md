# Navigation

**Record type:** Shell capability

Navigation is a capability of [Console Shell](insights-chrome.md), not another application or service. Its configuration producer/consumer flow is documented separately in [Frontend Configuration & Discovery](dynamic-navigation.md).

**Owner:** Services  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Menus, bundles, routes, and access-aware navigation.

<a id="backing-repositories-and-responsibilities"></a>

## Implementation and consumption relationships

| Related component | Relationship | Contribution to this capability |
|-------------------|--------------|---------------------------------|
| [Console Shell](insights-chrome.md) | Implements rendering; consumes configuration | Menus, bundle navigation, routes, visibility checks, and federated navigation extensions. |
| [Chrome Backend](chrome-service-backend.md) | Configuration provider | Processes/serves the generated configuration used by navigation. |
| [Frontend Operator](frontend-operator.md) | Metadata aggregator | Collects application navigation definitions; does not render navigation. |

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
