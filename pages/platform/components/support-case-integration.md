# Support Case Integration

**Record type:** Shell/backend integration

Shell/backend adapters hand user and application context into upstream support workflows. The upstream support application is a dependency, not another implementation of Chrome.

**Owner:** Services integration; support systems upstream  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Hands application and user context into support-case workflows.

<a id="backing-repositories-and-responsibilities"></a>

## Implementation and consumption relationships

| Related component | Relationship | Contribution to this capability |
|-------------------|--------------|---------------------------------|
| [Console Shell](insights-chrome.md) | Implements frontend integration | Collects context and initiates contextual support-case/session handoff. |
| [Chrome Backend](chrome-service-backend.md) | Provides integration metadata/configuration | Supplies backend-side support integration configuration; does not implement the upstream case-management application. |

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
