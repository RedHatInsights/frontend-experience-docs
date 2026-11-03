# Dynamic Plugin SDK Integration

**Record type:** Runtime integration

This note describes [Console Shell](insights-chrome.md) compatibility with an upstream SDK. It is not a separate deployed console service or ownership of the upstream SDK.

**Owner:** OpenShift SDK maintainers; Services integration  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Compatibility with OpenShift dynamic plugins.

<a id="backing-repositories-and-responsibilities"></a>

## Implementation and consumption relationships

| Related component | Relationship | Contribution to this capability |
|-------------------|--------------|---------------------------------|
| [Console Shell](insights-chrome.md) | Implements compatibility integration | Integrates upstream dynamic-plugin interfaces into the console runtime. |
| [Scalprum](scalprum.md) | Runtime library dependency | Supplies existing micro-frontend loading/bindings alongside the upstream SDK; replacement is not established. |

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
