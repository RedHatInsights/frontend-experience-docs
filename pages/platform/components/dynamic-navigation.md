# Dynamic Navigation Infrastructure

**Owner:** Services  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Collects application metadata and publishes navigation configuration.

## Backing repositories and responsibilities

The implementation records below describe the backing code, its broader responsibilities, lifecycle, and source evidence.

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [Frontend Operator](frontend-operator.md) | [frontend-operator](https://github.com/RedHatInsights/frontend-operator) | Frontend application/environment reconciliation, application metadata aggregation, deployment resources, and asset-publication orchestration. |
| [Chrome Backend](chrome-service-backend.md) | [chrome-service-backend](https://github.com/RedHatInsights/chrome-service-backend) | User configuration/preferences, generated configuration and search-index processing/serving, integration metadata, and browser-event WebSocket bridge. |
| [Frontend Configuration Publisher](frontend-config.md) | [frontend-config](https://github.com/RedHatInsights/frontend-config) | Intended extraction of generated configuration processing and S3 publication from Chrome backend. Reviewed source implements a health endpoint only. |
| [Frontend Environment Configuration](frontend-environments.md) | [frontend-environments](https://gitlab.cee.redhat.com/insights-platform/frontend-environments) | Environment configuration repository referenced by FEO app-interface metadata. Current owner and configuration-publication contract need confirmation. |
| [Console Shell](insights-chrome.md) | [insights-chrome](https://github.com/RedHatInsights/insights-chrome) | Masthead, navigation, authentication integration, micro-frontend hosting, public Chrome API, and shared shell state. |

## Capability boundaries

<a id="f04"></a>

### Dynamic navigation infrastructure

**Capability ID:** F04

Configuration generation/publication and consumption are distinct responsibilities; S04 is emerging.

Frontend configuration extraction is an emerging scaffold. Existing Chrome-backend generation/serving must remain explicit until publication and consumer migration are implemented.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Upstream providers and application owners retain their own boundaries. Confirm operational contacts and any unresolved stewardship or migration status with the relevant component owner.

The linked backing implementations carry pinned source evidence and implementation guidance. Relevant provider and owner references are listed below.

## Dependencies and owner references

- Frontend Operator aggregates application metadata; Chrome Backend currently processes/serves the generated outputs. [FEO migration guide](https://github.com/RedHatInsights/chrome-service-backend/blob/main/docs/feo-migration-guide.md).
- The planned publisher remains a scaffold. [Reviewed configuration scaffold](https://github.com/RedHatInsights/frontend-config/blob/2ee76247b8ea97328c8de981c7b36fce416a545b/src/main.ts).

## Lifecycle and history

- [cloud-services-config](https://github.com/RedHatInsights/cloud-services-config) is archived; current configuration generation/publication is described by the backing implementations.
