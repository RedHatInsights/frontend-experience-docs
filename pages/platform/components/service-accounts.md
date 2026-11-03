# Service Account Management

**Implementation ID:** S16  
**Accountable team:** UI<br>
**Type:** Frontend application  
**Status:** Tracked  
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Service-account management UI; identity-provider/backend ownership is separate.

## Backing repository

- [service-accounts](https://github.com/RedHatInsights/service-accounts)

## Evidence and ownership

UI accountability was confirmed by the team owner on 2026-10-23. The repository appears in both [UI](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories) and [Services](https://github.com/orgs/RedHatInsights/teams/experience-services-committers/repositories) assignments; access does not override this ownership decision. UI means Platform Experience UI; Services means Platform Experience Services / Console Framework.

Operational contact and escalation policy: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **Red Hat SSO / OIDC** — Authentication/identity service owners provide identity APIs; UI owns application integration and Services owns shared shell authentication. [Auth architecture](../navigation-and-auth.md).
- **Service-account backend** — Identity/service-account backend owners provide account lifecycle and authorization APIs; accountable backend team to confirm.
- **Services support** — Shared console hosting and shell authentication integration.

## Build and release configuration

The table records source configuration, not live rollout status. UI namespace is `rh-platform-experien-tenant`; namespace identifies build/release scope rather than repository-wide component accountability.

| Konflux application | Namespace | Branch | Pipeline source |
|---------------------|-----------|--------|-----------------|
| [service-accounts](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/service-accounts) | `rh-platform-experien-tenant` | `main` | [Pipeline](https://github.com/RedHatInsights/service-accounts/blob/0faa1294c80ddaa7db6788e8432faac8dc068311/.tekton/service-accounts-push.yaml) |
| [service-accounts-sc](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/service-accounts-sc) | `rh-platform-experien-tenant` | `security-compliance` | [Pipeline](https://github.com/RedHatInsights/service-accounts/blob/0faa1294c80ddaa7db6788e8432faac8dc068311/.tekton/service-accounts-sc-push.yaml) |

The `-sc` application builds the `security-compliance` branch of the same logical component; it is not a separate catalog component.

Output-image destinations and Dockerfile/build-context parameters are recorded in the linked pipelines. Verify deployed image and environment in release configuration before making operational changes.
