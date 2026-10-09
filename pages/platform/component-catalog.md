# Experience Services Components

**Maintainer:** Platform Experience Services / Console Framework  
**Reviewed:** 2026-10-09

This is the capability-level component list, following the legacy component names. Each component links to details about its responsibility, backing repositories, and dependencies.

**Owner key:** Services means Platform Experience Services / Console Framework. Owners are recorded at team/integration level; individual detail pages mark contacts and stewardship that need confirmation.

## Platform components

| Component | Short description | Owner |
|-----------|-------------------|-------|
| [Chrome Service](components/chrome-service.md) | Shared console shell, application hosting, and shell backend capabilities. | Services |
| [Navigation](components/navigation.md) | Menus, bundles, routes, and access-aware navigation. | Services |
| [Dynamic Navigation Infrastructure](components/dynamic-navigation.md) | Collects application metadata and publishes navigation configuration. | Services |
| [Search](components/search.md) | Finds console services and resources. | Services |
| [Internationalization](components/internationalization.md) | Translatable messages, locale catalogs, and translation workflows. | Services |
| [Accessibility](components/accessibility.md) | Accessible shared-platform interactions, keyboard navigation, and contrast. | Services; application teams own their interfaces |
| [Tutorials & Quickstarts](components/tutorials-and-quickstarts.md) | Guided workflows, tutorial content, and saved progress. | Services |
| [Learning Resources & Help](components/learning-resources-help.md) | Learning catalog and integrated help-panel experience. | Services |
| [PDF Generation](components/pdf-generator.md) | Generates downloadable reports for console applications. | Services |
| [Feedback Collection](components/feedback.md) | Collects user feedback and connects feedback integrations. | Services integration; backend owner to confirm |
| [Virtual Assistant](components/virtual-assistant.md) | Shared conversational assistance and AI integrations. | Services |
| [Pluggable UI Framework](components/pluggable-ui-framework.md) | Loads independent applications and shares platform APIs and state. | Services integration; Scalprum stewardship to confirm |
| [Widget Layout](components/widget-layout-system.md) | Customizable dashboards, widgets, and persisted layouts. | Services |
| [Push Cache](components/push-cache.md) | Publishes, retains, and serves frontend asset versions. | Services integration; shared storage providers |
| [Akamai Integration](components/akamai-integration.md) | Console CDN configuration, caching, and purge integration. | Services integration; CDN/DNS providers |
| [Stratosphere UX](components/stratosphere.md) | Marketplace/account-linking and product-selection experience. | Services shell integration |
| [Support Case Integration](components/support-case-integration.md) | Hands application and user context into support-case workflows. | Services integration; support systems upstream |
| [Scheduler UI](components/scheduler-ui.md) | Configures scheduled report delivery. | Services frontend; backend owner to confirm |
| [Analytics Integration](components/analytics-integration.md) | Shared analytics events, provider integration, and delivery validation. | Services integration; vendor/account owners |
| [Feature Flags](components/feature-flags.md) | Evaluates feature availability for console users and applications. | Services proxy/integration; Unleash provider |
| [Service Account Management](components/service-accounts.md) | Console experience for managing service accounts. | Services frontend |
| [Akamai Integration](components/akamai-integration.md) | Console CDN configuration and delivery integration. | Services integration; CDN/DNS providers |
| [OCM API Gateway](components/uhc-gateway.md) | Routes OCM API traffic and presents API specifications. | Services |

## Stewardship components

Shared stewardship entries use the same detail pages where they overlap a platform capability. Upstream platform ownership and Services integration ownership are recorded separately.

| Component | Short description | Stewardship owner |
|-----------|-------------------|-------------------|
| [Data Driven Forms](components/data-driven-forms.md) | Shared schema-driven form renderer and mappers. | Services attributed by guide; stewardship to confirm |
| [Scalprum](components/scalprum.md) | Shared micro-frontend loading, remote hooks, and state framework. | Steward to confirm; Services integration |
| [CDN Cache Purging](components/frontend-cache-bust.md) | Containerized cache-purge tooling used by frontend delivery. | To confirm |
| [Frontend Environment Configuration](components/frontend-environments.md) | Shared environment definitions used by frontend infrastructure. | To confirm |
| [Frontend Builder Image](components/frontend-build-container.md) | Shared container environment for frontend builds. | To confirm |
| [Frontend Runtime Image](components/caddy-ubi.md) | Shared Caddy-based container image for frontends. | To confirm |
| [Deployment and Release Configuration](components/deployment-release-configuration.md) | Services application, deployment, and pipeline configuration. | Services configuration; shared platform owners; scope to confirm |
| [Dynamic Plugin SDK Integration](components/dynamic-plugin-sdk.md) | Compatibility with OpenShift dynamic plugins. | OpenShift SDK maintainers; Services integration |
