# Frontend Development Tooling

**Owner:** Services  
**Reviewed:** 2026-10-20

[Component index](../component-catalog.md)

## What it provides

Shared tooling and guidance for starting and building frontend applications, running local development and E2E environments, and reusing CI automation across repositories.

## Backing repositories and responsibilities

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [Frontend Build Tooling](insights-frontend-builder-common.md) | [insights-frontend-builder-common](https://github.com/RedHatInsights/insights-frontend-builder-common) | Shared frontend build and container-packaging scripts. |
| [Local Development Proxy](frontend-development-proxy.md) | [frontend-development-proxy](https://github.com/RedHatInsights/frontend-development-proxy) | Configurable proxy for local development and E2E environments. |
| [Shared CI Workflows](shared-workflows.md) | [shared-workflows](https://github.com/RedHatInsights/shared-workflows) | Reusable GitHub Actions workflows, supporting scripts, PR templates, and Renovate presets. |
| [Frontend Starter Application](frontend-starter-app.md) | [frontend-starter-app](https://github.com/RedHatInsights/frontend-starter-app) | Starter application and frontend-platform integration examples. |
| [Frontend Experience Documentation](frontend-experience-docs.md) | [frontend-experience-docs](https://github.com/RedHatInsights/frontend-experience-docs) | Cross-component architecture, onboarding, and navigation to repository-owned documentation; published through Inscope. |

## Capability boundaries

This component groups application scaffolding, shared build, local proxy, CI tooling, and developer documentation. Frontend Experience Documentation retains its cross-component architecture and onboarding scope. The backing records retain each repository's responsibilities, lifecycle, and ownership evidence.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Operational contacts and escalation policies remain recorded in the backing implementation pages.

- **Build and deployment platforms:** Konflux/Tekton, Quay, app-interface, and release-data automation remain shared-platform dependencies. See [Frontend Build Tooling](insights-frontend-builder-common.md) and [Shared CI Workflows](shared-workflows.md).
- **Related developer tooling:** Debugging, component documentation, and test integrations are referenced by [Local Development Proxy](frontend-development-proxy.md).
- **Images and deployment configuration:** [Frontend Builder Image](frontend-build-container.md), [Frontend Runtime Image](caddy-ubi.md), and [Deployment and Release Configuration](deployment-release-configuration.md) have separate stewardship records.
- **Documentation publishing:** Shared Inscope platform owners provide the publishing platform referenced by [Frontend Experience Documentation](frontend-experience-docs.md).
