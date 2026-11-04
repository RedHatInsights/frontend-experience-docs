# Frontend Deployment & Delivery

**Record type:** System group<br>
**Scope:** Frontend deployment, configuration aggregation, asset publication, and serving<br>
**Structure reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Turns application images and metadata into deployed, discoverable, and accessible console frontends. This catalog group connects the Frontend Operator with the publication and serving components it coordinates; it is not a single service or a proposal to move all delivery code into the operator.

The implementation records below retain their own source evidence, review dates, operational boundaries, and unresolved stewardship. Grouping them does not establish new ownership or verify current deployment configuration.

## Implementation components

| Implementation | Relationship to this system | Responsibility |
|----------------|-----------------------------|----------------|
| [Frontend Operator](frontend-operator.md) | Deployment and configuration orchestrator | Reconciles application/environment resources, aggregates metadata, and orchestrates asset-publication and cache-purge jobs. |
| [Asset Publication and Version Retention](valpop.md) | Publication component | Publishes/retrieves assets and manages retained versions and cleanup; configured storage modes must be checked per environment. |
| [Frontend Asset Proxy](frontend-asset-proxy.md) | Serving component | Serves S3-compatible frontend assets, including SPA entry-point fallback. Separate from the operator and runtime image. |

These components remain distinct software units, with separate release and failure boundaries. The operator coordinates publication; it does not implement Valpop's version handling or the asset proxy's request serving.

## Supporting configuration, artifacts, and integrations

| Supporting record | Relationship | Boundary |
|-------------------|--------------|----------|
| [Frontend Environment Configuration](frontend-environments.md) | Configuration input | Environment-specific settings referenced by operator deployment metadata; current stewardship/publication contract remains to confirm. |
| [Frontend Runtime Image](caddy-ubi.md) | Runtime artifact | Frontend serving environment where used; current consumers and stewardship remain to confirm. Not the Go asset proxy. |
| [CDN Cache Purging](frontend-cache-bust.md) | Invalidation tool/integration | Operator-related purge image and job integration; current resource ownership remains to confirm. |
| [Deployment and Release Configuration](deployment-release-configuration.md) | Deployment configuration | Relevant application/environment resources and release configuration. Build-time and package-publishing configuration remains associated with its own tooling. |

## Capabilities and flows

### Frontend configuration and discovery

[Frontend Configuration & Discovery](dynamic-navigation.md) describes the cross-component flow, historically named Dynamic Navigation Infrastructure:

```text
Application metadata / Frontend resources + environment settings
        |
        v
Frontend Operator: collect and aggregate configuration
        |
        v
Chrome Backend: current configuration processing / serving
        |
        v
Console Shell: consume configuration and render / load applications
```

Configuration includes module registrations, navigation metadata, service tiles, search metadata, and widget registrations. Collecting those definitions does not make the operator the implementation of navigation rendering, search behavior, or widget persistence.

[Chrome Backend](chrome-service-backend.md) participates in this flow but remains a separate catalog component because it also provides runtime APIs, user configuration, and browser events. [Console Shell](insights-chrome.md) is a consumer, not the deployment-system implementation.

[Frontend Configuration Publisher](frontend-config.md) records an intended extraction from Chrome Backend. Reviewed source is a scaffold; completed publication, replacement, and consumer migration are not established.

### Asset publication and serving

[Push Cache / Frontend Asset Delivery](push-cache.md) records publication, retention, serving, and cache integration as a capability of this group. Valpop and the asset proxy remain separate implementation records. Storage mode, retention, rollback, and serving path must be verified per environment.

### Cache invalidation

Operator-related purge jobs connect delivery changes to cache invalidation. [Akamai Integration](akamai-integration.md) remains a separate, starred transfer candidate in the catalog. This group covers the delivery-side integration, not ownership of the CDN, DNS, or all Akamai configuration.

## Producers, consumers, and adjacent systems

| System or component | Relationship | What stays outside this group |
|---------------------|--------------|-------------------------------|
| [Frontend Development Tooling](frontend-development-tooling.md) and [Frontend Builder Image](frontend-build-container.md) | Produce build artifacts upstream | Source builds, developer environments, and build-time tooling. |
| [Frontend Components Pipeline](frontend-components.md#pipeline) | Publishes packages used by application builds | Shared component/package publishing is not frontend application deployment. |
| Console applications, including [Landing Page](landing-page-frontend.md) and [RBAC UI](insights-rbac-ui.md) | Supply images/metadata and consume deployment/hosting | Application features and their backend APIs. |
| [Shared Frontend Assets](frontend-assets.md) | Supplies asset content | Icons, images, fonts, and content maintenance. |
| [Console Shell](insights-chrome.md) | Consumes configuration and deployed assets | Navigation rendering, authentication integration, application loading, and Chrome APIs. |
| [Widget Layout](widget-layout-system.md) | Provides widgets described by registration metadata | Widget rendering, layouts, templates, and persistence. |
| [Internationalization Tooling](i18n-tooling.md) and [Internationalization Hub](i18n-hub.md) | Supply translation tooling/artifacts to consumers | Catalog validation, translation submission/reconciliation, and application adoption. |
| Storage, CDN, cluster, registry, and CI platforms | Infrastructure dependencies | Operation of upstream platforms; see individual implementation records. |

## Further reading

- [Frontend Operator architecture](../frontend-operator.md): resources and reconciliation.
- [Asset Pipeline](../asset-pipeline.md): build, deployment, and serving flow; verify older descriptions against implementation records before operational use.
- [Console Runtime Overview](chrome-service.md): shell/backend capabilities and application integration boundaries.
