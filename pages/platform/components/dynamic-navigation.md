# Frontend Configuration & Discovery

**Record type:** Cross-component flow

Historically called Dynamic Navigation Infrastructure. This flow belongs to [Frontend Deployment & Delivery](frontend-deployment-delivery.md), with participation from the separately recorded backend and shell. It is not a standalone navigation application or a claim that all participating repositories implement the same responsibility.

<a id="dynamic-navigation-infrastructure"></a>

**Owner:** Services  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Collects and aggregates application metadata, then connects configuration processing/serving to shell consumption. Includes module discovery, navigation definitions, service tiles, search metadata, and widget registrations.

<a id="backing-repositories-and-responsibilities"></a>

## Implementation and consumption relationships

| Related component | Relationship | Contribution to this capability |
|-------------------|--------------|---------------------------------|
| [Frontend Operator](frontend-operator.md) | Collects and aggregates | Reads application/environment resources and assembles module, navigation, service-tile, search, and widget metadata. |
| [Frontend Environment Configuration](frontend-environments.md) | Configuration input | Supplies environment settings; current stewardship and publication contract remain to confirm. |
| [Chrome Backend](chrome-service-backend.md) | Processes and serves | Currently handles generated configuration outputs; unrelated runtime APIs remain backend responsibilities. |
| [Console Shell](insights-chrome.md) | Consumes | Loads configuration to render navigation and discover application modules; does not reconcile frontend resources. |
| [Frontend Configuration Publisher](frontend-config.md) | Planned extraction; scaffold | Intended configuration processing/publication replacement. Reviewed source does not establish an operational replacement. |

## Capability boundaries

<a id="f04"></a>
<a id="dynamic-navigation-infrastructure_1"></a>

### Dynamic navigation infrastructure

**Capability ID:** F04

Configuration collection, processing/publication, and consumption are distinct responsibilities. The Frontend Configuration Publisher (S04) is emerging. Metadata includes more than navigation; search behavior, widget persistence, and application UI remain outside this flow.

Frontend configuration extraction is an emerging scaffold. Existing Chrome-backend generation/serving must remain explicit until publication and consumer migration are implemented.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Upstream providers and application owners retain their own boundaries. Confirm operational contacts and any unresolved stewardship or migration status with the relevant component owner.

The linked backing implementations carry pinned source evidence and implementation guidance. Relevant provider and owner references are listed below.

## Dependencies and owner references

- Frontend Operator aggregates application metadata; Chrome Backend currently processes/serves the generated outputs. [FEO migration guide](https://github.com/RedHatInsights/chrome-service-backend/blob/main/docs/feo-migration-guide.md).
- The planned publisher remains a scaffold. [Reviewed configuration scaffold](https://github.com/RedHatInsights/frontend-config/blob/2ee76247b8ea97328c8de981c7b36fce416a545b/src/main.ts).

## Lifecycle and history

- [cloud-services-config](https://github.com/RedHatInsights/cloud-services-config) is archived; current configuration generation/publication is described by the backing implementations.

## Producer-to-consumer flow

```text
Application metadata + environment configuration
    -> Frontend Operator (collection / aggregation)
    -> Chrome Backend (current processing / serving)
    -> Console Shell (consumption / rendering / application discovery)
```

This describes the logical responsibility flow, not a claim that every environment uses an identical transport or storage path. Follow implementation evidence for operational details.
