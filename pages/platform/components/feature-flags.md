# Feature Flags

**Owner:** Services proxy/integration; Unleash provider  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Evaluates feature availability for console users and applications.

## Backing repositories and responsibilities

The implementation records below describe the backing code, its broader responsibilities, lifecycle, and source evidence.

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [Console Shell](insights-chrome.md) | [insights-chrome](https://github.com/RedHatInsights/insights-chrome) | Masthead, navigation, authentication integration, micro-frontend hosting, public Chrome API, and shared shell state. |
| [Browser Feature-Flag Proxy](unleash-proxy.md) | [unleash-proxy](https://gitlab.cee.redhat.com/automation-analytics/unleash-proxy/-/tree/main) | Python/FastAPI server-side flag evaluation for browser clients through `/api/featureflags/v0`. |
| [Chrome Backend](chrome-service-backend.md) | [chrome-service-backend](https://github.com/RedHatInsights/chrome-service-backend) | User configuration/preferences, generated configuration and search-index processing/serving, integration metadata, and browser-event WebSocket bridge. |

## Capability boundaries

<a id="f30"></a>

### Preview and feature-flag integration

**Capability ID:** F30

Preview preferences and flag evaluation are different parts of the shell/platform contract.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Upstream providers and application owners retain their own boundaries. Confirm operational contacts and any unresolved stewardship or migration status with the relevant component owner.

The linked backing implementations carry pinned source evidence and implementation guidance. Relevant provider and owner references are listed below.

## Dependencies and owner references

- **Unleash flag-management platform** — Upstream Unleash instance/platform owner; Services owns [Browser Feature-Flag Proxy](unleash-proxy.md) integration. [Proxy source](https://gitlab.cee.redhat.com/automation-analytics/unleash-proxy).
- Chrome uses the browser proxy for flag evaluation. [Unleash outage policy](https://github.com/RedHatInsights/insights-chrome/blob/master/docs/navigation.md#unleash-outage-policy).
