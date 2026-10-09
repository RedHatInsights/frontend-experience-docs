# Deployment and Release Configuration

**Implementation ID:** X08  
**Stewardship owner:** Services for its configuration resources; shared platform owners for deployment automation. Exact resource ownership needs confirmation.  
**Status:** Ownership pending  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

Services-managed application, deployment, pipeline, and recovery configuration in shared infrastructure repositories. Record ownership per configuration resource; the hosting platforms are dependencies.

## Backing sources

- [app-interface](https://gitlab.cee.redhat.com/service/app-interface/-/tree/master/data/services/insights) and [Konflux release-data](https://gitlab.cee.redhat.com/releng/konflux-release-data/-/tree/main) configuration

## Evidence and ownership

This is a stewardship or integration record. The owner and source evidence above distinguish Services integration from upstream project/platform ownership. Current stewardship remains unconfirmed where marked.

- Current resource/image owners and consumers: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **Konflux/Tekton, Quay, app-interface and release-data automation** — Shared build/registry/deployment platform owners. [Konflux](https://konflux-ci.dev/), [app-interface](https://gitlab.cee.redhat.com/service/app-interface), [release-data](https://gitlab.cee.redhat.com/releng/konflux-release-data).
