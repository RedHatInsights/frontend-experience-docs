# UI E2E Runner Image

**Accountable team:** UI<br>
**Type:** Developer tooling<br>
**Status:** Tracked<br>
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Container image used to run console frontend end-to-end checks against current application code.

## Backing repository

- [cypress-e2e-image](https://github.com/RedHatInsights/cypress-e2e-image)

## Responsibility boundaries

UI owns this runner image. This is distinct from Services-owned [Frontend API and Quality Tooling](frontend-api-and-quality-tooling.md), including shared frontend test helpers and API-client tests. Application teams retain test-suite responsibility.

## Dependencies and supporting responsibilities

- **Services:** Shared frontend test utilities and development/build integration where consumed.
- **Konflux and registry owners:** Build execution and image hosting.
- **Application teams:** Test scenarios, credentials provisioning, and failure triage.

## Evidence and ownership

UI portfolio inclusion is evidenced by the [UI team repository assignments](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories), reviewed on 2026-10-23. This identifies repository scope; it does not establish exclusive operational ownership. UI means Platform Experience UI; Services means Platform Experience Services / Console Framework.

- **Reviewed source:** [Repository README](https://github.com/RedHatInsights/cypress-e2e-image/blob/9bc9e59153d7fb90f4bcfbaba8ba710ae9d810fe/README.md).
- **Reviewed repository tree:** [Pinned implementation](https://github.com/RedHatInsights/cypress-e2e-image/tree/9bc9e59153d7fb90f4bcfbaba8ba710ae9d810fe).
- **Operational contact and escalation policy:** To confirm.

Implementation guides and runbooks stay in the backing repository. Repository status is not proof of production deployment or migration completion.

## Build and release configuration

The table records source configuration, not live rollout status. UI namespace is `rh-platform-experien-tenant`; namespace identifies build/release scope rather than repository-wide component accountability.

| Konflux application | Namespace | Branch | Pipeline source |
|---------------------|-----------|--------|-----------------|
| [cypress-e2e-image](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/cypress-e2e-image) | `rh-platform-experien-tenant` | `master` | [Pipeline](https://github.com/RedHatInsights/cypress-e2e-image/blob/9bc9e59153d7fb90f4bcfbaba8ba710ae9d810fe/.tekton/cypress-e2e-image-push.yaml) |

Output-image destinations and Dockerfile/build-context parameters are recorded in the linked pipelines. Verify deployed image and environment in release configuration before making operational changes.
