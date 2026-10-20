# Frontend API and Quality Tooling

**Owner:** Services  
**Reviewed:** 2026-10-20

[Component index](../component-catalog.md)

## What it provides

Shared tooling for consuming backend APIs through generated JavaScript/TypeScript clients, testing client integrations and frontend applications, and checking repository security configuration.

## Backing repositories and responsibilities

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [Generated API Clients](javascript-clients.md) | [javascript-clients](https://github.com/RedHatInsights/javascript-clients) | JavaScript/TypeScript clients for backend OpenAPI specifications. |
| [API Client Integration Tests](javascript-clients-tests.md) | [javascript-clients-tests](https://github.com/RedHatInsights/javascript-clients-tests) | Integration tests for generated API clients. |
| [Frontend Test Helpers](frontend-test-utils.md) | [frontend-test-utils](https://github.com/RedHatInsights/frontend-test-utils) | Shared Playwright utilities and test helpers. |
| [Repository Security Scanner](frontend-repo-security-scanner.md) | [frontend-repo-security-scanner](https://github.com/RedHatInsights/frontend-repo-security-scanner) | Checks repository settings, GitHub Actions, branch protection, and related build configuration. |

## Capability boundaries

This component groups generated API clients, client integration tests, shared frontend test utilities, and repository security checks. The backing records retain each repository's responsibilities, lifecycle, and ownership evidence.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Operational contacts and escalation policies remain recorded in the backing implementation pages.

- **Source hosting and package distribution:** GitHub/GitLab, npm, and package distribution owners are referenced by [Generated API Clients](javascript-clients.md) and [Repository Security Scanner](frontend-repo-security-scanner.md).
- **Related test tooling:** Debugging, component documentation, and test integrations are referenced by [Frontend Test Helpers](frontend-test-utils.md).
- **Build and CI integration:** [Frontend Development Tooling](frontend-development-tooling.md) groups the build scripts, local proxy, and shared CI workflows used alongside these tools.
