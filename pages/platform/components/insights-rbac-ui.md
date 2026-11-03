# RBAC UI

**Accountable team:** UI<br>
**Type:** Frontend application<br>
**Status:** Tracked<br>
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Console frontend for role-based access-control management.

## Backing repository

- [insights-rbac-ui](https://github.com/RedHatInsights/insights-rbac-ui)

## Responsibility boundaries

UI owns RBAC presentation and application behavior. Backend authorization policy and enforcement belong to the RBAC service, whose accountable team is not established here. [Access Requests / TAM Tool](access-requests-frontend.md) exports federated views consumed by this application.

## Dependencies and supporting responsibilities

- **UI:** Access-request frontend integration.
- **Services:** Console authentication and shell integration surfaces.
- **RBAC backend owners:** API contracts and permission enforcement; operational contact to confirm.

## Evidence and ownership

UI portfolio inclusion is evidenced by the [UI team repository assignments](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories), reviewed on 2026-10-23. This identifies repository scope; it does not establish exclusive operational ownership. UI means Platform Experience UI; Services means Platform Experience Services / Console Framework.

- **Reviewed source:** [Repository README](https://github.com/RedHatInsights/insights-rbac-ui/blob/afe03c13fa48f470147536ecba104db97b219514/README.md).
- **Reviewed repository tree:** [Pinned implementation](https://github.com/RedHatInsights/insights-rbac-ui/tree/afe03c13fa48f470147536ecba104db97b219514).
- **Operational contact and escalation policy:** To confirm.

Implementation guides and runbooks stay in the backing repository. Repository status is not proof of production deployment or migration completion.

## Build and release configuration

The table records source configuration, not live rollout status. UI namespace is `rh-platform-experien-tenant`; namespace identifies build/release scope rather than repository-wide component accountability.

| Konflux application | Namespace | Branch | Pipeline source |
|---------------------|-----------|--------|-----------------|
| [insights-rbac-ui](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/insights-rbac-ui) | `rh-platform-experien-tenant` | `master` | [Pipeline](https://github.com/RedHatInsights/insights-rbac-ui/blob/afe03c13fa48f470147536ecba104db97b219514/.tekton/insights-rbac-ui-push.yaml) |
| [insights-rbac-ui-sc](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/insights-rbac-ui-sc) | `rh-platform-experien-tenant` | `security-compliance` | [Pipeline](https://github.com/RedHatInsights/insights-rbac-ui/blob/afe03c13fa48f470147536ecba104db97b219514/.tekton/insights-rbac-ui-sc-push.yaml) |

The `-sc` application builds the `security-compliance` branch of the same logical component; it is not a separate catalog component.

Output-image destinations and Dockerfile/build-context parameters are recorded in the linked pipelines. Verify deployed image and environment in release configuration before making operational changes.
