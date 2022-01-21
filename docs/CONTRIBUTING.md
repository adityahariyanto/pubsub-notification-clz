# Contribution Guideline

This document describes the contribution guidelines for anyone wishing to contribute on the Terraform module development. These guidelines walk through the development environment setup, coding style & agreed standards/best practices, testing practices and how to submit the code for review.

## Development Environment Setup

See the document in [docs/DEVELOPMENT_ENVIRONMENT.md](./docs/DEVELOPMENT_ENVIRONMENT.md) for the instructions how to setup the development environment.

## General Ways of Working

We follow the general best practices for distributed teams and version controlled systems and source-code, more specifically we:
- use & enforce [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) in order to be explicity, descriptive and detailed on every unit of work we submit to source-code
- use & enforce [semantic versioning](https://semver.org/spec/v2.0.0.html) (_unless not applicable_) in order to clearly mark, what our changes mean for the existing the systems using our code
- use & enforce [a changelog](https://keepachangelog.com/en/1.0.0/) in order to keep human readable log of changes, in order to maintain transparency on what we have changed and when

On top of the above conventions and toolign that enables us to enforce these conventions, we agree to use following conventions on our work:
- we apply changes to the code only on branches, that are created from the latest **main-branc** upstream
- we follow clear naming convention for the branches we create:
    - new features to existing code is commited under branch that follows convention of `feature/{issue-number}-{short-descriptive-name}`
    - bugfixes or patches to code, that are tied to reported issue is committed under branch that follows convention of `[bugfix|hotix|security]/{issue-number}-{short-descriptive-name}`
- all of our changes go through pull-request flow and we fill up the **Pull Request** template accordingly
- we prefer clean commit-history and attempt to merge only single commit to the main-branch
- only approved pull requests will be merged on the main-branches
- we update and maintain the progress of our work in our team sprint board and are transparent towards our team on the progress, any outstanding issues and actively & proactively ask questions, when something is not clear
- we make sure our development environment has been setup to work with the tooling and our work follows up the conventions, that our tooling is enforcing

## Working with Terraform

These modules follow to an extend [Nordcloud's Terraform Best Practices](https://bitbucket.org/nordcloud/documentation_terraform_practices/src/master/). Any differences to the practices described on the linked Bitbucket repository are described here.

## Working with unit-tests

This repository uses [Terratest](https://terratest.gruntwork.io/) for the unit-tests. Tests are written locally on the module `test/`-directory and module-type (_base,template or blueprint-module_) determines the required complexity and requirements of the test details.

Unit tests-are run both locally and on by DevOps automation using [test-container](https://github.com/nordcloud/google-cloud-foundation-tools/tree/main/containers) build specifically for these modules. The test-container includes everything needed to run these modules, incl. sample variable inputs and all the dependencies installed.

### Ensuring existing unit-tests are passing

Before any code is pushed to upstream, the existing unit-tests should pass locally to avoid reserving build agents unnecessarily for the build jobs. The unit-tests can be run using the docker-container mentioned above, and instructions how to do so can be found on the `test/`-directory on this repository.

### Adding and updating the tests

Whenever new functionality is added and/or old implementation is changed, unit-tests need to reflect those changes.

If new functionality is added, it is the best practice to add completely new unit-test, targeting only the added functionality. When old implementation is changed, e.g. changing the naming convention for resource naming, old unit-tests maybe failing due to the change. In this case the old tests should be changed to reflect the change.

Finally, **no contribution will be accepted** if it does not include increased/improved test coverage.
