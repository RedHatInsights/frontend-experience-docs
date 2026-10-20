# Frontend Asset Proxy

**Implementation ID:** S05  
**Owner:** Services (portfolio ownership).  
**Type:** Asset-serving service  
**Status:** Tracked  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

Go reverse proxy for S3-compatible frontend assets, including SPA entry-point fallback.

## Backing repository

- [frontend-asset-proxy](https://github.com/RedHatInsights/frontend-asset-proxy)

## Capabilities

- [F15: Push Cache / frontend asset delivery](push-cache.md#f15)

## Evidence and ownership

Portfolio inclusion was reviewed against the [Services team assignments](https://github.com/orgs/RedHatInsights/teams/experience-services-committers/repositories) on 2026-10-09. Services means Platform Experience Services / Console Framework.

Operational contact and escalation policy: **To confirm**.

- **Reviewed source evidence:** [frontend-asset-proxy README](https://github.com/RedHatInsights/frontend-asset-proxy/blob/884c4b1ad275575f27c6fd171e3cb830af06375e/README.md)

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **S3-compatible object storage and ValKey/Redis** — Shared storage/infrastructure owners; ownership and configured mode must be resolved per environment. [Asset pipeline](../asset-pipeline.md).
