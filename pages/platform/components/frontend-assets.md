# Shared Frontend Assets

**Implementation ID:** S07  
**Accountable team:** UI<br>
**Type:** Static asset collection  
**Status:** Tracked  
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Shared icons, images, fonts, and other frontend assets.

## Backing repository

- [frontend-assets](https://github.com/RedHatInsights/frontend-assets)

## Related component

[Pluggable UI Framework](pluggable-ui-framework.md) groups this shared asset collection with the platform runtime and shared frontend components.

## Evidence and ownership

UI accountability was confirmed by the team owner on 2026-10-23. The repository appears in both [UI](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories) and [Services](https://github.com/orgs/RedHatInsights/teams/experience-services-committers/repositories) assignments; access does not override this ownership decision. UI means Platform Experience UI; Services means Platform Experience Services / Console Framework.

Operational contact and escalation policy: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Supporting responsibilities

UI maintains the shared asset collection. Services owns the [Push Cache](push-cache.md) delivery infrastructure and shell consumption; this does not transfer asset-content accountability.

## Build and release configuration

The table records source configuration, not live rollout status. UI namespace is `rh-platform-experien-tenant`; namespace identifies build/release scope rather than repository-wide component accountability.

| Konflux application | Namespace | Branch | Pipeline source |
|---------------------|-----------|--------|-----------------|
| [frontend-assets](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/frontend-assets) | `rh-platform-experien-tenant` | `master` | [Pipeline](https://github.com/RedHatInsights/frontend-assets/blob/a121fad0c903496718f69df42ddafceeb9d1bbe5/.tekton/frontend-assets-push.yaml) |

Output-image destinations and Dockerfile/build-context parameters are recorded in the linked pipelines. Verify deployed image and environment in release configuration before making operational changes.
