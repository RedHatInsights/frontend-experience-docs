# Platform Experience Component Catalog

**Maintainers:** Platform Experience Services / Console Framework and Platform Experience UI<br>
**Ownership reviewed:** 2026-10-26

This catalog lists current components and explicitly named system groups with their team responsibilities for the Services and UI portfolios. Historical and archived components are listed in [Legacy Components](legacy-components.md). Detail pages in `components/` define boundaries, backing implementations, dependencies, lifecycle, evidence, and build/release mappings. A component is a responsibility boundary: one repository can back multiple components, and one component can span repositories.

**Catalog granularity:** Console Shell and Chrome Backend are software components. Frontend Deployment & Delivery is a system group whose detail page lists the operator, publication, and serving implementations. Shell capabilities, integrations, and configuration flows are linked from those records rather than counted again as peer components. Related pages identify implementation, provider, consumer/host, and dependency roles. Grouping does not merge repositories, deployments, or existing ownership boundaries.

Strategic Initiative Integration is an engagement responsibility rather than a deployed software component. It makes cross-team coordination and technical alignment visible; resulting implementation work remains with the affected components and is estimated once.

**Team key:** Services = Platform Experience Services / Console Framework; UI = Platform Experience UI. Section headings group components by team; the support column names supporting responsibilities. Detailed ownership and lifecycle information is recorded on component detail pages.

**Transfer candidates:** Entries marked `*` are potential scope transfers, not completed transfers. Grouping related delivery records does not absorb the separately marked Akamai Integration scope.

**Ownership evidence:** The team owner confirmed overlapping repository assignments on 2026-10-23: UI owns frontend-assets, service-accounts, i18n-tooling, and i18n-hub; Services owns frontend-starter-app, widget-layout, frontend-experience-docs, platform-frontend-ai-toolkit, consoles-enhancements, and archived frontend-releaser. In frontend-components, UI owns components and Services owns the pipeline. Other UI entries are attributed from the [UI repository portfolio](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories), supported by source evidence in their detail pages; operational contacts still require confirmation. Existing Services evidence is retained in its detail pages.

On 2026-10-26, the team owner confirmed Services as the lead for Strategic Initiative Integration, with UI supporting; Lightwell is the current initiative.

<a id="platform-components"></a>

## Services components

