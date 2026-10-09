# PDF Report Generation

**Implementation ID:** S14  
**Owner:** Services (portfolio ownership).  
**Type:** Backend service  
**Status:** Tracked  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

Generates PDF reports for consuming applications.

## Backing repository

- [pdf-generator](https://github.com/RedHatInsights/pdf-generator)

## Capabilities

- [F11: PDF generation](#f11)

## Evidence and ownership

Portfolio inclusion was reviewed against the [Services team assignments](https://github.com/orgs/RedHatInsights/teams/experience-services-committers/repositories) on 2026-10-09. Services means Platform Experience Services / Console Framework.

Operational contact and escalation policy: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Capability boundaries

<a id="f11"></a>

### PDF generation

**Capability ID:** F11

The deprecated frontend-components PDF package is a different implementation.

## Dependencies and owner references

- **Kafka and messaging infrastructure** — Messaging platform and event-producer owners; confirm actual topics/configuration per deployment. [Browser events](https://github.com/RedHatInsights/chrome-service-backend/blob/main/docs/websocket.md), [PDF generator](https://github.com/RedHatInsights/pdf-generator).

## Lifecycle and history

- The old [frontend-components PDF package](../../services/Frontend_components/migrations/pdf-generator.md) is deprecated; the PDF backend is a distinct implementation.
