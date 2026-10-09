# Frontend Build Tooling

**Implementation ID:** S22  
**Owner:** Services (portfolio ownership).  
**Type:** Build tooling  
**Status:** Tracked  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

Shared frontend build and container-packaging scripts.

## Backing repository

- [insights-frontend-builder-common](https://github.com/RedHatInsights/insights-frontend-builder-common)

## Evidence and ownership

Portfolio inclusion was reviewed against the [Services team assignments](https://github.com/orgs/RedHatInsights/teams/experience-services-committers/repositories) on 2026-10-09. Services means Platform Experience Services / Console Framework.

Operational contact and escalation policy: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **Konflux/Tekton, Quay, app-interface and release-data automation** — Shared build/registry/deployment platform owners. [Konflux](https://konflux-ci.dev/), [app-interface](https://gitlab.cee.redhat.com/service/app-interface), [release-data](https://gitlab.cee.redhat.com/releng/konflux-release-data).

## Lifecycle and history

- [frontend-releaser](https://github.com/RedHatInsights/frontend-releaser) and [konflux-consoledot-frontend-build](https://github.com/RedHatInsights/konflux-consoledot-frontend-build) are archived. Use current pipeline configuration to establish the active release/build path.
