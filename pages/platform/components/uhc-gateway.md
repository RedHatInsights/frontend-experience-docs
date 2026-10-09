# OCM API Gateway and Portal

**Implementation ID:** S35  
**Owner:** Services (portfolio ownership).  
**Type:** Gateway and API portal  
**Status:** Tracked  
**Reviewed:** 2026-10-09

[Component index](../component-catalog.md)

## Responsibility

OCM gateway for `api.openshift.com`: Envoy backend routing and Swagger/OpenAPI portal.

## Backing repository

- [uhc-gateway](https://gitlab.cee.redhat.com/service/uhc-gateway/-/tree/master)

## Implementation context

S35's API portal, Console `/docs/api`, and the developers.redhat.com API Catalog are separate surfaces. S36 is the Services integration component; the Unleash flag-management platform is an upstream dependency.

## Evidence and ownership

Ownership inclusion was confirmed by the Services team owner and supported by the backing source. The backing GitLab source is linked above.

Operational contact and escalation policy: **To confirm**.

- **Reviewed source evidence:** [uhc-gateway README](https://gitlab.cee.redhat.com/service/uhc-gateway/-/blob/master/README.md)

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **OCM API backends** — Individual OCM/backend service owners. [Gateway README](https://gitlab.cee.redhat.com/service/uhc-gateway/-/blob/master/README.md).
- **UI integration:** [api-frontend](https://github.com/RedHatInsights/api-frontend) and [api-documentation-frontend](https://github.com/RedHatInsights/api-documentation-frontend) — Console `/docs/api` and developers.redhat.com API Catalog are separate documentation surfaces; [Console Shell](insights-chrome.md) links/integrates with them.
