# Notifications UI

**Accountable team:** UI<br>
**Type:** Frontend application<br>
**Status:** Tracked<br>
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Console application for notification configuration and related notification-management interfaces.

## Backing repository

- [notifications-frontend](https://github.com/RedHatInsights/notifications-frontend)

## Responsibility boundaries

UI owns notification configuration screens, not backend notification delivery. [Platform Settings](platform-settings-ui.md) consolidates this experience; this repository remains unarchived with standard and security-compliance pipelines.

## Dependencies and supporting responsibilities

- **Notification backend owners:** Event handling and delivery; contact to confirm.
- **Services:** Shared shell and platform integration.
- **UI:** Consolidated settings migration and related [User Preferences UI](user-preferences-frontend.md).

## Evidence and ownership

UI portfolio inclusion is evidenced by the [UI team repository assignments](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories), reviewed on 2026-10-23. This identifies repository scope; it does not establish exclusive operational ownership. UI means Platform Experience UI; Services means Platform Experience Services / Console Framework.

- **Reviewed source:** [Repository README](https://github.com/RedHatInsights/notifications-frontend/blob/a6d31e90d7d8cdbcc36bde7a1260111fd336a008/README.md).
- **Reviewed repository tree:** [Pinned implementation](https://github.com/RedHatInsights/notifications-frontend/tree/a6d31e90d7d8cdbcc36bde7a1260111fd336a008).
- **Operational contact and escalation policy:** To confirm.

Implementation guides and runbooks stay in the backing repository. Repository status is not proof of production deployment or migration completion.

## Build and release configuration

The table records source configuration, not live rollout status. UI namespace is `rh-platform-experien-tenant`; namespace identifies build/release scope rather than repository-wide component accountability.

| Konflux application | Namespace | Branch | Pipeline source |
|---------------------|-----------|--------|-----------------|
| [notifications-frontend](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/notifications-frontend) | `rh-platform-experien-tenant` | `master` | [Pipeline](https://github.com/RedHatInsights/notifications-frontend/blob/a6d31e90d7d8cdbcc36bde7a1260111fd336a008/.tekton/notifications-frontend-push.yaml) |
| [notifications-frontend-sc](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/notifications-frontend-sc) | `rh-platform-experien-tenant` | `security-compliance` | [Pipeline](https://github.com/RedHatInsights/notifications-frontend/blob/a6d31e90d7d8cdbcc36bde7a1260111fd336a008/.tekton/notifications-frontend-sc-push.yaml) |

The `-sc` application builds the `security-compliance` branch of the same logical component; it is not a separate catalog component.

Output-image destinations and Dockerfile/build-context parameters are recorded in the linked pipelines. Verify deployed image and environment in release configuration before making operational changes.
