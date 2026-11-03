# Push Cache

**Record type:** Delivery capability

Publication, retention, and serving are capabilities of [Frontend Deployment & Delivery](frontend-deployment-delivery.md). The operator, Valpop, and asset proxy remain distinct implementation components with separate failure and release boundaries.

**Owner:** Services integration; shared storage providers  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Publishes, retains, and serves frontend asset versions.

<a id="backing-repositories-and-responsibilities"></a>

## Implementation and consumption relationships

| Related component | Relationship | Contribution to this capability |
|-------------------|--------------|---------------------------------|
| [Frontend Operator](frontend-operator.md) | Orchestrates | Reconciles resources and triggers asset-publication/invalidation jobs; does not itself implement asset serving. |
| [Asset Publication and Version Retention](valpop.md) | Implements publication/retention | Publishes/retrieves assets, retains versions, and cleans up records; storage mode is environment-dependent. |
| [Frontend Asset Proxy](frontend-asset-proxy.md) | Implements serving | Serves assets from S3-compatible storage with SPA fallback. |
| [Akamai Integration](akamai-integration.md) | Adjacent CDN integration / transfer candidate | Supplies edge caching and invalidation integration. Remains separately listed and starred; CDN infrastructure is external. |

## Capability boundaries

<a id="f15"></a>

### Push Cache / frontend asset delivery

**Capability ID:** F15

Composite publication, version retention, serving, and edge-delivery subsystem.

Publication, version retention, origin serving, and CDN behavior are distinct responsibilities. Confirm storage/cache mode, retention, rollback, and recovery contracts per environment.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Upstream providers and application owners retain their own boundaries. Confirm operational contacts and any unresolved stewardship or migration status with the relevant component owner.

The linked backing implementations carry pinned source evidence and implementation guidance. Relevant provider and owner references are listed below.

## Dependencies and owner references

- **S3-compatible object storage and ValKey/Redis** — Shared storage/infrastructure owners; ownership and configured mode must be resolved per environment. [Asset pipeline](../asset-pipeline.md).
- **CDN/WAF and DNS** — Akamai/internal edge and DNS owners. Services integration responsibility is [Akamai Integration](akamai-integration.md). [Survival guide](https://docs.google.com/document/d/1BnGpJBFdCl6kmEW2TipJsGLg0m5Eukgpx7XYNClnwM4/edit?tab=t.0).
- **Konflux/Tekton, Quay, app-interface and release-data automation** — Shared build/registry/deployment platform owners. [Konflux](https://konflux-ci.dev/), [app-interface](https://gitlab.cee.redhat.com/service/app-interface), [release-data](https://gitlab.cee.redhat.com/releng/konflux-release-data).
- **OpenShift/Kubernetes, Clowder and environment provisioning** — Shared cluster/platform operators. [Clowder](https://github.com/RedHatInsights/clowder), [FEO](../frontend-operator.md).
- Frontend Operator orchestrates publication, Valpop handles publication/version retention, and the asset proxy serves object-storage assets. [Asset pipeline](../asset-pipeline.md).
