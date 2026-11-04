# UI Developer Bot

**Accountable team:** UI<br>
**Type:** Developer tooling<br>
**Status:** Tracked<br>
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

UI-team developer-bot runner instance and instance-specific customization, consuming a shared developer-agent framework.

## Backing repository

- [hcc-ui-agent-dev](https://github.com/RedHatInsights/hcc-ui-agent-dev)

## Responsibility boundaries

UI owns this instance. Services owns the shared [AI Developer Tooling](ai-developer-tooling.md) portfolio and its [Framework Developer Bot](hcc-framework-agent-dev.md) instance. Instance ownership does not imply ownership of the shared agent framework.

## Dependencies and supporting responsibilities

- **Shared bot framework:** The reviewed README references a `dev-bot` submodule and `dev-bot/Dockerfile.runner` from `platform-frontend-ai-dev`; verify the pinned submodule before operational changes.
- **Services:** Shared AI toolkit; framework stewardship remains separately documented.

## Evidence and ownership

UI portfolio inclusion is evidenced by the [UI team repository assignments](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories), reviewed on 2026-10-23. This identifies repository scope; it does not establish exclusive operational ownership. UI means Platform Experience UI; Services means Platform Experience Services / Console Framework.

- **Reviewed source:** [Repository README](https://github.com/RedHatInsights/hcc-ui-agent-dev/blob/c59a5dfdc3b2362ec310488d615764199f35fc1a/README.md).
- **Reviewed repository tree:** [Pinned implementation](https://github.com/RedHatInsights/hcc-ui-agent-dev/tree/c59a5dfdc3b2362ec310488d615764199f35fc1a).
- **Operational contact and escalation policy:** To confirm.

Implementation guides and runbooks stay in the backing repository. Repository status is not proof of production deployment or migration completion.

## Build and release configuration

The table records source configuration, not live rollout status. UI namespace is `rh-platform-experien-tenant`; namespace identifies build/release scope rather than repository-wide component accountability.

| Konflux application | Namespace | Branch | Pipeline source |
|---------------------|-----------|--------|-----------------|
| [hcc-ui-agent-dev](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/hcc-ui-agent-dev) | `rh-platform-experien-tenant` | `master` | [Pipeline](https://github.com/RedHatInsights/hcc-ui-agent-dev/blob/c59a5dfdc3b2362ec310488d615764199f35fc1a/.tekton/hcc-ui-agent-dev-push.yaml) |

Output-image destinations and Dockerfile/build-context parameters are recorded in the linked pipelines. Verify deployed image and environment in release configuration before making operational changes.
