# Widget Layout

**Owner:** Services  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Customizable dashboards, widgets, and persisted layouts.

## Backing repositories and responsibilities

The implementation records below describe the backing code, its broader responsibilities, lifecycle, and source evidence.

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [Widget Layout Frontend](widget-layout.md) | [widget-layout](https://github.com/RedHatInsights/widget-layout) | Dashboard widget rendering, layout composition, and drag-and-drop utilities. |
| [Widget Layout Backend](widget-layout-backend.md) | [widget-layout-backend](https://github.com/RedHatInsights/widget-layout-backend) | Dashboard templates/layouts and widget mappings; includes a read-only TypeScript MCP sidecar. |

## Capability boundaries

<a id="f17"></a>

### Widget layout

**Capability ID:** F17

Frontend composition and backend persistence; S15 also supplies a read-only MCP sidecar.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Upstream providers and application owners retain their own boundaries. Confirm operational contacts and any unresolved stewardship or migration status with the relevant component owner.

The linked backing implementations carry pinned source evidence and implementation guidance. Relevant provider and owner references are listed below.

## Dependencies and owner references

- **UI integration:** [landing-page-frontend](https://github.com/RedHatInsights/landing-page-frontend) — Hosted by [Console Shell](insights-chrome.md); consumes shared widgets/favorites/platform APIs.
- Widget Layout frontend consumes the separate persistence/template service. [Widget backend documentation](https://github.com/RedHatInsights/widget-layout-backend/tree/master/docs).
