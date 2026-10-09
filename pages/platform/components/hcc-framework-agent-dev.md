# Framework Developer Bot

**Implementation ID:** S31  
**Owner:** Services (portfolio ownership).  
**Type:** Automation instance  
**Status:** Tracked  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

Framework-team developer-bot runner and instance-specific configuration.

## Backing repository

- [hcc-framework-agent-dev](https://github.com/RedHatInsights/hcc-framework-agent-dev)

## Implementation context

S31 consumes the shared [Řehoř framework](https://github.com/OpenShift-Fleet/rehor). The former `RedHatInsights/platform-frontend-ai-dev` repository URL redirects there; the framework is recorded as a dependency, not another repository in the Services team hierarchy.

## Evidence and ownership

Portfolio inclusion was reviewed against the [Services team assignments](https://github.com/orgs/RedHatInsights/teams/experience-services-committers/repositories) on 2026-10-09. Services means Platform Experience Services / Console Framework.

Operational contact and escalation policy: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **Řehoř shared developer-agent framework** — [OpenShift-Fleet/rehor](https://github.com/OpenShift-Fleet/rehor); former Services developer-bot URL redirects here. Confirm current stewardship/support contract.
- **UI integration:** [hcc-ui-agent-dev](https://github.com/RedHatInsights/hcc-ui-agent-dev) — Sibling automation instance using the shared Řehoř developer-agent framework.
