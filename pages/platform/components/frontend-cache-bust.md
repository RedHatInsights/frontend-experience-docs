# CDN Cache Purging

**Implementation ID:** X04  
**Stewardship owner:** To confirm; referenced by Frontend Operator application metadata.  
**Status:** Ownership pending  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

Non-archived purge-image repository referenced by FEO app-interface metadata, but absent from Services team assignments. Reconcile repository and operational ownership.

## Backing sources

- [frontend-cache-bust](https://github.com/RedHatInsights/frontend-cache-bust)

## Evidence and ownership

This is a stewardship or integration record. The owner and source evidence above distinguish Services integration from upstream project/platform ownership. Current stewardship remains unconfirmed where marked.

- **Reviewed source evidence:** [FEO app-interface application](https://gitlab.cee.redhat.com/service/app-interface/-/blob/master/data/services/insights/frontend-operator/app.yml)
- Current resource/image owners and consumers: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **CDN/WAF and DNS** — Akamai/internal edge and DNS owners. Services integration responsibility is [Akamai Integration](akamai-integration.md). [Survival guide](https://docs.google.com/document/d/1BnGpJBFdCl6kmEW2TipJsGLg0m5Eukgpx7XYNClnwM4/edit?tab=t.0).
