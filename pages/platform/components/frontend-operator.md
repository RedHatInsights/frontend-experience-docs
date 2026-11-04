# Frontend Operator

**Record type:** Software component within Frontend Deployment & Delivery

Orchestration implementation within [Frontend Deployment & Delivery](frontend-deployment-delivery.md). The group extends the documentation context around this operator; it does not move publication, serving, or application behavior into the operator repository.

**Implementation ID:** S03  
**Owner:** Services (portfolio ownership).  
**Type:** Infrastructure / operator  
**Status:** Tracked  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

Frontend application/environment reconciliation, application metadata aggregation, deployment resources, and asset-publication orchestration.

## Backing repository

- [frontend-operator](https://github.com/RedHatInsights/frontend-operator)

## Capabilities

- [F04: Dynamic navigation infrastructure](dynamic-navigation.md#f04)
- [F15: Push Cache / frontend asset delivery](push-cache.md#f15)

## Evidence and ownership

Portfolio inclusion was reviewed against the [Services team assignments](https://github.com/orgs/RedHatInsights/teams/experience-services-committers/repositories) on 2026-10-09. Services means Platform Experience Services / Console Framework.

Operational contact and escalation policy: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **S3-compatible object storage and ValKey/Redis** — Shared storage/infrastructure owners; ownership and configured mode must be resolved per environment. [Asset pipeline](../asset-pipeline.md).
- **OpenShift/Kubernetes, Clowder and environment provisioning** — Shared cluster/platform operators. [Clowder](https://github.com/RedHatInsights/clowder), [FEO](../frontend-operator.md).
- **Observability and operational tooling** — Prometheus/Grafana, Sentry, Splunk, Catchpoint, incident and test-reporting platform owners. Services owns component instrumentation/configuration where assigned. [Survival guide](https://docs.google.com/document/d/1BnGpJBFdCl6kmEW2TipJsGLg0m5Eukgpx7XYNClnwM4/edit?tab=t.0).

## Orchestration and implementation boundaries

| Operator responsibility | Collaborator / output | What the operator does not implement |
|-------------------------|-----------------------|--------------------------------------|
| Reconcile frontend and environment resources | Deployments and supporting application/environment resources. | Application features or source builds. |
| Aggregate application metadata | Module, navigation, tile, search, and widget configuration consumed through the [configuration/discovery flow](dynamic-navigation.md). | Shell navigation rendering, search behavior, or widget persistence. |
| Orchestrate asset publication | Jobs using [Valpop](valpop.md). | Asset-version storage, retrieval, and cleanup logic implemented by Valpop. |
| Orchestrate frontend delivery | Publication jobs and configured runtime artifacts; [asset serving](frontend-asset-proxy.md) is a separate system responsibility. | HTTP request-serving implementation or maintenance of shared asset content. |
| Orchestrate cache invalidation | [CDN Cache Purging](frontend-cache-bust.md) integration. | CDN platform operation or all [Akamai Integration](akamai-integration.md) configuration. |

[Environment configuration](frontend-environments.md), [runtime image](caddy-ubi.md), and deployment-related [release configuration](deployment-release-configuration.md) are associated inputs/artifacts with their own stewardship records. Source builds and [builder images](frontend-build-container.md) remain upstream development tooling. Application images and metadata are inputs; applications are consumers of the hosting/delivery system, not implementations of it.

See [Frontend Operator architecture](../frontend-operator.md) for resource schemas and reconciliation context. Verify older architecture descriptions against implementation evidence before operational use.
