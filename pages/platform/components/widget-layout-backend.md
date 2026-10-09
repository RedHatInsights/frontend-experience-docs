# Widget Layout Backend

**Implementation ID:** S15  
**Owner:** Services (portfolio ownership).  
**Type:** Backend service  
**Status:** Tracked  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

Dashboard templates/layouts and widget mappings; includes a read-only TypeScript MCP sidecar.

## Backing repository

- [widget-layout-backend](https://github.com/RedHatInsights/widget-layout-backend)

## Related component

[Widget Layout Frontend (S09)](widget-layout.md).

## Capabilities

- [F17: Widget layout](widget-layout-system.md#f17)

## Evidence and ownership

Portfolio inclusion was reviewed against the [Services team assignments](https://github.com/orgs/RedHatInsights/teams/experience-services-committers/repositories) on 2026-10-09. Services means Platform Experience Services / Console Framework.

Operational contact and escalation policy: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **PostgreSQL / managed database services** — Database infrastructure owners and individual application data owners. [Application metadata](https://gitlab.cee.redhat.com/service/app-interface/-/tree/master/data/services/insights).
