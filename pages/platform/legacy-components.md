# Legacy Components

**Reviewed:** 2026-10-23

[Component catalog](component-catalog.md)

Components below are historical entries or have archived backing repositories. Product Trials Integration remains unverified; its inclusion here does not establish archival or retirement. Repository archival does not establish runtime retirement or completed migration. Links lead to implementation history, ownership evidence, and historical build configuration.

| Component | Short description | Supporting responsibility |
| ----------- | ------------------- | --------------------------- |
| [Legacy Settings UI](components/legacy-ui-implementations.md#settings-frontend) | Archived settings frontend. | UI owns current consolidated Platform Settings; migration completion to confirm. |
| [Legacy Shared TypeScript](components/legacy-ui-implementations.md#insights-common-typescript) | Historical shared Policies/Notifications code. | Current consumers/replacement to confirm. |
| [Legacy Cloud Connector UI](components/legacy-ui-implementations.md#cloud-connector-frontend) | Historical cloud-connector frontend. | Successor and runtime consumers to confirm. |
| [Legacy Platform Documentation](components/legacy-ui-implementations.md#better-platform-docs) | Historical documentation application and Konflux entry. | Services owns current Frontend Experience Documentation; formal migration to confirm. |
| [Legacy Frontend Releaser](components/legacy-ui-implementations.md#frontend-releaser) | Historical release-trigger action. | Replacement and remaining consumers to confirm. |
| [Legacy Inventory Frontend Fork](components/legacy-ui-implementations.md#insights-inventory-frontend-ana) | Archived repository associated with UI access. | Does not establish UI accountability for the Inventory product. |
| [Product Trials Integration](components/product-trials-integration.md) | Historical trials integration; implementation not established. | Trial-provider and shell boundaries to confirm. |

## Archived backing implementations

These repositories are recorded in existing implementation histories rather than treated as additional current components. Their inclusion does not establish runtime retirement, completed migration, or current operational ownership.

| Repository | Existing evidence | Boundary or unresolved responsibility |
|------------|-------------------|---------------------------------------|
| [cloud-services-config](https://github.com/RedHatInsights/cloud-services-config) | [Configuration and discovery history](components/dynamic-navigation.md#lifecycle-and-history) | Archived configuration repository; current generation/publication is described by the backing implementations. |
| [dynamic-browser-events](https://github.com/RedHatInsights/dynamic-browser-events) | [Chrome Backend history](components/chrome-service-backend.md#lifecycle-and-history) | Current shell/backend WebSocket integration is separate; remaining legacy deployment status needs confirmation. |
| [astro-virtual-assistant](https://github.com/RedHatInsights/astro-virtual-assistant) | [Astro Assistant Backend history](components/astro-virtual-assistant-v2.md#lifecycle-and-history) | Archived v1 codebase; v2 is the documented successor, but remaining v1 deployments need confirmation. |
| [konflux-consoledot-frontend-build](https://github.com/RedHatInsights/konflux-consoledot-frontend-build) | [Frontend Build Tooling history](components/insights-frontend-builder-common.md#lifecycle-and-history) | Archived build repository; current pipeline configuration establishes the active build/release path. |
| [pendo-config-automation](https://github.com/RedHatInsights/pendo-config-automation) | [Analytics Integration history](components/analytics-integration.md#lifecycle-and-history) | Repository archival does not establish retirement of Pendo integration. |
| [developer-sandbox-ui](https://github.com/RedHatInsights/developer-sandbox-ui) | [Inventory source notes](components/frontend-experience-docs.md#inventory-source-notes) | Archived repository; current sandbox ownership needs confirmation. |
