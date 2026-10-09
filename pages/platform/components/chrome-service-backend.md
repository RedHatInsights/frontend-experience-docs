# Chrome Backend

**Implementation ID:** S02  
**Owner:** Services (portfolio ownership).  
**Type:** Backend service  
**Status:** Tracked  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

User configuration/preferences, generated configuration and search-index processing/serving, integration metadata, and browser-event WebSocket bridge.

## Backing repository

- [chrome-service-backend](https://github.com/RedHatInsights/chrome-service-backend)

## Capabilities

- [F01: Chrome service / shell](chrome-service.md#f01)
- [F04: Dynamic navigation infrastructure](dynamic-navigation.md#f04)
- [F06: Search](search.md#f06)
- [F20: Analytics integration](analytics-integration.md#f20)
- [F23: Browser events](chrome-service.md#f23)
- [F27: Favorites, recently visited services, personalization](chrome-service.md#f27)
- [F30: Preview and feature-flag integration](feature-flags.md#f30)

## Evidence and ownership

Portfolio inclusion was reviewed against the [Services team assignments](https://github.com/orgs/RedHatInsights/teams/experience-services-committers/repositories) on 2026-10-09. Services means Platform Experience Services / Console Framework.

Operational contact and escalation policy: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **Notification backend and event producers** — Notification/event-service owner to confirm; shell relay/drawer ownership does not imply producer ownership. [WebSocket documentation](https://github.com/RedHatInsights/chrome-service-backend/blob/main/docs/websocket.md).
- **PostgreSQL / managed database services** — Database infrastructure owners and individual application data owners. [Application metadata](https://gitlab.cee.redhat.com/service/app-interface/-/tree/master/data/services/insights).
- **Kafka and messaging infrastructure** — Messaging platform and event-producer owners; confirm actual topics/configuration per deployment. [Browser events](https://github.com/RedHatInsights/chrome-service-backend/blob/main/docs/websocket.md), [PDF generator](https://github.com/RedHatInsights/pdf-generator).
- **Segment, Amplitude, Adobe/DPAL, Pendo, and Intercom** — Vendor platforms and internal account/configuration owners; confirm ownership per source/destination. [Analytics guidance](../../services/Frontend_components/analytics/index.md), [validation POC](https://github.com/RedHatInsights/analytics-e2e-flow-verification-tooling).
- **UI integration:** [notifications-frontend](https://github.com/RedHatInsights/notifications-frontend) — Supplies notification drawer/bell modules hosted by [Console Shell](insights-chrome.md); events come from the upstream notification service.

## Lifecycle and history

- [dynamic-browser-events](https://github.com/RedHatInsights/dynamic-browser-events) is archived. Current shell/backend WebSocket integration is a separate implementation; remaining legacy deployment status needs confirmation.
