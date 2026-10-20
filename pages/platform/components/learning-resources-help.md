# Learning Resources & Help

**Owner:** Services  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Learning catalog and integrated help-panel experience.

## Backing repositories and responsibilities

The implementation records below describe the backing code, its broader responsibilities, lifecycle, and source evidence.

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [Learning Resources](learning-resources.md) | [learning-resources](https://github.com/RedHatInsights/learning-resources) | Learning-resource page, catalog, help panel, content-creation, and dashboard integration. |
| [Console Shell](insights-chrome.md) | [insights-chrome](https://github.com/RedHatInsights/insights-chrome) | Masthead, navigation, authentication integration, micro-frontend hosting, public Chrome API, and shared shell state. |

## Capability boundaries

<a id="f10"></a>

### Learning resources and help experience

**Capability ID:** F10

Includes federated help panel, resource catalog, and content-creation modules.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Upstream providers and application owners retain their own boundaries. Confirm operational contacts and any unresolved stewardship or migration status with the relevant component owner.

The linked backing implementations carry pinned source evidence and implementation guidance. Relevant provider and owner references are listed below.

## Dependencies and owner references

- **PatternFly, Quickstarts, and shared PatternFly extensions** — [PatternFly](https://github.com/patternfly), [React Component Groups](https://github.com/patternfly/react-component-groups), [React Data View](https://github.com/patternfly/react-data-view), [ChatBot](https://github.com/patternfly/chatbot). Confirm team-specific extension stewardship.
