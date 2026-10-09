# Frontend Operator

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
