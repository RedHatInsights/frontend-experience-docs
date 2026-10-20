# HCC AI Assistant

**Implementation ID:** S20  
**Owner:** Services (portfolio ownership).  
**Type:** Backend service  
**Status:** Tracked  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

LightSpeed-based API/proxy, MCP tool discovery, and embedding/vector-storage services.

## Backing repository

- [hcc-ai-assistant](https://github.com/RedHatInsights/hcc-ai-assistant)

## Capabilities

- [F14: Virtual assistant](virtual-assistant.md#f14)

## Implementation context

The current S20 README describes Python subprocesses in one container and PostgreSQL/pgvector vector storage. Its July architecture summary's ChromaDB/sidecar description is not authoritative for this source revision. The relationship between S18, S19, and S20 must be documented per deployed integration; repository existence does not establish that one has completely replaced another.

## Evidence and ownership

Portfolio inclusion was reviewed against the [Services team assignments](https://github.com/orgs/RedHatInsights/teams/experience-services-committers/repositories) on 2026-10-09. Services means Platform Experience Services / Console Framework.

Operational contact and escalation policy: **To confirm**.

- **Reviewed source evidence:** [hcc-ai-assistant README](https://github.com/RedHatInsights/hcc-ai-assistant/blob/6e9875201a9abc1c8ac449995ac22d23985a8656/README.md)
- Frontend/backend mappings and migration status in each environment: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **PostgreSQL / managed database services** — Database infrastructure owners and individual application data owners. [Application metadata](https://gitlab.cee.redhat.com/service/app-interface/-/tree/master/data/services/insights).
- **Product AI services and Google Vertex AI** — Individual product/provider owners; Services owns its clients and integration services. [AI clients](https://github.com/RedHatInsights/ai-web-clients), [HCC AI service](https://github.com/RedHatInsights/hcc-ai-assistant).
- **Observability and operational tooling** — Prometheus/Grafana, Sentry, Splunk, Catchpoint, incident and test-reporting platform owners. Services owns component instrumentation/configuration where assigned. [Survival guide](https://docs.google.com/document/d/1BnGpJBFdCl6kmEW2TipJsGLg0m5Eukgpx7XYNClnwM4/edit?tab=t.0).
