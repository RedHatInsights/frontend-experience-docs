# Dynamic Plugin SDK Integration

**Owner:** OpenShift SDK maintainers; Services integration  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Compatibility with OpenShift dynamic plugins.

## Backing repositories and responsibilities

The implementation records below describe the backing code, its broader responsibilities, lifecycle, and source evidence.

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [Console Shell](insights-chrome.md) | [insights-chrome](https://github.com/RedHatInsights/insights-chrome) | Masthead, navigation, authentication integration, micro-frontend hosting, public Chrome API, and shared shell state. |
| [Scalprum](scalprum.md) | [Scalprum](https://github.com/scalprum/scaffolding) | Micro-frontend runtime, React bindings, remote hooks/shared stores, remote types, and build/test utilities. Architecture documentation establishes platform use; current stewardship needs an explicit contract. |

## Capability boundaries

<a id="f13"></a>

### Dynamic Plugin SDK integration

**Capability ID:** F13

Upstream SDK is used alongside Scalprum; no completed replacement is established.

The OpenShift Dynamic Plugin SDK is upstream software. Services owns HCC compatibility/integration, not the upstream SDK service boundary.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Upstream providers and application owners retain their own boundaries. Confirm operational contacts and any unresolved stewardship or migration status with the relevant component owner.

The linked backing implementations carry pinned source evidence and implementation guidance. Relevant provider and owner references are listed below.

- **Upstream SDK:** [OpenShift Dynamic Plugin SDK](https://github.com/openshift/dynamic-plugin-sdk).
- **Integration guidance:** [Plugin SDK migration guide](../../services/Frontend_components/fed/plugin-sdk.md).

## Dependencies and owner references

- **OpenShift Dynamic Plugin SDK** — [OpenShift SDK maintainers](https://github.com/openshift/dynamic-plugin-sdk). [Platform integration guide](../../services/Frontend_components/fed/plugin-sdk.md).
