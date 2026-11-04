# User Preferences UI

**Accountable team:** UI<br>
**Type:** Frontend application<br>
**Status:** Tracked<br>
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Schema-driven forms for users to configure application preferences, using Data Driven Forms and application-supplied configuration.

## Backing repository

- [user-preferences-frontend](https://github.com/RedHatInsights/user-preferences-frontend)

## Responsibility boundaries

UI owns preference-editing screens. Shell-level user configuration and backend persistence are separate from this frontend. [Platform Settings](platform-settings-ui.md) consolidates preferences; this repository remains unarchived with build configuration.

## Dependencies and supporting responsibilities

- **Application/backend owners:** Preference schemas, defaults, validation, and persistence.
- **Services:** Shared shell/runtime integration; [Data Driven Forms](data-driven-forms.md) stewardship is separately recorded.
- **UI:** Consolidated settings migration.

## Evidence and ownership

UI portfolio inclusion is evidenced by the [UI team repository assignments](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories), reviewed on 2026-10-23. This identifies repository scope; it does not establish exclusive operational ownership. UI means Platform Experience UI; Services means Platform Experience Services / Console Framework.

- **Reviewed source:** [Repository README](https://github.com/RedHatInsights/user-preferences-frontend/blob/d48508453cf73d1a6309b05ea6a0fbbee8ab8dc2/README.md).
- **Reviewed repository tree:** [Pinned implementation](https://github.com/RedHatInsights/user-preferences-frontend/tree/d48508453cf73d1a6309b05ea6a0fbbee8ab8dc2).
- **Operational contact and escalation policy:** To confirm.

Implementation guides and runbooks stay in the backing repository. Repository status is not proof of production deployment or migration completion.

## Build and release configuration

The table records source configuration, not live rollout status. UI namespace is `rh-platform-experien-tenant`; namespace identifies build/release scope rather than repository-wide component accountability.

| Konflux application | Namespace | Branch | Pipeline source |
|---------------------|-----------|--------|-----------------|
| [user-preferences-frontend](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/user-preferences-frontend) | `rh-platform-experien-tenant` | `master` | [Pipeline](https://github.com/RedHatInsights/user-preferences-frontend/blob/d48508453cf73d1a6309b05ea6a0fbbee8ab8dc2/.tekton/user-preferences-frontend-push.yaml) |
| [user-preferences-frontend-sc](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/user-preferences-frontend-sc) | `rh-platform-experien-tenant` | `security-compliance` | [Pipeline](https://github.com/RedHatInsights/user-preferences-frontend/blob/d48508453cf73d1a6309b05ea6a0fbbee8ab8dc2/.tekton/user-preferences-frontend-sc-push.yaml) |

The `-sc` application builds the `security-compliance` branch of the same logical component; it is not a separate catalog component.

Output-image destinations and Dockerfile/build-context parameters are recorded in the linked pipelines. Verify deployed image and environment in release configuration before making operational changes.
