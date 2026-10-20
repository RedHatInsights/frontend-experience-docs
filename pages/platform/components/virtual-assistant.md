# Virtual Assistant

**Owner:** Services  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Shared conversational assistance and AI integrations.

## Backing repositories and responsibilities

The implementation records below describe the backing code, its broader responsibilities, lifecycle, and source evidence.

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [Virtual Assistant Frontend](astro-virtual-assistant-frontend.md) | [astro-virtual-assistant-frontend](https://github.com/RedHatInsights/astro-virtual-assistant-frontend) | Virtual-assistant chat experience and integration layer. |
| [Astro Assistant Backend](astro-virtual-assistant-v2.md) | [astro-virtual-assistant-v2](https://github.com/RedHatInsights/astro-virtual-assistant-v2) | Astro virtual-assistant backend; documented successor to the archived v1 codebase. |
| [HCC AI Assistant](hcc-ai-assistant.md) | [hcc-ai-assistant](https://github.com/RedHatInsights/hcc-ai-assistant) | LightSpeed-based API/proxy, MCP tool discovery, and embedding/vector-storage services. |
| [AI Web Clients](ai-web-clients.md) | [ai-web-clients](https://github.com/RedHatInsights/ai-web-clients) | AI API clients, streaming contracts, conversation state, and React bindings. |

## Capability boundaries

<a id="f14"></a>

### Virtual assistant

**Capability ID:** F14

Preserve implementation-specific boundaries and upstream AI dependencies.

Astro, the frontend integration, and HCC AI assistant remain separate implementations. Record selected frontend/backend mappings per environment; replacement or migration completion is not established by repository existence.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Upstream providers and application owners retain their own boundaries. Confirm operational contacts and any unresolved stewardship or migration status with the relevant component owner.

The linked backing implementations carry pinned source evidence and implementation guidance. Relevant provider and owner references are listed below.

## Dependencies and owner references

- **PatternFly, Quickstarts, and shared PatternFly extensions** — [PatternFly](https://github.com/patternfly), [React Component Groups](https://github.com/patternfly/react-component-groups), [React Data View](https://github.com/patternfly/react-data-view), [ChatBot](https://github.com/patternfly/chatbot). Confirm team-specific extension stewardship.
- **Product AI services and Google Vertex AI** — Individual product/provider owners; Services owns its clients and integration services. [AI clients](https://github.com/RedHatInsights/ai-web-clients), [HCC AI service](https://github.com/RedHatInsights/hcc-ai-assistant).
- Frontend/client/backend mappings depend on the selected experience and environment. Confirm migration status rather than inferring replacement from repository existence.
