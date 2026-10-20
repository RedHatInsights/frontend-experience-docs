# AI Developer Tooling

**Owner:** Services  
**Reviewed:** 2026-10-20

[Component index](../component-catalog.md)

## What it provides

Shared skills, prompts, and helpers for AI-assisted frontend development, together with framework-team developer-bot automation.

## Backing repositories and responsibilities

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [AI Development Toolkit](platform-frontend-ai-toolkit.md) | [platform-frontend-ai-toolkit](https://github.com/RedHatInsights/platform-frontend-ai-toolkit) | Skills, prompts, and helpers for AI-assisted frontend development. |
| [Framework Developer Bot](hcc-framework-agent-dev.md) | [hcc-framework-agent-dev](https://github.com/RedHatInsights/hcc-framework-agent-dev) | Framework-team developer-bot runner and instance-specific configuration. |

## Capability boundaries

This component groups developer-facing AI resources and framework-team bot automation. The backing records retain each repository's responsibilities, lifecycle, and ownership evidence.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Operational contacts and escalation policies remain recorded in the backing implementation pages.

- **Shared developer-agent framework:** [Framework Developer Bot](hcc-framework-agent-dev.md) consumes [Řehoř](https://github.com/OpenShift-Fleet/rehor). Current framework stewardship and support contracts need confirmation.
- **Related bot instance:** [hcc-ui-agent-dev](https://github.com/RedHatInsights/hcc-ui-agent-dev) is a sibling automation instance using Řehoř; its integration is recorded by [Framework Developer Bot](hcc-framework-agent-dev.md).
