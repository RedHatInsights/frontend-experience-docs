# Frontend Starter Application

**Implementation ID:** S21  
**Accountable team:** Services<br>
**Type:** Application template  
**Status:** Tracked  
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Starter application and frontend-platform integration examples.

## Backing repository

- [frontend-starter-app](https://github.com/RedHatInsights/frontend-starter-app)

## Related component

[Frontend Development Tooling](frontend-development-tooling.md) groups this application template with build tooling, the local development proxy, shared CI workflows, and developer documentation.

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
| [frontend-starter-app](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/frontend-starter-app) | `rh-platform-experien-tenant` | `master` | [Pipeline](https://github.com/RedHatInsights/frontend-starter-app/blob/76897cfc1d3fcbb018bc0e4b377b83846cb3e4e3/.tekton/frontend-starter-app-push.yaml) |

Output-image destinations and Dockerfile/build-context parameters are recorded in the linked pipelines. Verify deployed image and environment in release configuration before making operational changes.
