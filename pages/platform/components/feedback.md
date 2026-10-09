# Feedback Collection

**Owner:** Services integration; backend owner to confirm  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## What it provides

Collects user feedback and connects feedback integrations.

## Backing repositories and responsibilities

The implementation records below describe the backing code, its broader responsibilities, lifecycle, and source evidence.

| Backing implementation | Repository / source | Responsibility |
|------------------------|---------------------|----------------|
| [Console Shell](insights-chrome.md) | [insights-chrome](https://github.com/RedHatInsights/insights-chrome) | Masthead, navigation, authentication integration, micro-frontend hosting, public Chrome API, and shared shell state. |

## Capability boundaries

<a id="f12"></a>

### Feedback collection

**Capability ID:** F12

Native feedback implementation/API remains in source; current UI wiring and backend ownership need confirmation.

The retained native feedback implementation does not establish current mounted UI exposure. Provider enablement and platform-feedback backend ownership remain open questions.

## Ownership and dependency references

Services means Platform Experience Services / Console Framework. Upstream providers and application owners retain their own boundaries. Confirm operational contacts and any unresolved stewardship or migration status with the relevant component owner.

The linked backing implementations carry pinned source evidence and implementation guidance. Relevant provider and owner references are listed below.

## Dependencies and owner references

- **Platform-feedback API** — Backend owner and current mounted consumer to confirm. [Retained feedback implementation](https://github.com/RedHatInsights/insights-chrome/blob/master/src/components/Feedback/FeedbackForm.tsx).
