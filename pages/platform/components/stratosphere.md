# Stratosphere UX

**Record type:** Shell integration

Product-selection and marketplace/account-linking behavior is documented under [Console Shell](insights-chrome.md). Upstream marketplace/account services remain separate systems.

**Owner:** Services shell integration  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Marketplace/account-linking and product-selection experience.

<a id="backing-repositories-and-responsibilities"></a>

## Implementation and consumption relationships

| Related component | Relationship | Contribution to this capability |
|-------------------|--------------|---------------------------------|
| [Console Shell](insights-chrome.md) | Implements shell integration | Hosts product-selection and marketplace/account-linking interactions; consumes external account/product services. |

## Capability boundaries

<a id="f18"></a>

### Stratosphere UX

**Capability ID:** F18

Shell product-selection and marketplace/account-linking integration, not proof of upstream service ownership.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Upstream providers and application owners retain their own boundaries. Confirm operational contacts and any unresolved stewardship or migration status with the relevant component owner.

The linked backing implementations carry pinned source evidence and implementation guidance. Relevant provider and owner references are listed below.

## Dependencies and owner references

- **Marketplace/account services** — Upstream product/account service owners; current contacts need confirmation. Services owns the shell integration described in the [Chrome implementation](insights-chrome.md).
