# Internationalization Tooling

**Implementation ID:** S29  
**Accountable team:** UI<br>
**Type:** Localization tooling  
**Status:** Tracked  
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

ICU catalog validation, ESLint rules, catalog adapters/CLI, reusable workflows, and Phrase TMS submission/reconciliation.

## Backing repository

- [i18n-tooling](https://github.com/RedHatInsights/i18n-tooling)

## Capabilities

- [F07: Internationalization](internationalization.md#f07)

## Evidence and ownership

UI accountability was confirmed by the team owner on 2026-10-23. The repository appears in both [UI](https://github.com/orgs/RedHatInsights/teams/experience-ui-committers/repositories) and [Services](https://github.com/orgs/RedHatInsights/teams/experience-services-committers/repositories) assignments; access does not override this ownership decision. UI means Platform Experience UI; Services means Platform Experience Services / Console Framework.

Operational contact and escalation policy: **To confirm**.

- **Reviewed source evidence:** [i18n-tooling README](https://github.com/RedHatInsights/i18n-tooling/blob/9b9141a3a537f28627c00005d983f67daf78ff2e/README.md)

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **Phrase translation management** — Translation-platform/account owners provide Phrase; UI owns tooling integration. Services owns shell/runtime integration. [i18n-tooling](https://github.com/RedHatInsights/i18n-tooling).

## Supporting responsibilities

[Internationalization Hub](i18n-hub.md) orchestrates these workflows and is UI-owned. Services integrates localization into the shell; application teams maintain their catalogs and consume translations.

## Build and release configuration

No Konflux push pipeline was found in the reviewed repository tree. Check repository workflows for publishing; absence from the supplied Konflux screenshot does not establish retirement.
