# Feedback Collection

**Record type:** Shell integration

The shell-side feedback implementation belongs to [Console Shell](insights-chrome.md). This note retains uncertainty around mounted UI exposure and the external feedback API; it does not establish a separate active frontend service.

**Owner:** Services integration; backend owner to confirm  
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## What it provides

Collects user feedback and connects feedback integrations.

<a id="backing-repositories-and-responsibilities"></a>

## Implementation and consumption relationships

| Related component | Relationship | Contribution to this capability |
|-------------------|--------------|---------------------------------|
| [Console Shell](insights-chrome.md) | Contains retained implementation | Feedback form/API integration exists in source; mounted exposure and backend owner remain to confirm. |

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

## Team responsibility boundary

Services remains accountable for feedback integration; backend ownership stays to confirm. The historical UI grouping of settings, preferences, favorites, and feedback is not a single application ownership boundary. UI-owned settings and preferences are separate catalog components.
