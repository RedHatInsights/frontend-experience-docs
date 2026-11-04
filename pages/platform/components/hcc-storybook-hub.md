# Storybook Hub

**Accountable team:** UI<br>
**Type:** Developer tooling<br>
**Status:** Tracked<br>
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Composed Storybook interface for browsing stories from multiple console frontend applications.

## Backing repository

- [hcc-storybook-hub](https://github.com/RedHatInsights/hcc-storybook-hub)

## Responsibility boundaries

UI owns the browsing/discovery hub. Individual application owners maintain their stories and run interaction/accessibility tests; composition is not a centralized test runner.

## Dependencies and supporting responsibilities

- **Application teams:** Publish their individual Storybooks and maintain story URLs.
- **UI components:** [Shared Frontend Components](frontend-components.md#ui-components).
- **Storybook / Chromatic providers:** Underlying documentation and hosting services.

## Evidence and ownership

UI portfolio inclusion is evidenced by the [UI team repository assignments](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories), reviewed on 2026-10-23. This identifies repository scope; it does not establish exclusive operational ownership. UI means Platform Experience UI; Services means Platform Experience Services / Console Framework.

- **Reviewed source:** [Repository README](https://github.com/RedHatInsights/hcc-storybook-hub/blob/29d357bd54024d4aa943b5262afa99468c043cb7/README.md).
- **Reviewed repository tree:** [Pinned implementation](https://github.com/RedHatInsights/hcc-storybook-hub/tree/29d357bd54024d4aa943b5262afa99468c043cb7).
- **Operational contact and escalation policy:** To confirm.

Implementation guides and runbooks stay in the backing repository. Repository status is not proof of production deployment or migration completion.

## Build and release configuration

No Konflux push pipeline was found in the reviewed repository tree. Check repository workflows for publishing; absence from the supplied Konflux screenshot does not establish retirement.
