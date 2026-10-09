# Report Scheduling UI

**Implementation ID:** S17  
**Owner:** Services (portfolio ownership).  
**Type:** Frontend application / federated module  
**Status:** Tracked  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

Scheduled report-delivery configuration and shell integration; scheduler backend ownership is separate.

## Backing repository

- [scheduler-ui](https://github.com/RedHatInsights/scheduler-ui)

## Capabilities

- [F21: Scheduler UI](#f21)

## Evidence and ownership

Portfolio inclusion was reviewed against the [Services team assignments](https://github.com/orgs/RedHatInsights/teams/experience-services-committers/repositories) on 2026-10-09. Services means Platform Experience Services / Console Framework.

Operational contact and escalation policy: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Capability boundaries

<a id="f21"></a>

### Scheduler UI

**Capability ID:** F21

Frontend and drawer integration are Services entries; backend owner must be referenced.

## Dependencies and owner references

- **Scheduler and service-account management backends** — Scheduler and identity/service-account backend owners to confirm. [Scheduler UI](https://github.com/RedHatInsights/scheduler-ui), [Service Accounts UI](https://github.com/RedHatInsights/service-accounts).
