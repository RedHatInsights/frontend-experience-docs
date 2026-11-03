# Payload Tracker UI

**Accountable team:** UI<br>
**Type:** Frontend application<br>
**Status:** Tracked<br>
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Internal frontend for viewing payload-tracking data, payloads, and processing statuses exposed by the Payload Tracker Service.

## Backing repository

- [payload-tracker-frontend](https://github.com/RedHatInsights/payload-tracker-frontend)

## Responsibility boundaries

UI owns the frontend. Payload Tracker API behavior, data ingestion, and retention are backend responsibilities; this record does not assign those to UI.

## Dependencies and supporting responsibilities

- **Payload Tracker Service owners:** REST API and tracking data; contact to confirm.
- **Hosting/platform owners:** Deployment environment and shared infrastructure; validate against current release configuration.

## Evidence and ownership

UI portfolio inclusion is evidenced by the [UI team repository assignments](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories), reviewed on 2026-10-23. This identifies repository scope; it does not establish exclusive operational ownership. UI means Platform Experience UI; Services means Platform Experience Services / Console Framework.

- **Reviewed source:** [Repository README](https://github.com/RedHatInsights/payload-tracker-frontend/blob/f2b7a390880a737464643e0c8e1c714874460e15/README.md).
- **Reviewed repository tree:** [Pinned implementation](https://github.com/RedHatInsights/payload-tracker-frontend/tree/f2b7a390880a737464643e0c8e1c714874460e15).
- **Operational contact and escalation policy:** To confirm.

Implementation guides and runbooks stay in the backing repository. Repository status is not proof of production deployment or migration completion.

## Build and release configuration

The table records source configuration, not live rollout status. UI namespace is `rh-platform-experien-tenant`; namespace identifies build/release scope rather than repository-wide component accountability.

| Konflux application | Namespace | Branch | Pipeline source |
|---------------------|-----------|--------|-----------------|
| [payload-tracker-frontend](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/payload-tracker-frontend) | `rh-platform-experien-tenant` | `master` | [Pipeline](https://github.com/RedHatInsights/payload-tracker-frontend/blob/f2b7a390880a737464643e0c8e1c714874460e15/.tekton/payload-tracker-frontend-push.yaml) |
| [payload-tracker-frontend-sc](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/payload-tracker-frontend-sc) | `rh-platform-experien-tenant` | `security-compliance` | [Pipeline](https://github.com/RedHatInsights/payload-tracker-frontend/blob/f2b7a390880a737464643e0c8e1c714874460e15/.tekton/payload-tracker-frontend-sc-push.yaml) |

The `-sc` application builds the `security-compliance` branch of the same logical component; it is not a separate catalog component.

Output-image destinations and Dockerfile/build-context parameters are recorded in the linked pipelines. Verify deployed image and environment in release configuration before making operational changes.
