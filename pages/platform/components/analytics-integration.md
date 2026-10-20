# Analytics Integration

**Owner:** Services integration; vendor/account owners  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Shared analytics events, provider integration, and delivery validation.

## Backing repositories and responsibilities

The implementation records below describe the backing code, its broader responsibilities, lifecycle, and source evidence.

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [Console Shell](insights-chrome.md) | [insights-chrome](https://github.com/RedHatInsights/insights-chrome) | Masthead, navigation, authentication integration, micro-frontend hosting, public Chrome API, and shared shell state. |
| [Chrome Backend](chrome-service-backend.md) | [chrome-service-backend](https://github.com/RedHatInsights/chrome-service-backend) | User configuration/preferences, generated configuration and search-index processing/serving, integration metadata, and browser-event WebSocket bridge. |
| [Analytics Verification](analytics-e2e-flow-verification-tooling.md) | [analytics-e2e-flow-verification-tooling](https://github.com/RedHatInsights/analytics-e2e-flow-verification-tooling) | Checks browser analytics emission and selected destination receipt; direct Segment receipt remains unproven in the reviewed README. |

## Capability boundaries

<a id="f20"></a>

### Analytics integration

**Capability ID:** F20

Provider enablement varies by flags/configuration; POC validation does not establish universal delivery.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Upstream providers and application owners retain their own boundaries. Confirm operational contacts and any unresolved stewardship or migration status with the relevant component owner.

The linked backing implementations carry pinned source evidence and implementation guidance. Relevant provider and owner references are listed below.

## Dependencies and owner references

- **Segment, Amplitude, Adobe/DPAL, Pendo, and Intercom** — Vendor platforms and internal account/configuration owners; confirm ownership per source/destination. [Analytics guidance](../../services/Frontend_components/analytics/index.md), [validation POC](https://github.com/RedHatInsights/analytics-e2e-flow-verification-tooling).

## Lifecycle and history

- [pendo-config-automation](https://github.com/RedHatInsights/pendo-config-automation) is archived; this does not establish retirement of Pendo integration.
