# Deployment and Release Configuration

**Implementation ID:** X08  
**Accountability:** Services for its configuration resources; UI for its configuration resources. Shared platform owners operate deployment automation; exact per-resource ownership needs confirmation.<br>
**Status:** Ownership pending  
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Team-managed application, deployment, pipeline, and recovery configuration in shared infrastructure repositories. Record ownership per configuration resource; the hosting platforms are dependencies.

## Backing sources

- [app-interface](https://gitlab.cee.redhat.com/service/app-interface/-/tree/master/data/services/insights) and [Konflux release-data](https://gitlab.cee.redhat.com/releng/konflux-release-data/-/tree/main) configuration

## Evidence and ownership

This is a stewardship or integration record. The owner and source evidence above distinguish Services integration from upstream project/platform ownership. Current stewardship remains unconfirmed where marked.

- Current resource/image owners and consumers: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **Konflux/Tekton, Quay, app-interface and release-data automation** — Shared build/registry/deployment platform owners. [Konflux](https://konflux-ci.dev/), [app-interface](https://gitlab.cee.redhat.com/service/app-interface), [release-data](https://gitlab.cee.redhat.com/releng/konflux-release-data).

## UI Konflux scope

The team owner identified `rh-platform-experien-tenant` as the UI namespace on 2026-10-23. UI application detail pages link to individual applications and pinned source pipelines. Namespace membership records build/release scope, not exclusive component accountability: Services-owned [Frontend Starter Application](frontend-starter-app.md) also has a pipeline there.

The supplied screenshot contained 20 application names, including six `-sc` variants. Detail pages preserve these mappings; reviewed source also contains sources-ui, user-preferences-frontend (including `-sc`), and platform-settings-ui pipelines absent from that screenshot. The screenshot-only better-platform-docs application is recorded in [Legacy UI-Associated Implementations](legacy-ui-implementations.md#better-platform-docs), with live state unverified.

Standard and `-sc` applications belong to the same logical component; reviewed `-sc` pipelines select the `security-compliance` branch. Pipeline configuration does not prove current application existence, deployed image, production rollout, or completed migration. Verify live Konflux and deployment/release configuration for operational work.

## Relationship to Frontend Deployment & Delivery

**Role:** Associated configuration.

Deployment/environment resources relate to this group. Build-time CI and shared-package publishing configuration stay associated with their respective tooling; this is not a single deployed service or an assignment of shared-platform ownership.

[System group and producer/consumer boundaries](frontend-deployment-delivery.md).
