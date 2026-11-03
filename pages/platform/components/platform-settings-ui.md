# Platform Settings

**Accountable team:** UI<br>
**Type:** Frontend application<br>
**Status:** Consolidation; rollout to confirm<br>
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Consolidated platform-settings frontend combining notifications, sources, and user preferences. Deployment metadata includes settings overview, alert manager, event log, and data integrations.

## Backing repository

- [platform-settings-ui](https://github.com/RedHatInsights/platform-settings-ui)

## Responsibility boundaries

UI owns the consolidated application. Existing [Sources UI](sources-ui.md), [Notifications UI](notifications-frontend.md), and [User Preferences UI](user-preferences-frontend.md) remain identifiable capabilities and source repositories. Their retirement or full traffic migration is not established by consolidation alone.

## Dependencies and supporting responsibilities

- **Services:** Console shell and navigation integration.
- **Backend owners:** Notification delivery, source integration, and preference persistence remain distinct APIs.
- **Rollout:** [Frontend configuration](https://github.com/RedHatInsights/platform-settings-ui/blob/31c2240e13c827fbd84ff82c993c7e205ff5a93d/deploy/frontend.yaml) gates navigation behind `platform.settings.redesign`; verify current flags and release state.

## Evidence and ownership

UI portfolio inclusion is evidenced by the [UI team repository assignments](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories), reviewed on 2026-10-23. This identifies repository scope; it does not establish exclusive operational ownership. UI means Platform Experience UI; Services means Platform Experience Services / Console Framework.

- **Reviewed source:** [Repository README](https://github.com/RedHatInsights/platform-settings-ui/blob/31c2240e13c827fbd84ff82c993c7e205ff5a93d/README.md).
- **Reviewed repository tree:** [Pinned implementation](https://github.com/RedHatInsights/platform-settings-ui/tree/31c2240e13c827fbd84ff82c993c7e205ff5a93d).
- **Operational contact and escalation policy:** To confirm.

Implementation guides and runbooks stay in the backing repository. Repository status is not proof of production deployment or migration completion.

## Build and release configuration

The table records source configuration, not live rollout status. UI namespace is `rh-platform-experien-tenant`; namespace identifies build/release scope rather than repository-wide component accountability.

| Konflux application | Namespace | Branch | Pipeline source |
|---------------------|-----------|--------|-----------------|
| [platform-settings-ui](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/platform-settings-ui) | `rh-platform-experien-tenant` | `master` | [Pipeline](https://github.com/RedHatInsights/platform-settings-ui/blob/31c2240e13c827fbd84ff82c993c7e205ff5a93d/.tekton/platform-settings-ui-push.yaml) |

Output-image destinations and Dockerfile/build-context parameters are recorded in the linked pipelines. Verify deployed image and environment in release configuration before making operational changes.

**Branch drift:** The reviewed repository default branch is `main`, while the linked push pipeline targets `master`. Confirm the active build branch in Konflux before relying on this source configuration for releases.
