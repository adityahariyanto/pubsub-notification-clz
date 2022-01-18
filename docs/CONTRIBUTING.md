# Contribution Guideline

This document describes the contribution guidelines for anyone wishing to contribute on the Terraform module development. These guidelines walk through the development environment setup, coding style & agreed standards/best practices, testing practices and how to submit the code for review.

## Development Environment Setup

See the document in [docs/DEVELOPMENT_ENVIRONMENT.md](./docs/DEVELOPMENT_ENVIRONMENT.md) for the instructions how to setup the development environment.

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
