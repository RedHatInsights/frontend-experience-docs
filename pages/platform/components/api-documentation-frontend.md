# Developer API Catalog

**Accountable team:** UI<br>
**Type:** Frontend application<br>
**Status:** Tracked<br>
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Public API catalog at developers.redhat.com/api-catalog, including the Next.js application, discovery metadata, API-content transformation, sitemap, and search-index generation.

## Backing repository

- [api-documentation-frontend](https://github.com/RedHatInsights/api-documentation-frontend)

## Responsibility boundaries

UI owns the application and repository-local content-generation pipeline. The legacy “API Catalog backend” label describes this generation scope; no separate backend ownership is established by the reviewed repository. Console API browsing is a separate [Console API UI](api-frontend.md).

## Dependencies and supporting responsibilities

- **API providers:** Supply API specifications and metadata.
- **developers.redhat.com / SPAship owners:** Provide site chrome and publishing platform; UI owns the catalog application integration.
- **Search platform:** Consumes generated canonical metadata; search service ownership is separate.
- **Delivery:** README describes Konflux image build followed by GitLab CI and SPAship deployment; verify current environment configuration in those systems.

## Evidence and ownership

UI portfolio inclusion is evidenced by the [UI team repository assignments](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories), reviewed on 2026-10-23. This identifies repository scope; it does not establish exclusive operational ownership. UI means Platform Experience UI; Services means Platform Experience Services / Console Framework.

- **Reviewed source:** [Repository README](https://github.com/RedHatInsights/api-documentation-frontend/blob/49666b66ff0a826f97e40aab1a03c7ae9b1a405d/README.md).
- **Reviewed repository tree:** [Pinned implementation](https://github.com/RedHatInsights/api-documentation-frontend/tree/49666b66ff0a826f97e40aab1a03c7ae9b1a405d).
- **Operational contact and escalation policy:** To confirm.

Implementation guides and runbooks stay in the backing repository. Repository status is not proof of production deployment or migration completion.

## Build and release configuration

The table records source configuration, not live rollout status. UI namespace is `rh-platform-experien-tenant`; namespace identifies build/release scope rather than repository-wide component accountability.

| Konflux application | Namespace | Branch | Pipeline source |
|---------------------|-----------|--------|-----------------|
| [api-documentation-frontend](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/api-documentation-frontend) | `rh-platform-experien-tenant` | `main` | [Pipeline](https://github.com/RedHatInsights/api-documentation-frontend/blob/49666b66ff0a826f97e40aab1a03c7ae9b1a405d/.tekton/api-documentation-frontend-push.yaml) |

Output-image destinations and Dockerfile/build-context parameters are recorded in the linked pipelines. Verify deployed image and environment in release configuration before making operational changes.
