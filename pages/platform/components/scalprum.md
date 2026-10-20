# Scalprum

**Implementation ID:** X02  
**Stewardship owner:** To confirm for the shared framework; Services owns its HCC integration.  
**Status:** Ownership pending  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

Micro-frontend runtime, React bindings, remote hooks/shared stores, remote types, and build/test utilities. Architecture documentation establishes platform use; current stewardship needs an explicit contract.

## Backing sources

- [Scalprum](https://github.com/scalprum/scaffolding)

## Capabilities

- [F03: Pluggable UI framework and Chrome API](pluggable-ui-framework.md#f03)
- [F13: Dynamic Plugin SDK integration](dynamic-plugin-sdk.md#f13)

## Evidence and ownership

This is a stewardship or integration record. The owner and source evidence above distinguish Services integration from upstream project/platform ownership. Current stewardship remains unconfirmed where marked.

- **Platform-use reference:** [Module Federation and Chrome Backend](../module-federation.md).
- Current package/framework stewardship and supported scope: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **OpenShift Dynamic Plugin SDK** — [OpenShift SDK maintainers](https://github.com/openshift/dynamic-plugin-sdk). [Platform integration guide](../../services/Frontend_components/fed/plugin-sdk.md).
