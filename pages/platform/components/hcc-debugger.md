# HCC Debugger

**Accountable team:** UI<br>
**Type:** Developer tooling<br>
**Status:** Tracked<br>
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Debugging UI for console modules, including feature flags, entitlements, roles/permissions, and active-module information.

## Backing repository

- [hcc-debugger](https://github.com/RedHatInsights/hcc-debugger)

## Responsibility boundaries

UI owns the debugging application. Services remains accountable for the shell APIs and platform integrations inspected by the tool.

## Dependencies and supporting responsibilities

- **Services:** Chrome APIs, runtime module information, and shared feature-flag integration.
- **Identity and application owners:** Source data and authorization boundaries inspected by the debugger.

## Evidence and ownership

UI portfolio inclusion is evidenced by the [UI team repository assignments](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories), reviewed on 2026-10-23. This identifies repository scope; it does not establish exclusive operational ownership. UI means Platform Experience UI; Services means Platform Experience Services / Console Framework.

- **Reviewed source:** [Repository README](https://github.com/RedHatInsights/hcc-debugger/blob/f2aa810de847e5b32f8e3cb3e645c224b4f6a70d/README.md).
- **Reviewed repository tree:** [Pinned implementation](https://github.com/RedHatInsights/hcc-debugger/tree/f2aa810de847e5b32f8e3cb3e645c224b4f6a70d).
- **Operational contact and escalation policy:** To confirm.

Implementation guides and runbooks stay in the backing repository. Repository status is not proof of production deployment or migration completion.

## Build and release configuration

The table records source configuration, not live rollout status. UI namespace is `rh-platform-experien-tenant`; namespace identifies build/release scope rather than repository-wide component accountability.

| Konflux application | Namespace | Branch | Pipeline source |
|---------------------|-----------|--------|-----------------|
| [hcc-debugger](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/hcc-debugger) | `rh-platform-experien-tenant` | `master` | [Pipeline](https://github.com/RedHatInsights/hcc-debugger/blob/f2aa810de847e5b32f8e3cb3e645c224b4f6a70d/.tekton/hcc-debugger-push.yaml) |

Output-image destinations and Dockerfile/build-context parameters are recorded in the linked pipelines. Verify deployed image and environment in release configuration before making operational changes.
