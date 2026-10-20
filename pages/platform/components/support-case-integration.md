# Support Case Integration

**Owner:** Services integration; support systems upstream  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Hands application and user context into support-case workflows.

## Backing repositories and responsibilities

The implementation records below describe the backing code, its broader responsibilities, lifecycle, and source evidence.

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [Console Shell](insights-chrome.md) | [insights-chrome](https://github.com/RedHatInsights/insights-chrome) | Masthead, navigation, authentication integration, micro-frontend hosting, public Chrome API, and shared shell state. |
| [Chrome Backend](chrome-service-backend.md) | [chrome-service-backend](https://github.com/RedHatInsights/chrome-service-backend) | User configuration/preferences, generated configuration and search-index processing/serving, integration metadata, and browser-event WebSocket bridge. |

## Capability boundaries

<a id="f19"></a>

### Support-case integration

**Capability ID:** F19

Contextual case/session handoff; PCM and support backends have separate application boundaries.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Upstream providers and application owners retain their own boundaries. Confirm operational contacts and any unresolved stewardship or migration status with the relevant component owner.

The linked backing implementations carry pinned source evidence and implementation guidance. Relevant provider and owner references are listed below.

## Dependencies and owner references

- **Support/portal APIs, Hydra, marketplace/account services, and PCM** — Respective upstream application/service owners; Services owns shell integration. [Support-case configuration](https://github.com/RedHatInsights/chrome-service-backend/blob/main/docs/support-case-configuration.md).
