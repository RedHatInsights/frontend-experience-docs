# Console API UI

**Accountable team:** UI<br>
**Type:** Frontend application<br>
**Status:** Tracked<br>
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Console application for browsing API documentation in a single interface.

## Backing repository

- [api-frontend](https://github.com/RedHatInsights/api-frontend)

## Responsibility boundaries

UI owns this frontend. This is distinct from the [Developer API Catalog](api-documentation-frontend.md) on developers.redhat.com and the Services-owned [OCM API Gateway](uhc-gateway.md).

## Dependencies and supporting responsibilities

- **Services:** Console shell, frontend configuration, and platform API integration.
- **API providers:** Own API implementations, contracts, and availability; the frontend presents their documentation.

## Evidence and ownership

UI portfolio inclusion is evidenced by the [UI team repository assignments](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories), reviewed on 2026-10-23. This identifies repository scope; it does not establish exclusive operational ownership. UI means Platform Experience UI; Services means Platform Experience Services / Console Framework.

- **Reviewed source:** [Repository README](https://github.com/RedHatInsights/api-frontend/blob/d4c5f4c234b307ae4e034fb78b47fc2bd4129d77/README.md).
- **Reviewed repository tree:** [Pinned implementation](https://github.com/RedHatInsights/api-frontend/tree/d4c5f4c234b307ae4e034fb78b47fc2bd4129d77).
- **Operational contact and escalation policy:** To confirm.

Implementation guides and runbooks stay in the backing repository. Repository status is not proof of production deployment or migration completion.

## Build and release configuration

The table records source configuration, not live rollout status. UI namespace is `rh-platform-experien-tenant`; namespace identifies build/release scope rather than repository-wide component accountability.

| Konflux application | Namespace | Branch | Pipeline source |
|---------------------|-----------|--------|-----------------|
| [api-frontend](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/api-frontend) | `rh-platform-experien-tenant` | `master` | [Pipeline](https://github.com/RedHatInsights/api-frontend/blob/d4c5f4c234b307ae4e034fb78b47fc2bd4129d77/.tekton/api-frontend-push.yaml) |

Output-image destinations and Dockerfile/build-context parameters are recorded in the linked pipelines. Verify deployed image and environment in release configuration before making operational changes.
