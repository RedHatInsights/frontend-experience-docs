# Legacy UI-Associated Implementations

**Status:** Archived repositories; runtime retirement checked separately<br>
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Scope and evidence

These backing repositories appear in the [UI team assignments](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories) and were archived at review time. Assignment establishes historical repository scope, not current operational ownership. Services accountability for frontend-releaser was confirmed by the team owner on 2026-10-23. Successors are not inferred from similar names.

<a id="settings-frontend"></a>

## Legacy Settings UI

**Accountable team:** UI (historical assignment; current operational owner to confirm).

The old settings frontend is archived. The current [Platform Settings](platform-settings-ui.md) application is a separate consolidation; repository archival alone does not prove traffic migration.

- **Repository:** [settings-frontend](https://github.com/RedHatInsights/settings-frontend).
- **Reviewed source:** [Pinned repository](https://github.com/RedHatInsights/settings-frontend/tree/a084355543e13ddc9b01d82d6615a57ffda40724).

### Build and release configuration

The table records source configuration, not live rollout status. UI namespace is `rh-platform-experien-tenant`; namespace identifies build/release scope rather than repository-wide component accountability.

| Konflux application | Namespace | Branch | Pipeline source |
|---------------------|-----------|--------|-----------------|
| [settings-frontend](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/settings-frontend) | `rh-platform-experien-tenant` | `master` | [Pipeline](https://github.com/RedHatInsights/settings-frontend/blob/a084355543e13ddc9b01d82d6615a57ffda40724/.tekton/settings-frontend-push.yaml) |

Output-image destinations and Dockerfile/build-context parameters are recorded in the linked pipelines. Verify deployed image and environment in release configuration before making operational changes.

<a id="insights-common-typescript"></a>

## Legacy Shared TypeScript

**Accountable team:** UI (historical assignment; stewardship to confirm).

Historical common TypeScript code used by Policies and Notifications. Current replacement or consumer migration is to confirm.

- **Repository:** [insights-common-typescript](https://github.com/RedHatInsights/insights-common-typescript).
- **Reviewed source:** [Pinned repository](https://github.com/RedHatInsights/insights-common-typescript/tree/58bfce3fd4975ef6a914a7a730cb3240b058c2fe).

### Build and release configuration

No Konflux push pipeline was found in the reviewed repository tree. Check repository workflows for publishing; absence from the supplied Konflux screenshot does not establish retirement.

<a id="cloud-connector-frontend"></a>

## Legacy Cloud Connector UI

**Accountable team:** UI (historical assignment; current operational owner to confirm).

Archived cloud-connector frontend repository. Current successor and any remaining runtime consumers are to confirm.

- **Repository:** [cloud-connector-frontend](https://github.com/RedHatInsights/cloud-connector-frontend).
- **Reviewed source:** [Pinned repository](https://github.com/RedHatInsights/cloud-connector-frontend/tree/ce61764b642eafe1640d6ce4ba74a08d0d3f78b8).

### Build and release configuration

No Konflux push pipeline was found in the reviewed repository tree. Check repository workflows for publishing; absence from the supplied Konflux screenshot does not establish retirement.

<a id="better-platform-docs"></a>

## Legacy Platform Documentation

**Accountable team:** UI (historical assignment; current operational owner to confirm).

Archived documentation application, with downloader and external documentation mode. Current [Frontend Experience Documentation](frontend-experience-docs.md) is Services-owned; a formal migration relationship is to confirm.

- **Repository:** [better-platform-docs](https://github.com/RedHatInsights/better-platform-docs).
- **Reviewed source:** [Pinned repository](https://github.com/RedHatInsights/better-platform-docs/tree/6364ac2427a47b532f52e356f16e1b6d4d6ff180).

### Build and release configuration

No Konflux push pipeline was found in the reviewed repository tree. Check repository workflows for publishing; absence from the supplied Konflux screenshot does not establish retirement.

### Screenshot-only legacy configuration

The supplied Konflux screenshot also lists `better-platform-docs`. No `.tekton` push pipeline was found in the reviewed archived tree. [Historical application link](https://konflux-ui.apps.stone-prd-rh01.pg1f.p1.openshiftapps.com/ns/rh-platform-experien-tenant/applications/better-platform-docs) is derived from the supplied name and UI namespace; current application existence, branch, image, and deployed status need confirmation.

<a id="frontend-releaser"></a>

## Legacy Frontend Releaser

**Accountable team:** Services (team-owner confirmed).

Archived GitHub Action for triggering release automation. Current shared CI resources are documented in [Frontend Development Tooling](frontend-development-tooling.md); a direct replacement is to confirm.

- **Repository:** [frontend-releaser](https://github.com/RedHatInsights/frontend-releaser).
- **Reviewed source:** [Pinned repository](https://github.com/RedHatInsights/frontend-releaser/tree/32faf15714ad6710f62add8bd358eed14a1dde9c).

### Build and release configuration

No Konflux push pipeline was found in the reviewed repository tree. Check repository workflows for publishing; absence from the supplied Konflux screenshot does not establish retirement.

<a id="insights-inventory-frontend-ana"></a>

## Legacy Inventory Frontend Fork

**Accountable team:** UI (historical repository association only; stewardship to confirm).

Archived inventory frontend repository associated with UI access. This does not assign the active Insights Inventory product or its backend to UI. Successor and historical support scope are to confirm.

- **Repository:** [insights-inventory-frontend-ana](https://github.com/RedHatInsights/insights-inventory-frontend-ana).
- **Reviewed source:** [Pinned repository](https://github.com/RedHatInsights/insights-inventory-frontend-ana/tree/649e75d7d14ab906630ffa03507d337487f4ec7b).

### Build and release configuration

No Konflux push pipeline was found in the reviewed repository tree. Check repository workflows for publishing; absence from the supplied Konflux screenshot does not establish retirement.
