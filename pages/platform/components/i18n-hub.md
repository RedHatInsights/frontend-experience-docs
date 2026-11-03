# Internationalization Hub

**Accountable team:** UI<br>
**Type:** Localization automation<br>
**Status:** Tracked<br>
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Central GitHub Actions automation for Phrase TMS submission and reconciliation across registered console repositories, using i18n-tooling workflows and the i18n GitHub App.

## Backing repository

- [i18n-hub](https://github.com/RedHatInsights/i18n-hub)

## Responsibility boundaries

UI owns the hub and its repository-local orchestration. [Internationalization Tooling](i18n-tooling.md) is also UI-owned. Services owns shell/runtime internationalization integration; each consuming application owns its catalogs and adoption.

## Dependencies and supporting responsibilities

- **UI:** [Internationalization Tooling](i18n-tooling.md) reusable workflows and catalog tooling.
- **Services / application teams:** Register consumers, maintain source catalogs, and integrate reviewed translations in their code.
- **Phrase and GitHub platform owners:** Translation service, app installation, and automation infrastructure.
- **Operations:** [Repository operations guide](https://github.com/RedHatInsights/i18n-hub/blob/c26e95d30757fbdf3722af5118fbc4e7a5621b09/docs/operations.md).

## Evidence and ownership

UI portfolio inclusion is evidenced by the [UI team repository assignments](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories), reviewed on 2026-10-23. This identifies repository scope; it does not establish exclusive operational ownership. UI means Platform Experience UI; Services means Platform Experience Services / Console Framework. **UI accountability was confirmed by the team owner on 2026-10-23**, despite access by both teams.

- **Reviewed source:** [Repository README](https://github.com/RedHatInsights/i18n-hub/blob/c26e95d30757fbdf3722af5118fbc4e7a5621b09/README.md).
- **Reviewed repository tree:** [Pinned implementation](https://github.com/RedHatInsights/i18n-hub/tree/c26e95d30757fbdf3722af5118fbc4e7a5621b09).
- **Operational contact and escalation policy:** To confirm.

Implementation guides and runbooks stay in the backing repository. Repository status is not proof of production deployment or migration completion.

## Build and release configuration

No Konflux push pipeline was found in the reviewed repository tree. Check repository workflows for publishing; absence from the supplied Konflux screenshot does not establish retirement.
