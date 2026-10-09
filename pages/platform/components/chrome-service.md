# Chrome Service

**Owner:** Services  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Shared console shell, application hosting, and shell backend capabilities.

## Backing repositories and responsibilities

The implementation records below describe the backing code, its broader responsibilities, lifecycle, and source evidence.

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [Console Shell](insights-chrome.md) | [insights-chrome](https://github.com/RedHatInsights/insights-chrome) | Masthead, navigation, authentication integration, micro-frontend hosting, public Chrome API, and shared shell state. |
| [Chrome Backend](chrome-service-backend.md) | [chrome-service-backend](https://github.com/RedHatInsights/chrome-service-backend) | User configuration/preferences, generated configuration and search-index processing/serving, integration metadata, and browser-event WebSocket bridge. |

## Capability boundaries

<a id="f01"></a>

### Chrome service / shell

**Capability ID:** F01

Record the frontend shell and backend separately.

<a id="f02"></a>

### Authentication and visibility

**Capability ID:** F02

Services owns shell integration; upstream providers own their services.

<a id="f22"></a>

### Global/help/notification drawers

**Capability ID:** F22

Chrome hosts the drawer; notification-specific modules are supplied by the UI application.

<a id="f23"></a>

### Browser events

**Capability ID:** F23

Current WebSocket bridge is distinct from archived `dynamic-browser-events`.

<a id="f24"></a>

### Workspace selection

**Capability ID:** F24

Shell hosts a federated workspace selector; distinct from TAM account-context switching.

<a id="f25"></a>

### TAM context switching

**Capability ID:** F25

Internal cross-account access integration using approved requests.

<a id="f26"></a>

### Global inventory filter

**Capability ID:** F26

Shared filter state and access-aware availability across applications.

<a id="f27"></a>

### Favorites, recently visited services, personalization

**Capability ID:** F27

Shell widgets/state and backend user configuration.

<a id="f28"></a>

### Theme, dark mode, and high contrast

**Capability ID:** F28

Shared visual behavior and preferences.

<a id="f29"></a>

### Error containment and degraded behavior

**Capability ID:** F29

Tenant-load containment, bootstrap handling, and integration-specific recovery need separate contracts.

The shell and backend have separate implementation and availability boundaries. Including both in this capability does not merge their service identities.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Upstream providers and application owners retain their own boundaries. Confirm operational contacts and any unresolved stewardship or migration status with the relevant component owner.

The linked backing implementations carry pinned source evidence and implementation guidance. Relevant provider and owner references are listed below.

## Dependencies and owner references

- **Red Hat SSO / OIDC** — Authentication/identity service owners; Services owns integration behavior. [Auth architecture](../navigation-and-auth.md).
- **Entitlements** — Entitlements service owner to confirm. [Shell auth and visibility](../navigation-and-auth.md).
- **RBAC, Kessel, and inventory permission APIs** — Upstream authorization/inventory owners; UI application ownership is separate. [Navigation/auth](../navigation-and-auth.md).
- **Notification backend and event producers** — Notification/event-service owner to confirm; shell relay/drawer ownership does not imply producer ownership. [WebSocket documentation](https://github.com/RedHatInsights/chrome-service-backend/blob/main/docs/websocket.md).
- **CDN/WAF and DNS** — Akamai/internal edge and DNS owners. Services integration responsibility is [Akamai Integration](akamai-integration.md). [Survival guide](https://docs.google.com/document/d/1BnGpJBFdCl6kmEW2TipJsGLg0m5Eukgpx7XYNClnwM4/edit?tab=t.0).
- **Support/portal APIs, Hydra, marketplace/account services, and PCM** — Respective upstream application/service owners; Services owns shell integration. [Support-case configuration](https://github.com/RedHatInsights/chrome-service-backend/blob/main/docs/support-case-configuration.md).
- **Konflux/Tekton, Quay, app-interface and release-data automation** — Shared build/registry/deployment platform owners. [Konflux](https://konflux-ci.dev/), [app-interface](https://gitlab.cee.redhat.com/service/app-interface), [release-data](https://gitlab.cee.redhat.com/releng/konflux-release-data).
- **OpenShift/Kubernetes, Clowder and environment provisioning** — Shared cluster/platform operators. [Clowder](https://github.com/RedHatInsights/clowder), [FEO](../frontend-operator.md).
- **Observability and operational tooling** — Prometheus/Grafana, Sentry, Splunk, Catchpoint, incident and test-reporting platform owners. Services owns component instrumentation/configuration where assigned. [Survival guide](https://docs.google.com/document/d/1BnGpJBFdCl6kmEW2TipJsGLg0m5Eukgpx7XYNClnwM4/edit?tab=t.0).
- **UI integration:** [landing-page-frontend](https://github.com/RedHatInsights/landing-page-frontend) — Hosted by [Console Shell](insights-chrome.md); consumes shared widgets/favorites/platform APIs.
- **UI integration:** [insights-rbac-ui](https://github.com/RedHatInsights/insights-rbac-ui) and [access-requests-frontend](https://github.com/RedHatInsights/access-requests-frontend) — Workspace selection and internal TAM context-switch/access-request integrations in [Console Shell](insights-chrome.md).
- **UI integration:** [notifications-frontend](https://github.com/RedHatInsights/notifications-frontend) — Supplies notification drawer/bell modules hosted by [Console Shell](insights-chrome.md); events come from the upstream notification service.
- **UI integration:** [sources-ui](https://github.com/RedHatInsights/sources-ui), [user-preferences-frontend](https://github.com/RedHatInsights/user-preferences-frontend), and [platform-settings-ui](https://github.com/RedHatInsights/platform-settings-ui) — Hosted settings/integration surfaces using shared shell/forms components.
- **UI integration:** [api-frontend](https://github.com/RedHatInsights/api-frontend) and [api-documentation-frontend](https://github.com/RedHatInsights/api-documentation-frontend) — Console `/docs/api` and developers.redhat.com API Catalog are separate documentation surfaces; [Console Shell](insights-chrome.md) links/integrates with them.
- **UI integration:** [payload-tracker-frontend](https://github.com/RedHatInsights/payload-tracker-frontend) — Hosted tenant consuming shared shell/components; payload backend remains separately owned.
- Shell bootstrap configuration and optional personalization have different failure boundaries; see [Chrome Backend](chrome-service-backend.md).
- Help, scheduler, notification, and assistant modules are hosted by the shell with separate application ownership.
- **Application integration guidance:** [Chrome integration guidelines](https://github.com/RedHatInsights/insights-chrome/blob/master/docs/integration-guidelines.md).

## Lifecycle and history

- [settings-frontend](https://github.com/RedHatInsights/settings-frontend) is archived. The non-archived [platform-settings-ui](https://github.com/RedHatInsights/platform-settings-ui) describes consolidation of notifications, sources, and preferences; existing applications being non-archived does not establish migration completion.
