# Landing Page

**Accountable team:** UI<br>
**Type:** Frontend application<br>
**Status:** Tracked<br>
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Console landing-page frontend and dashboard entry experience, including favorite-services widget coverage.

## Backing repository

- [landing-page-frontend](https://github.com/RedHatInsights/landing-page-frontend)

## Responsibility boundaries

UI is accountable for the landing-page application. Services owns the [Widget Layout](widget-layout-system.md) system and [Chrome Service](chrome-service.md) integration surface. A widget appearing on this page does not transfer its backing service ownership.

## Dependencies and supporting responsibilities

- **Services:** Shared shell and widget-layout infrastructure.
- **Favorites:** [Pinned Playwright coverage](https://github.com/RedHatInsights/landing-page-frontend/blob/4b38bccfafd7c8b1f19baf5db87b82111d0b963e/playwright/e2e/favorite-services-widget.spec.ts) establishes a landing-page consumer; it does not establish ownership of all favorites persistence.
- **Product trials:** Historical integration scope is tracked in [Product Trials Integration](product-trials-integration.md).

## Evidence and ownership

UI portfolio inclusion is evidenced by the [UI team repository assignments](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories), reviewed on 2026-10-23. This identifies repository scope; it does not establish exclusive operational ownership. UI means Platform Experience UI; Services means Platform Experience Services / Console Framework.

- **Reviewed source:** [Repository README](https://github.com/RedHatInsights/landing-page-frontend/blob/4b38bccfafd7c8b1f19baf5db87b82111d0b963e/README.md).
- **Reviewed repository tree:** [Pinned implementation](https://github.com/RedHatInsights/landing-page-frontend/tree/4b38bccfafd7c8b1f19baf5db87b82111d0b963e).
- **Operational contact and escalation policy:** To confirm.

Implementation guides and runbooks stay in the backing repository. Repository status is not proof of production deployment or migration completion.

## Build and release configuration

The table records source configuration, not live rollout status. UI namespace is `rh-platform-experien-tenant`; namespace identifies build/release scope rather than repository-wide component accountability.

| Konflux application | Namespace | Branch | Pipeline source |
|---------------------|-----------|--------|-----------------|
| [landing-page-frontend](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/landing-page-frontend) | `rh-platform-experien-tenant` | `master` | [Pipeline](https://github.com/RedHatInsights/landing-page-frontend/blob/4b38bccfafd7c8b1f19baf5db87b82111d0b963e/.tekton/landing-page-frontend-push.yaml) |
| [landing-page-frontend-sc](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/landing-page-frontend-sc) | `rh-platform-experien-tenant` | `security-compliance` | [Pipeline](https://github.com/RedHatInsights/landing-page-frontend/blob/4b38bccfafd7c8b1f19baf5db87b82111d0b963e/.tekton/landing-page-frontend-sc-push.yaml) |

The `-sc` application builds the `security-compliance` branch of the same logical component; it is not a separate catalog component.

Output-image destinations and Dockerfile/build-context parameters are recorded in the linked pipelines. Verify deployed image and environment in release configuration before making operational changes.
