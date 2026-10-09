# AI Web Clients

**Implementation ID:** S11  
**Owner:** Services (portfolio ownership).  
**Type:** Client-library monorepo  
**Status:** Tracked  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

AI API clients, streaming contracts, conversation state, and React bindings.

## Backing repository

- [ai-web-clients](https://github.com/RedHatInsights/ai-web-clients)

## Packages

The reviewed source contains **9 package directories**:

- `arh-client`
- `lightspeed-client`
- `ansible-lightspeed`
- `aai-client`
- `rhel-lightspeed-client`
- `mas-client`
- `ai-client-common`
- `ai-client-state`
- `ai-react-state`

These are source directories; publication and deployment status are separate inventory facts.

## Capabilities

- [F14: Virtual assistant](virtual-assistant.md#f14)

## Evidence and ownership

Portfolio inclusion was reviewed against the [Services team assignments](https://github.com/orgs/RedHatInsights/teams/experience-services-committers/repositories) on 2026-10-09. Services means Platform Experience Services / Console Framework.

Operational contact and escalation policy: **To confirm**.

- **Reviewed source evidence:** [ai-web-clients packages](https://github.com/RedHatInsights/ai-web-clients/tree/660326ee16504e90567ecd7df13f2c63856e61c7/packages)

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **Product AI services and Google Vertex AI** — Individual product/provider owners; Services owns its clients and integration services. [AI clients](https://github.com/RedHatInsights/ai-web-clients), [HCC AI service](https://github.com/RedHatInsights/hcc-ai-assistant).
- **GitHub/GitLab, npm and package distribution** — Hosting/registry operators and individual repository/package maintainers.
