# Push Cache

**Owner:** Services integration; shared storage providers  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Publishes, retains, and serves frontend asset versions.

## Backing repositories and responsibilities

The implementation records below describe the backing code, its broader responsibilities, lifecycle, and source evidence.

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [Frontend Operator](frontend-operator.md) | [frontend-operator](https://github.com/RedHatInsights/frontend-operator) | Frontend application/environment reconciliation, application metadata aggregation, deployment resources, and asset-publication orchestration. |
| [Asset Publication and Version Retention](valpop.md) | [valpop](https://github.com/RedHatInsights/valpop) | Publishes/retrieves frontend assets, retains versions, and cleans up old records; supports S3 and ValKey/Redis modes. |
| [Frontend Asset Proxy](frontend-asset-proxy.md) | [frontend-asset-proxy](https://github.com/RedHatInsights/frontend-asset-proxy) | Go reverse proxy for S3-compatible frontend assets, including SPA entry-point fallback. |
| [Akamai Integration](akamai-integration.md) | [Akamai integration notes](akamai-integration.md) | The survival guide identifies Services responsibility for configuration, delivery integration, and purge/recovery procedures. Akamai platform and DNS ownership remain dependency relationships. |

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
