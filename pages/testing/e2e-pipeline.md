# Reusable E2E Test Pipeline (Playwright)

End-to-End Playwright tests are configured to run in the PR pipeline for the following repositories at time of writing.

* insights-chrome
* learning-resources
* frontend-starter-app [in progress]

As we expand our E2E test coverage with Playwright, more repositories will join the list.

## Conceptual Overview

The purpose of this pipeline is to run full-flow end-to-end tests in Playwright. Here is an outline of a hypothetical "full-flow" test:

```text
1. Login to RedHat SSO as jeff the user
2. Confirm that the user lands on the main Console dashboard
3. Confirm that a desired widget is displayed
4. Open the user's drop-down menu in the upper-right-hand corner
5. Click Logout
6. Confirm that logout was successful and the user is taken back to the login page
```

Well-built E2E tests go beyond unit and component tests coverage. They perform a series of interactions same way that an end user would, thus verifying
the integration of components across an entire UI workflow. In short, these are actions an end user would perform with an environment that behaves like a fully-deployed instance of Console (stage, prod, etc).

When tests execute, the pipeline tries to "simulate" a fully deployed application instance by "stitching together" the test environment manually with some
clever proxying. This pipeline approach makes the following assumptions:

1. No changes to insights-chrome are being tested (assumed to be stable)
2. The stage environment is operational (some assets are pulled from stage). API interactions go through stage.
3. The assets to be tested are contained in a single container, which is used for the testing process.

These assumptions are made because a fundamental aspect of application testing must be honored: Only one area of the application should be the focus of testing at any given time. In this case, the area is the "tenant" application or "target frontend". Whereas insights-chrome does indeed require its own testing, that is not the goal of this pipeline. Similarly, the frontend-development-proxy is an internal tool crafted for consumption by developers. It requires its own testing and its own pipeline definition that is very different from this one.

To make this whole scheme work, some manual setup is involved. The user must define ConfigMaps for the associated Caddyfile contents and add them to their Konflux tenant's configuration. Also,
the engineer involved is responsible for laying down the pull request pipeline definition in the repo and verifying that it works before
fully incorporating it into main/master. More details can be found in the guide linked from Knowledge Resources.

## Pipeline Organizational Structure

When the pipeline executes, Konflux does its normal process of building a trusted artifact. The trusted artifact is consumed later,
when Konflux executes the e2e-tests part of the pipeline. The process consists of a main test container along with three sidecars:

1. the chrome assets (base chrome assets taken from insights-chrome-dev image)
2. the test application's assets (from the trusted artifact)
3. the frontend developer proxy (from the image repo)

Because the sidecar containers all run asynchronously of the main container, there is some shell scripting involved that makes the various containers wait
until the desired state is reached before executing their portion of the workload. For example, the frontend developer proxy needs the
test application container and the chrome assets container, so it must wait until each of these is responding to
requests for assets.

The main test container waits for the dev proxy to be responsive to requests (via stage.foo.redhat.com) before firing up the
test run. The run script tries to provide meaningful debug output in the console during execution.

## Shared Pipeline Definition

There are two parts to this pipeline:
1. The "shared" pipeline definition
2. The repository's pull request pipeline definition

The "shared" definition that defines the pipeline is kept in the [konflux-pipelines](https://github.com/RedHatInsights/konflux-pipelines/blob/main/pipelines/platform-ui/docker-build-run-all-tests.yaml) repository.

The portion of the pipeline specific to a given frontend repository is kept in the .tekton folder of the repository. The pipeline defines a "PipelineRun" which executes the pipeline definition from the konflux-pipelines repository.

## Knowledge Resources

To learn more about setting up the pipeline for your repository, you can use [this guide](https://docs.google.com/document/d/1JnOJ5w4Q-OW3vlvHhTxhzOep6A2sveJYWQrX-HOH280/edit?usp=sharing)

There is also a [NotebookLM](https://notebooklm.google.com/notebook/7a32f12f-9b07-4cb3-b966-3af6caad5d86) set up to aid in answering questions

The README files of the various repositories are also useful, including:

* [frontend-development-proxy](https://github.com/RedHatInsights/frontend-development-proxy/blob/main/README.md)
* [tekton-playwright-e2e](https://github.com/catastrophe-brandon/tekton-playwright-e2e/blob/main/README.md)

In addition, readings about Tekton, Minikube, Caddy, and Konflux are highly recommended.

At a rudimentary level, familiarity with shell scripting (bash/sh) and Kubernetes are both required and heavily used within the pipeline.