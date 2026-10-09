# Accessibility

**Owner:** Services; application teams own their interfaces  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Accessible shared-platform interactions, keyboard navigation, and contrast.

## Backing repositories and responsibilities

The implementation records below describe the backing code, its broader responsibilities, lifecycle, and source evidence.

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [Console Shell](insights-chrome.md) | [insights-chrome](https://github.com/RedHatInsights/insights-chrome) | Masthead, navigation, authentication integration, micro-frontend hosting, public Chrome API, and shared shell state. |
| [Shared Frontend Components](frontend-components.md) | [frontend-components](https://github.com/RedHatInsights/frontend-components) | Shared UI components, Chrome bindings, utilities, build configuration, test helpers, and development tools. |

## Capability boundaries

<a id="f08"></a>

### Accessibility

**Capability ID:** F08

Cross-cutting keyboard, focus, ARIA, contrast, and interaction responsibility, not a standalone service or certification.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Upstream providers and application owners retain their own boundaries. Confirm operational contacts and any unresolved stewardship or migration status with the relevant component owner.

The linked backing implementations carry pinned source evidence and implementation guidance. Relevant provider and owner references are listed below.

## Dependencies and owner references

- **PatternFly, Quickstarts, and shared PatternFly extensions** — [PatternFly](https://github.com/patternfly), [React Component Groups](https://github.com/patternfly/react-component-groups), [React Data View](https://github.com/patternfly/react-data-view), [ChatBot](https://github.com/patternfly/chatbot). Confirm team-specific extension stewardship.
