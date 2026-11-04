# Shared Frontend Components

**Implementation ID:** S08  
**Accountable team:** UI for components; Services for the pipeline.<br>
**Type:** Library/tooling monorepo  
**Status:** Tracked  
**Reviewed:** 2026-10-23

[Component index](../component-catalog.md)

## Responsibility

Shared UI components, Chrome bindings, utilities, build configuration, test helpers, and development tools.

## Backing repository

- [frontend-components](https://github.com/RedHatInsights/frontend-components)

## Packages

The reviewed source contains **15 package directories**:

- `components`
- `utils`
- `chrome`
- `notifications`
- `remediations`
- `advisor-components`
- `rule-components`
- `types`
- `config`
- `config-utils`
- `testing`
- `translations`
- `eslint-config`
- `tsc-transform-imports`
- `executors`

These are source directories; publication and deployment status are separate inventory facts.

## Capabilities

- [F03: Pluggable UI framework and Chrome API](pluggable-ui-framework.md#f03)
- [F07: Internationalization](internationalization.md#f07)
- [F08: Accessibility](accessibility.md#f08)
- [F28: Theme, dark mode, and high contrast](chrome-service.md#f28)

## Evidence and ownership

The team owner confirmed split accountability on 2026-10-23: UI owns components; Services owns the pipeline. Both teams have repository assignments; those permissions do not collapse the two responsibilities into shared accountability.

Operational contact and escalation policy: **To confirm**.

- **Reviewed source evidence:** [frontend-components packages](https://github.com/RedHatInsights/frontend-components/tree/5d6b99097fa275928279f2645affd77aea3cc040/packages)

Implementation guides and operational runbooks are maintained in the backing source repository. Update this backing record and the relevant capability details together when ownership, lifecycle, or backing sources change.

## Dependencies and owner references

- **PatternFly, Quickstarts, and shared PatternFly extensions** — [PatternFly](https://github.com/patternfly), [React Component Groups](https://github.com/patternfly/react-component-groups), [React Data View](https://github.com/patternfly/react-data-view), [ChatBot](https://github.com/patternfly/chatbot). Confirm team-specific extension stewardship.
- **GitHub/GitLab, npm and package distribution** — Hosting/registry operators and individual repository/package maintainers.
- **UI integration:** [hcc-debugger](https://github.com/RedHatInsights/hcc-debugger), [hcc-storybook-hub](https://github.com/RedHatInsights/hcc-storybook-hub), and [cypress-e2e-image](https://github.com/RedHatInsights/cypress-e2e-image) — Shared debugging/component-documentation/test tooling.

## Lifecycle and history

- The former [charts package](../../services/Frontend_components/migrations/charts.md) is deprecated; use current package inventories and migration guidance.

## Responsibility boundaries

<a id="ui-components"></a>

### Shared Frontend UI Components

**Accountable team:** UI. UI maintains the shared component implementations and their UI behavior. Services supports component delivery by maintaining the pipeline and owns integration into the shell/runtime where applicable. Application-specific components still require their application owners' input.

<a id="pipeline"></a>

### Frontend Components Pipeline

**Accountable team:** Services. Services maintains the pipeline for this monorepo. UI supports it by maintaining component code and addressing component-related failures. Repository ownership is intentionally split by responsibility; this decision does not assign every package directory to a team solely by its name.

The reviewed package inventory above is implementation context, not a package-by-package ownership contract. Operational contacts and any finer package boundaries remain to confirm.

## Build and release configuration

No Konflux push pipeline was found in the reviewed repository tree. Check repository workflows for publishing; absence from the supplied Konflux screenshot does not establish retirement.
