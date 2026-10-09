# Asset Publication and Version Retention

**Implementation ID:** S06  
**Owner:** Services (portfolio ownership).  
**Type:** Asset-publication tooling  
**Status:** Tracked  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

Publishes/retrieves frontend assets, retains versions, and cleans up old records; supports S3 and ValKey/Redis modes.

## Backing repository

- [valpop](https://github.com/RedHatInsights/valpop)

## Capabilities

- [F15: Push Cache / frontend asset delivery](push-cache.md#f15)

## Evidence and ownership

Portfolio inclusion was reviewed against the [Services team assignments](https://github.com/orgs/RedHatInsights/teams/experience-services-committers/repositories) on 2026-10-09. Services means Platform Experience Services / Console Framework.

Operational contact and escalation policy: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **S3-compatible object storage and ValKey/Redis** — Shared storage/infrastructure owners; ownership and configured mode must be resolved per environment. [Asset pipeline](../asset-pipeline.md).
