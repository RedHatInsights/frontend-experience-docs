# Service Account Management

**Implementation ID:** S16  
**Owner:** Services (portfolio ownership).  
**Type:** Frontend application  
**Status:** Tracked  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

Service-account management UI; identity-provider/backend ownership is separate.

## Backing repository

- [service-accounts](https://github.com/RedHatInsights/service-accounts)

## Evidence and ownership

Portfolio inclusion was reviewed against the [Services team assignments](https://github.com/orgs/RedHatInsights/teams/experience-services-committers/repositories) on 2026-10-09. Services means Platform Experience Services / Console Framework.

Operational contact and escalation policy: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **Red Hat SSO / OIDC** — Authentication/identity service owners; Services owns integration behavior. [Auth architecture](../navigation-and-auth.md).
- **Scheduler and service-account management backends** — Scheduler and identity/service-account backend owners to confirm. [Scheduler UI](https://github.com/RedHatInsights/scheduler-ui), [Service Accounts UI](https://github.com/RedHatInsights/service-accounts).
