# Stratosphere UX

**Owner:** Services shell integration  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Marketplace/account-linking and product-selection experience.

## Backing repositories and responsibilities

The implementation records below describe the backing code, its broader responsibilities, lifecycle, and source evidence.

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [Console Shell](insights-chrome.md) | [insights-chrome](https://github.com/RedHatInsights/insights-chrome) | Masthead, navigation, authentication integration, micro-frontend hosting, public Chrome API, and shared shell state. |

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
