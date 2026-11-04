# Widget Layout Frontend

**Implementation ID:** S09  
**Accountable team:** Services<br>
**Type:** Frontend / library  
**Status:** Tracked  
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Dashboard widget rendering, layout composition, and drag-and-drop utilities.

## Backing repository

- [widget-layout](https://github.com/RedHatInsights/widget-layout)

## Related component

[Widget Layout Backend (S15)](widget-layout-backend.md).

## Capabilities

- [F17: Widget layout](widget-layout-system.md#f17)

## Evidence and ownership

Portfolio inclusion was reviewed against the [Services team assignments](https://github.com/orgs/RedHatInsights/teams/experience-services-committers/repositories) on 2026-10-09. Services means Platform Experience Services / Console Framework.

Operational contact and escalation policy: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Confirmed accountability

Services accountability was confirmed by the team owner on 2026-10-23, despite repository access by both UI and Services. UI contributions or consumption do not transfer component accountability.

## Build and release configuration

The table records source configuration, not live rollout status. UI namespace is `rh-platform-experien-tenant`; namespace identifies build/release scope rather than repository-wide component accountability.

| Konflux application | Namespace | Branch | Pipeline source |
|---------------------|-----------|--------|-----------------|
| [widget-layout](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/hcc-platex-services-tenant/applications/widget-layout) | `hcc-platex-services-tenant` | `master` | [Pipeline](https://github.com/RedHatInsights/widget-layout/blob/f15470570cceae91b9e1ba28746f3f85fc39f485/.tekton/widget-layout-push.yaml) |
| [widget-layout-sc](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/hcc-platex-services-tenant/applications/widget-layout-sc) | `hcc-platex-services-tenant` | `security-compliance` | [Pipeline](https://github.com/RedHatInsights/widget-layout/blob/f15470570cceae91b9e1ba28746f3f85fc39f485/.tekton/widget-layout-sc-push.yaml) |

The `-sc` application builds the `security-compliance` branch of the same logical component; it is not a separate catalog component.

Output-image destinations and Dockerfile/build-context parameters are recorded in the linked pipelines. Verify deployed image and environment in release configuration before making operational changes.
