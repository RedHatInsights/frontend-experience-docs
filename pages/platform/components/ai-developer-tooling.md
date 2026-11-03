# AI Developer Tooling

**Owner:** Services  
**Reviewed:** 2026-10-23

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
- **Related bot instance:** [UI Developer Bot](hcc-ui-agent-dev.md) records the UI-owned runner and its separately reviewed framework source; verify the submodule pin rather than assuming both instances use the same framework revision.

## Team responsibility boundary

Services accountability includes platform-frontend-ai-toolkit and the framework bot. UI owns the separate [UI Developer Bot](hcc-ui-agent-dev.md) instance and its instance configuration.
