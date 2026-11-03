# Pluggable UI Framework

**Record type:** Runtime capability

Application loading and Chrome APIs are capabilities of [Console Shell](insights-chrome.md). Scalprum and shared frontend packages remain distinct libraries; hosted applications remain consumers.

**Owner:** Services integration; Scalprum stewardship to confirm  
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## What it provides

Loads independent applications and shares platform APIs, state, and frontend assets.

<a id="backing-repositories-and-responsibilities"></a>

## Implementation and consumption relationships

| Related component | Relationship | Contribution to this capability |
|-------------------|--------------|---------------------------------|
| [Console Shell](insights-chrome.md) | Implements runtime integration | Hosts micro-frontends, exposes Chrome APIs, and coordinates shared shell state. |
| [Scalprum](scalprum.md) | Runtime library dependency | Provides micro-frontend loading, React bindings, remote hooks/shared state, and related runtime utilities. |
| [Shared Frontend Components](frontend-components.md) | Package dependency / bindings | Supplies Chrome bindings and shared packages used by the shell and applications; not the hosting service itself. |
| [Shared Frontend Assets](frontend-assets.md) | Content dependency | Supplies shared assets consumed by the runtime and applications; delivery infrastructure is separately documented. |

## Capability boundaries

<a id="f03"></a>

### Pluggable UI framework and Chrome API

**Capability ID:** F03

Includes public API, remote hooks, shared state, tenant hosting, and shared frontend assets.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Upstream providers and application owners retain their own boundaries. Confirm operational contacts and any unresolved stewardship or migration status with the relevant component owner.

The linked backing implementations carry pinned source evidence and implementation guidance. Relevant provider and owner references are listed below.

## Dependencies and owner references

- **PatternFly, Quickstarts, and shared PatternFly extensions** — [PatternFly](https://github.com/patternfly), [React Component Groups](https://github.com/patternfly/react-component-groups), [React Data View](https://github.com/patternfly/react-data-view), [ChatBot](https://github.com/patternfly/chatbot). Confirm team-specific extension stewardship.
- **OpenShift Dynamic Plugin SDK** — [OpenShift SDK maintainers](https://github.com/openshift/dynamic-plugin-sdk). [Platform integration guide](../../services/Frontend_components/fed/plugin-sdk.md).
- Applications share frontend packages and static assets; shared singleton/package compatibility is part of the platform integration. [Module federation](../module-federation.md).

## Team responsibility boundary

Services is accountable for the pluggable runtime and shell integration. UI maintains [shared UI components](frontend-components.md#ui-components) and [shared asset content](frontend-assets.md); Services maintains the [frontend-components pipeline](frontend-components.md#pipeline). Scalprum stewardship remains separately unconfirmed.

## Consumer applications

[Landing Page](landing-page-frontend.md), [RBAC UI](insights-rbac-ui.md), and [Access Requests / TAM Tool](access-requests-frontend.md) remain separate application components. They are hosted by the shell and use its APIs; shell implementation is not their backing application code. See [Frontend Deployment & Delivery](frontend-deployment-delivery.md) for deployment and metadata aggregation.
