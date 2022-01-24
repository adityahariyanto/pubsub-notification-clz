# Development Environment Setup

Repeat the steps in this section in order to setup the development environment and install all required dependencies and tooling.

## 1.0 General System Requirements

Following technologies and tooling should be installed with the minimum supported versions (_when applicable_) on the system, as **pre-requisite** for some of the technologies mentioned later on this document.

### 1.1 Hard Requirements

- [go](https://go.dev/doc/install) >= `v1.17.3`
- [Python](https://www.python.org/downloads/) >= `v3.8.5`
- Bash >= `v5.1.8` or zsh >= `v5.8`
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) >= `v1.1.3`
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) >= `v365.0.1`
- [git](https://git-scm.com/downloads) >= `v2.34.1`

### 1.2 Optional Requirements

- [azure-cli](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) >= `v2.32.0`
- [az devops](https://docs.microsoft.com/en-us/cli/azure/devops?view=azure-cli-latest) (_azure-cli extension_)
- [VS Code](https://code.visualstudio.com/download) >= `v1.63.2`(_recommended code-editor_)
- [tfenv](https://github.com/tfutils/tfenv) or [tfswitch](https://tfswitch.warrensbox.com/) (_for easily switching between terraform versions_)

## 2 pre-commit

This repository uses [pre-commit](https://pre-commit.com/) tool to automate certain functionality and enforcing some industry standards, such as [Conventional Commits](https://www.conventionalcommits.org/en/about/) and [Semantic Versioning](https://semver.org/spec/v2.0.0.html). Pre-commit allows to install [git-hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) that enable automated `pre-` or `post-commit` hooks to be run, that can do various things such as automated documentation generation, syntax validation etc. `pre-commit` is tool that simplifies the management and enablement of these hooks.

### 2.1 Install and configure pre-commit

Follow the instructions [how to install pre-commit](https://pre-commit.com/#install) on your Operating System. Once `pre-commit` is installed, the pre-commit hooks are ready to be installed and this needs to be done separately on each locally cloned repository.

### 2.2 Install pre-commit hooks

Run following command on the root of the repository

```
pre-commit install --config .config/.pre-commit-config.yaml
pre-commit install --hook-type commit-msg --config .config/.pre-commit-config.yaml
pre-commit install --hook-type pre-push --config .config/.pre-commit-config.yaml
```

### 2.3 Usage

Once `pre-commit` is successfully installed on the system, and `pre-commit install` is ran on a repository the `git-hooks` will work automatically on each `git commit`.

## 3 conform

This repository uses [Conform](https://github.com/talos-systems/conform) to validate the commit messages to better support automated `CHANGELOG.md` keeping. The tool is enforcing certain rules, such as [Conventional Commits](https://www.conventionalcommits.org/en/about/) rules to ensure all the commits are passing standards.

### 3.1 Install conform

Recommended way to instal the `conform` on the system is via command:

```
go install github.com/talos-systems/conform/cmd/conform@latest
```

### 3.2 Usage

When the **commit-msg** `git-hook` is installed as described in <u>step 1.1.2</u> `conform` is run automatically after each commit message is saved.

If however `conform` needs to be run manually it can be done with following command:

```
conform enforce
```

## 4 uplift

This repository uses [uplift](https://github.com/gembaadvantage/uplift) to automate `git-tagging` and generating CHANGELOD.md according to [keep a changelog](https://keepachangelog.com/en/1.0.0/). The uplift is used by the build pipeline, when creating a pull request.

### 4.1 Install uplift (Optional)

Install [uplift](https://github.com/gembaadvantage/uplift) according to the instructions based on the OS.

### 4.2 Usage

**uplift** may be used manually according to the instructions on the uplift-repository.

## 5 tflint

This repository uses [tflint](https://github.com/terraform-linters/tflint) to automate Terraform code linting. Terraform code is supposed to be run against linters locally and on **CI/CD** pipelines to ensure the code follows up certain standards and conventions.

### 5.1 Install tflint

Install [tflint](https://github.com/terraform-linters/tflint) according to the instructions based on the OS.

In order to run the linters successfully `tflint` needs to be initialised on every repository for the first time. This can be done via running:

```
tflint --init
```

### 5.2 Usage

**tflint** may be used manually according to the instructions on the tflint-repository.

## 6 checkov

This repository uses [checkov](https://github.com/bridgecrewio/checkov) to detect security and compliance misconfigurations. Terraform code is supposed to be run against checkov locally and on **CI/CD** pipelines to ensure the code follows up certain standards and conventions.

### 6.1 Install checkov

Install [checkov](https://github.com/bridgecrewio/checkov) according to the instructions based on the OS.

### 6.2 Usage

**checkov** may be used manually according to the instructions on the checkov-repository.

In order to run `checkov`, just execute `checkov -d <directory>`.
