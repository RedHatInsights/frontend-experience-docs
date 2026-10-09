# Akamai Integration

**Implementation ID:** X03  
**Stewardship owner:** Services for configuration and integration; CDN and DNS provider ownership is referenced separately.  
**Status:** Tracked  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

The survival guide identifies Services responsibility for configuration, delivery integration, and purge/recovery procedures. Akamai platform and DNS ownership remain dependency relationships.

## Backing sources

- [CDN Cache Purging (X04)](frontend-cache-bust.md) and Services-owned [deployment configuration (X08)](deployment-release-configuration.md); the exact configuration-resource scope needs confirmation.
- **Ownership evidence:** [Platform Engineer Survival Guide](https://docs.google.com/document/d/1BnGpJBFdCl6kmEW2TipJsGLg0m5Eukgpx7XYNClnwM4/edit?tab=t.0).

## Capabilities

- [F15: Push Cache / frontend asset delivery](push-cache.md#f15)

## Evidence and ownership

This is a stewardship or integration record. The owner and source evidence above distinguish Services integration from upstream project/platform ownership. Current stewardship remains unconfirmed where marked.

- **Responsibility reference:** [Platform Engineer Survival Guide](https://docs.google.com/document/d/1BnGpJBFdCl6kmEW2TipJsGLg0m5Eukgpx7XYNClnwM4/edit?tab=t.0)

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **CDN/WAF and DNS** — Akamai/internal edge and DNS owners. Services integration responsibility is [Akamai Integration](akamai-integration.md). [Survival guide](https://docs.google.com/document/d/1BnGpJBFdCl6kmEW2TipJsGLg0m5Eukgpx7XYNClnwM4/edit?tab=t.0).
