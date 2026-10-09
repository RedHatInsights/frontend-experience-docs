# Browser Feature-Flag Proxy

**Implementation ID:** S36  
**Owner:** Services (portfolio ownership).  
**Type:** Backend service  
**Status:** Tracked  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

Python/FastAPI server-side flag evaluation for browser clients through `/api/featureflags/v0`.

## Backing repository

- [unleash-proxy](https://gitlab.cee.redhat.com/automation-analytics/unleash-proxy/-/tree/main)

## Capabilities

- [F30: Preview and feature-flag integration](feature-flags.md#f30)

## Implementation context

S35's API portal, Console `/docs/api`, and the developers.redhat.com API Catalog are separate surfaces. S36 is the Services integration component; the Unleash flag-management platform is an upstream dependency.

## Evidence and ownership

Ownership inclusion was confirmed by the Services team owner and supported by the backing source. The backing GitLab source is linked above.

Operational contact and escalation policy: **To confirm**.

- **Reviewed source evidence:** [unleash-proxy README](https://gitlab.cee.redhat.com/automation-analytics/unleash-proxy/-/blob/main/README.md)

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **Unleash flag-management platform** — Upstream Unleash instance/platform owner; Services owns [Browser Feature-Flag Proxy](unleash-proxy.md) integration. [Proxy source](https://gitlab.cee.redhat.com/automation-analytics/unleash-proxy).
