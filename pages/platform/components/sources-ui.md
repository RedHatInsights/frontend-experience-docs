# Sources UI

**Accountable team:** UI<br>
**Type:** Frontend application<br>
**Status:** Tracked<br>
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Lists and manages cloud/data sources, application connections, and source/application pause-resume workflows.

## Backing repository

- [sources-ui](https://github.com/RedHatInsights/sources-ui)

## Responsibility boundaries

UI owns the frontend. The [Platform Settings](platform-settings-ui.md) repository contains the consolidated settings implementation; this repository remains unarchived with a build pipeline at review time. Runtime migration completion is to confirm.

## Dependencies and supporting responsibilities

- **Sources backend owners:** Source records, credentials, and integration behavior; contact to confirm.
- **Services:** Console shell and shared runtime integration.
- **UI:** Consolidated settings migration.

## Evidence and ownership

UI portfolio inclusion is evidenced by the [UI team repository assignments](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories), reviewed on 2026-10-23. This identifies repository scope; it does not establish exclusive operational ownership. UI means Platform Experience UI; Services means Platform Experience Services / Console Framework.

- **Reviewed source:** [Repository README](https://github.com/RedHatInsights/sources-ui/blob/90d88126f671a407f230338e701ddce936d3ad39/README.md).
- **Reviewed repository tree:** [Pinned implementation](https://github.com/RedHatInsights/sources-ui/tree/90d88126f671a407f230338e701ddce936d3ad39).
- **Operational contact and escalation policy:** To confirm.

Implementation guides and runbooks stay in the backing repository. Repository status is not proof of production deployment or migration completion.

## Build and release configuration

The table records source configuration, not live rollout status. UI namespace is `rh-platform-experien-tenant`; namespace identifies build/release scope rather than repository-wide component accountability.

| Konflux application | Namespace | Branch | Pipeline source |
|---------------------|-----------|--------|-----------------|
| [sources-ui](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/sources-ui) | `rh-platform-experien-tenant` | `master` | [Pipeline](https://github.com/RedHatInsights/sources-ui/blob/90d88126f671a407f230338e701ddce936d3ad39/.tekton/sources-ui-push.yaml) |

Output-image destinations and Dockerfile/build-context parameters are recorded in the linked pipelines. Verify deployed image and environment in release configuration before making operational changes.