| Component | Short description | Supporting responsibility |
| ----------- | ------------------- | --------------------------- |
| [Console Shell](components/insights-chrome.md) | Shared console UI, navigation, authentication integration, application loading, Chrome APIs, and shell-side integrations. | Backend supplies runtime/configuration APIs; hosted applications and upstream providers remain separate. |
| [Chrome Backend](components/chrome-service-backend.md) | Runtime user/configuration APIs, current generated-configuration processing/serving, integration metadata, and browser-event bridge. | Operator aggregates metadata; shell and applications consume APIs. |
| [Frontend Deployment & Delivery](components/frontend-deployment-delivery.md) | System group: operator orchestration, configuration aggregation/discovery, asset publication/serving, and associated runtime/environment configuration. | Valpop and asset proxy remain separate implementations; build tooling and CDN platforms remain adjacent dependencies. |
| [Search](components/search.md)* | Finds console services and resources. | UI publishes API-catalog search metadata; separate historical Search UI assignment to confirm. |
| [Internationalization](components/internationalization.md) | Translatable messages, locale catalogs, and translation workflows. | UI owns catalog tooling and translation hub; applications own catalog adoption. |
| [Accessibility](components/accessibility.md) | Accessible shared-platform interactions, keyboard navigation, and contrast. | UI owns shared component accessibility; applications own their interfaces. |
| [Tutorials & Quickstarts](components/tutorials-and-quickstarts.md) | Guided workflows, tutorial content, and saved progress. | See detail page for dependency boundaries. |
| [Learning Resources & Help](components/learning-resources-help.md) | Learning catalog and integrated help-panel experience. | UI content contributions; Services retains implementation accountability. |
| [PDF Generation](components/pdf-generator.md)* | Generates downloadable reports for console applications. | See detail page for dependency boundaries. |
| [Virtual Assistant](components/virtual-assistant.md)* | Shared conversational assistance and AI integrations. | See detail page for dependency boundaries. |
| [Widget Layout](components/widget-layout-system.md) | Customizable dashboards, widgets, and persisted layouts. | See detail page for dependency boundaries. |
| [Akamai Integration](components/akamai-integration.md)* | Console CDN configuration, caching, and purge integration. | CDN/DNS providers operate upstream services. |
| [Scheduler UI](components/scheduler-ui.md)* | Configures scheduled report delivery. | Backend owner to confirm. |
| [Analytics Integration](components/analytics-integration.md) | Shared analytics events, provider integration, and delivery validation. | Vendor/account owners provide analytics service. |
| [Feature Flags](components/feature-flags.md) | Evaluates feature availability for console users and applications. | Unleash provider operates upstream service. |
| [OCM API Gateway](components/uhc-gateway.md)* | Routes OCM API traffic and presents API specifications. | See detail page for dependency boundaries. |
| [Frontend Development Tooling](components/frontend-development-tooling.md) | Application scaffolding, build scripts, local development proxy, reusable CI workflows, and developer documentation. | UI contributes application/component examples and documentation. |
| [Frontend API and Quality Tooling](components/frontend-api-and-quality-tooling.md) | Generated API clients, client integration tests, shared test helpers, and repository security checks. | See detail page for dependency boundaries. |
| [AI Developer Tooling](components/ai-developer-tooling.md) | Skills, prompts, and helpers for AI-assisted development, plus framework-team developer-bot automation. | UI owns its separately listed developer-bot instance. |
| [Engineering Operations](components/engineering-operations.md) | Console enhancement tracking and team status reporting. | UI contributes enhancement proposals. |
| [Strategic Initiative Integration](components/strategic-initiative-integration.md) | Platform engagement for strategic initiatives: requirements discovery, layout/navigation alignment, technical discussions, integration planning, and rollout coordination. Current initiative: Lightwell. | Services leads; UI supports design and UI alignment. Component owners implement changes; initiative sponsors supply product direction and priorities. |
| [Frontend Components Pipeline](components/frontend-components.md#pipeline) | Pipeline for the frontend-components monorepo. | UI maintains component code and addresses component-related failures. |

## UI components

| Component | Short description | Supporting responsibility |
| ----------- | ------------------- | --------------------------- |
| [Landing Page](components/landing-page-frontend.md) | Console landing/dashboard experience, including favorite-services widget. | Services supplies shell and widget-layout infrastructure. |
| [Console API UI](components/api-frontend.md) | API-documentation browsing within the console. | Services supplies shell/configuration integration; API teams own specifications. |
| [Developer API Catalog](components/api-documentation-frontend.md) | Public API catalog, discovery, transformation, and indexing for developers.redhat.com. | Site/SPAship owners supply publishing platform; API teams own specifications. |
| [RBAC UI](components/insights-rbac-ui.md) | Roles and access-control management frontend. | Services supplies shell/auth integration; backend enforcement owner to confirm. |
| [Access Requests / TAM Tool](components/access-requests-frontend.md) | Account-access request and approval interfaces, including RBAC exports. | Services supplies shell/auth integration; backend owner to confirm. |
| [Payload Tracker UI](components/payload-tracker-frontend.md)* | Internal views of tracked payloads and processing statuses. | Payload Tracker backend owners provide tracking data; team to confirm. |
| [Platform Settings](components/platform-settings-ui.md)* | Consolidated settings frontend for notifications, sources, and preferences. | Services supplies shell/navigation integration; backend teams own APIs. |
| [Sources UI](components/sources-ui.md)* | Source and application-connection management. | Services supplies shell integration; sources backend owner to confirm. |
| [Notifications UI](components/notifications-frontend.md)* | Notification configuration and management screens. | Services supplies shell integration; notification-delivery backend owner to confirm. |
| [User Preferences UI](components/user-preferences-frontend.md) | Schema-driven preference-editing forms. | Services supplies shell integration; application/backend teams own schemas and persistence. |
| [Service Account Management](components/service-accounts.md) | Service-account lifecycle management frontend. | Services supplies shell/auth integration; identity backend ownership stays separate. |
| [Shared Frontend UI Components](components/frontend-components.md#ui-components) | Shared UI component implementations and behavior. | Services maintains the frontend-components pipeline. |
| [Shared Frontend Assets](components/frontend-assets.md) | Shared icons, images, fonts, and other asset content. | Services owns shell consumption and shared asset-delivery infrastructure. |
| [Internationalization Tooling](components/i18n-tooling.md) | ICU validation, adapters, reusable workflows, and Phrase integration. | Services integrates shell/runtime localization; applications own catalogs. |
| [Internationalization Hub](components/i18n-hub.md) | Central translation submission/reconciliation orchestration. | Services and application teams maintain consumer configuration and source catalogs. |
| [HCC Debugger](components/hcc-debugger.md) | Console module, feature-flag, entitlement, and permission inspection. | Services maintains inspected shell APIs and runtime surfaces. |
| [UI E2E Runner Image](components/cypress-e2e-image.md) | Containerized frontend end-to-end test execution. | Services supplies shared test utilities; applications own test suites. |
| [Storybook Hub](components/hcc-storybook-hub.md) | Unified browsing of application Storybooks. | Application teams publish stories and execute their own tests. |
| [UI Developer Bot](components/hcc-ui-agent-dev.md) | UI developer-agent runner and instance configuration. | Services owns shared AI toolkit; shared bot-framework stewardship separate. |

## Stewardship components

Upstream stewardship is distinct from Services integration accountability. Where the steward is unresolved, the catalog retains that uncertainty rather than assigning a second accountable team.

| Component | Short description | Supporting responsibility |
| ----------- | ------------------- | --------------------------- |
| [Data Driven Forms](components/data-driven-forms.md) | Shared schema-driven form renderer and mappers. | Services attribution exists in historical guide; verify stewardship. |
| [Scalprum](components/scalprum.md) | Shared micro-frontend loading, remote hooks, and state framework. | Services owns console integration. |
| [Frontend Builder Image](components/frontend-build-container.md) | Shared container environment for frontend builds. | Shared build/delivery infrastructure; see detail page. |

<a id="historical-and-unresolved-components"></a>

## Historical component names

Historical and archived entries are listed in [Legacy Components](legacy-components.md).
