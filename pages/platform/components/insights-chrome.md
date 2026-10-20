# Console Shell

**Implementation ID:** S01  
**Owner:** Services (portfolio ownership).  
**Type:** Application shell  
**Status:** Tracked  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

Masthead, navigation, authentication integration, micro-frontend hosting, public Chrome API, and shared shell state.

## Backing repository

- [insights-chrome](https://github.com/RedHatInsights/insights-chrome)

## Capabilities

- [F01: Chrome service / shell](chrome-service.md#f01)
- [F02: Authentication and visibility](chrome-service.md#f02)
- [F03: Pluggable UI framework and Chrome API](pluggable-ui-framework.md#f03)
- [F04: Dynamic navigation infrastructure](dynamic-navigation.md#f04)
- [F05: Navigation](navigation.md#f05)
- [F06: Search](search.md#f06)
- [F07: Internationalization](internationalization.md#f07)
- [F08: Accessibility](accessibility.md#f08)
- [F09: Tutorials and quickstarts](tutorials-and-quickstarts.md#f09)
- [F10: Learning resources and help experience](learning-resources-help.md#f10)
- [F12: Feedback collection](feedback.md#f12)
- [F13: Dynamic Plugin SDK integration](dynamic-plugin-sdk.md#f13)
- [F18: Stratosphere UX](stratosphere.md#f18)
- [F19: Support-case integration](support-case-integration.md#f19)
- [F20: Analytics integration](analytics-integration.md#f20)
- [F21: Scheduler UI](scheduler-ui.md#f21)
- [F22: Global/help/notification drawers](chrome-service.md#f22)
- [F23: Browser events](chrome-service.md#f23)
- [F24: Workspace selection](chrome-service.md#f24)
- [F25: TAM context switching](chrome-service.md#f25)
- [F26: Global inventory filter](chrome-service.md#f26)
- [F27: Favorites, recently visited services, personalization](chrome-service.md#f27)
- [F28: Theme, dark mode, and high contrast](chrome-service.md#f28)
- [F29: Error containment and degraded behavior](chrome-service.md#f29)
- [F30: Preview and feature-flag integration](feature-flags.md#f30)

## Evidence and ownership

Portfolio inclusion was reviewed against the [Services team assignments](https://github.com/orgs/RedHatInsights/teams/experience-services-committers/repositories) on 2026-10-09. Services means Platform Experience Services / Console Framework.

Operational contact and escalation policy: **To confirm**.

- Mounted feedback UI and platform-feedback backend owner: **To confirm**.

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **Red Hat SSO / OIDC** — Authentication/identity service owners; Services owns integration behavior. [Auth architecture](../navigation-and-auth.md).
- **Entitlements** — Entitlements service owner to confirm. [Shell auth and visibility](../navigation-and-auth.md).
- **RBAC, Kessel, and inventory permission APIs** — Upstream authorization/inventory owners; UI application ownership is separate. [Navigation/auth](../navigation-and-auth.md).
