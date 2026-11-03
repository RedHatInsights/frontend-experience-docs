# Access Requests / TAM Tool

**Accountable team:** UI<br>
**Type:** Frontend application<br>
**Status:** Tracked<br>
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Frontend for Red Hat associates to request customer-account access for troubleshooting, with requester and approver views.

## Backing repository

- [access-requests-frontend](https://github.com/RedHatInsights/access-requests-frontend)

## Responsibility boundaries

UI owns the application and its federated list/detail views used by [RBAC UI](insights-rbac-ui.md). The historical TAM Tool name maps to this repository. Account access approval, authorization, and backend enforcement remain separate responsibilities.

## Dependencies and supporting responsibilities

- **UI:** RBAC UI consumes exported views.
- **Services:** Console hosting and authentication integration.
- **Access-request backend owners:** Request persistence, approval, and enforcement; contact to confirm.

## Evidence and ownership

UI portfolio inclusion is evidenced by the [UI team repository assignments](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories), reviewed on 2026-10-23. This identifies repository scope; it does not establish exclusive operational ownership. UI means Platform Experience UI; Services means Platform Experience Services / Console Framework.

- **Reviewed source:** [Repository README](https://github.com/RedHatInsights/access-requests-frontend/blob/f76a29230e731d1fec82f83ff877956668ea9ac4/README.md).
- **Reviewed repository tree:** [Pinned implementation](https://github.com/RedHatInsights/access-requests-frontend/tree/f76a29230e731d1fec82f83ff877956668ea9ac4).
- **Operational contact and escalation policy:** To confirm.

Implementation guides and runbooks stay in the backing repository. Repository status is not proof of production deployment or migration completion.

## Build and release configuration

The table records source configuration, not live rollout status. UI namespace is `rh-platform-experien-tenant`; namespace identifies build/release scope rather than repository-wide component accountability.

| Konflux application | Namespace | Branch | Pipeline source |
|---------------------|-----------|--------|-----------------|
| [access-requests-frontend](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/access-requests-frontend) | `rh-platform-experien-tenant` | `master` | [Pipeline](https://github.com/RedHatInsights/access-requests-frontend/blob/f76a29230e731d1fec82f83ff877956668ea9ac4/.tekton/access-requests-frontend-push.yaml) |
| [access-requests-frontend-sc](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/access-requests-frontend-sc) | `rh-platform-experien-tenant` | `security-compliance` | [Pipeline](https://github.com/RedHatInsights/access-requests-frontend/blob/f76a29230e731d1fec82f83ff877956668ea9ac4/.tekton/access-requests-frontend-sc-push.yaml) |

The `-sc` application builds the `security-compliance` branch of the same logical component; it is not a separate catalog component.

Output-image destinations and Dockerfile/build-context parameters are recorded in the linked pipelines. Verify deployed image and environment in release configuration before making operational changes.
