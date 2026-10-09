# Pluggable UI Framework

**Owner:** Services integration; Scalprum stewardship to confirm  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Loads independent applications and shares platform APIs and state.

## Backing repositories and responsibilities

The implementation records below describe the backing code, its broader responsibilities, lifecycle, and source evidence.

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [Console Shell](insights-chrome.md) | [insights-chrome](https://github.com/RedHatInsights/insights-chrome) | Masthead, navigation, authentication integration, micro-frontend hosting, public Chrome API, and shared shell state. |
| [Shared Frontend Components](frontend-components.md) | [frontend-components](https://github.com/RedHatInsights/frontend-components) | Shared UI components, Chrome bindings, utilities, build configuration, test helpers, and development tools. |
| [Scalprum](scalprum.md) | [Scalprum](https://github.com/scalprum/scaffolding) | Micro-frontend runtime, React bindings, remote hooks/shared stores, remote types, and build/test utilities. Architecture documentation establishes platform use; current stewardship needs an explicit contract. |

## Capability boundaries

<a id="f03"></a>

### Pluggable UI framework and Chrome API

**Capability ID:** F03

Includes public API, remote hooks, shared state, and tenant hosting.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Upstream providers and application owners retain their own boundaries. Confirm operational contacts and any unresolved stewardship or migration status with the relevant component owner.

The linked backing implementations carry pinned source evidence and implementation guidance. Relevant provider and owner references are listed below.

## Dependencies and owner references

- **PatternFly, Quickstarts, and shared PatternFly extensions** — [PatternFly](https://github.com/patternfly), [React Component Groups](https://github.com/patternfly/react-component-groups), [React Data View](https://github.com/patternfly/react-data-view), [ChatBot](https://github.com/patternfly/chatbot). Confirm team-specific extension stewardship.
- **OpenShift Dynamic Plugin SDK** — [OpenShift SDK maintainers](https://github.com/openshift/dynamic-plugin-sdk). [Platform integration guide](../../services/Frontend_components/fed/plugin-sdk.md).
- Applications share frontend packages and static assets; shared singleton/package compatibility is part of the platform integration. [Module federation](../module-federation.md).
