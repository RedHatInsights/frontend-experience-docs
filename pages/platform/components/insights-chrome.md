# Console Shell

**Record type:** Software component

Primary catalog record for the frontend shell. [Console Runtime Overview](chrome-service.md) holds shared capability notes; [Chrome Backend](chrome-service-backend.md) is a separate backend component.

**Implementation ID:** S01  
**Owner:** Services (portfolio ownership).  
**Type:** Application shell  
**Status:** Tracked  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

Masthead, navigation, authentication integration, micro-frontend hosting, public Chrome API, and shared shell state.

## Backing repository

- [insights-chrome](https://github.com/RedHatInsights/insights-chrome)

<a id="capabilities"></a>

## Implemented capabilities and integrations

| Capability | Shell responsibility | Related provider / dependency |
|------------|----------------------|-------------------------------|
| [Shared chrome and shell state](chrome-service.md#f01) | Masthead, drawers, shared filters, personalization UI, themes, and degraded behavior. | Backend user configuration and independently supplied drawer modules. |
| [Navigation](navigation.md#f05) | Rendering, routes, visibility checks, and extension points. | Backend-served configuration and operator-collected metadata. |
| [Authentication and visibility](chrome-service.md#f02) | Shell authentication/session integration and access-aware UI. | SSO/OIDC, entitlement, and authorization providers. |
| [Application loading and Chrome APIs](pluggable-ui-framework.md#f03) | Runtime hosting, public shell APIs, and shared state integration. | Scalprum, shared package bindings, and [SDK compatibility](dynamic-plugin-sdk.md#f13). |
| [Support-case integration](support-case-integration.md#f19) | Contextual frontend handoff into support workflows. | Backend integration configuration and upstream support systems. |
| [Stratosphere UX](stratosphere.md#f18) | Product-selection / marketplace-account linking integration. | Upstream product/account services. |
| [Feedback](feedback.md#f12) | Retained form/API integration; current mounted exposure remains to confirm. | External feedback API; owner to confirm. |

Capabilities and integrations are not additional deployed shell components. The overview preserves existing capability IDs for [drawers](chrome-service.md#f22), [workspace selection](chrome-service.md#f24), [TAM context switching](chrome-service.md#f25), [global inventory filters](chrome-service.md#f26), [personalization](chrome-service.md#f27), [themes](chrome-service.md#f28), and [error containment](chrome-service.md#f29).

## Providers, hosted modules, and consumers

[Strategic Initiative Integration](strategic-initiative-integration.md) coordinates platform engagement for Lightwell and future high-stakes initiatives. Layout, navigation, and other shell implementation work remains owned by Console Shell; engagement and implementation effort are tracked separately without double-counting.

| Related component or capability | Relationship to the shell |
|---------------------------------|---------------------------|
| [Chrome Backend](chrome-service-backend.md) | Provides runtime/configuration APIs and the [browser-event bridge](chrome-service.md#f23). |
| [Frontend Deployment & Delivery](frontend-deployment-delivery.md) | Supplies deployment and asset-delivery mechanisms; shell consumes the [configuration/discovery flow](dynamic-navigation.md#f04). |
| [Landing Page](landing-page-frontend.md), [RBAC UI](insights-rbac-ui.md), [Access Requests](access-requests-frontend.md) | Separate hosted applications that consume shell APIs; their application code is not implemented by Chrome. |
| [Learning Resources & Help](learning-resources-help.md#f10), [Tutorials & Quickstarts](tutorials-and-quickstarts.md#f09) | Supply experiences/content integrated into the shell; hosting is distinct from their implementation. |
| [Scheduler UI](scheduler-ui.md#f21), [Virtual Assistant](virtual-assistant.md), [Notifications UI](notifications-frontend.md) | Independently implemented applications/modules; hosting does not absorb their scope or change transfer markings. |
| [Search](search.md#f06) | Integrates search UI/index consumption; separate transfer-candidate scope remains in the catalog. |
| [Shared Frontend Components](frontend-components.md), [Shared Frontend Assets](frontend-assets.md) | Package/content dependencies; remain separate library/content records. |
| [Internationalization](internationalization.md#f07), [Accessibility](accessibility.md#f08) | Cross-cutting capabilities; shell implements its own runtime/UI behavior and consumes shared tooling. |
| [Analytics Integration](analytics-integration.md#f20), [Feature Flags](feature-flags.md#f30) | Shared integration capabilities with separate provider/configuration boundaries. |

## Evidence and ownership

Portfolio inclusion was reviewed against the [Services team assignments](https://github.com/orgs/RedHatInsights/teams/experience-services-committers/repositories) on 2026-10-09. Services means Platform Experience Services / Console Framework.

Operational contact and escalation policy: **To confirm**.

- Mounted feedback UI and platform-feedback backend owner: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **Red Hat SSO / OIDC** — Authentication/identity service owners; Services owns integration behavior. [Auth architecture](../navigation-and-auth.md).
- **Entitlements** — Entitlements service owner to confirm. [Shell auth and visibility](../navigation-and-auth.md).
- **RBAC, Kessel, and inventory permission APIs** — Upstream authorization/inventory owners; UI application ownership is separate. [Navigation/auth](../navigation-and-auth.md).
