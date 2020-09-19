
![](https://static.cookies.co/static/ocp/branding/logotype-v1.png)

[![Build status](https://badge.buildkite.com/d86639c788d5af7344667e0e048a350c5bf3b0b82c33181f72.svg)](https://buildkite.com/opencannabis/specification) ![Latest release](https://img.shields.io/github/v/release/OpenCannabis/Protocol?include_prereleases) ![Contributors](https://img.shields.io/github/contributors/OpenCannabis/RFC) ![Licensing](https://img.shields.io/github/license/OpenCannabis/Protocol)

## Introduction

OpenCannabis is a multilateral industrial effort to bring order to cannabis data, via the power of collaborative spec
design. The project covers expression of cannabis-related data in myriad supply chain circumstances, including
cultivation, distribution, distillation (manufacturing), retail, and consumer-facing software.

This specification has been designed over time principally in the California cannabis market, which is one of the most
competitive retail and wholesale cannabis markets in the world. Contributors and adopters include some of the best and
brightest cannabis operators, who have condensed much of their knowledge into this model, and leveraged it for concrete
operational gains.

### Editors, Adopters, and Contributors

NASCAR wall coming soon.

### What's this repo?

This repository is the _main spec repo_, and it is a _monorepo_. All other OpenCannabis documentation, RFC content, and
source code material flows from this central repository (that's where the _mono_ comes from in monorepo). Changes are
proposed at this level only by invited specification _Editors_ and _Contributors_.

## Workflow

This central repository is meant only for spec _Editors_ and _Contributors_. However, contributions can be made on
public leaf repositories as outlined below (and these repositories also eventually get the latest changes from
upstream).

#### How are changes proposed, reviewed, and ratified?

Governance for the project itself also occurs through RFCs! Project change processes/policies, contribution guidelines
and agreements, and other policies are mutable and meant to evolve. Changes to these can simply be proposed like any
other change to the specification.

#### How do ratified changes flow downstream?

Once a PR is proposed, reviewed, and merged into `master`, a CD bot kicks in that migrates those changes to each public
leaf repository using [Copybara](https://github.com/google/copybara). So, changes here are sufficient to see changes in
public, post-merge.

Leaf repositories include raw sources (for instance, the
_[Protocol Definitions](https://github.com/OpenCannabis/Protocol)_), and language-specific SDKs / facades (for example,
_[OpenCannabis SDK for Python](https://github.com/OpenCannabis/Python)_).

#### How do change proposals flow upstream?

When a PR is proposed in a leaf repository, it _also_ kicks in a CI bot that proposes a PR in the upstream repository.
This allows easy collaborative development without the need to (1) duplicate PRs, or (2) risk public access to the
private spec workspace.

## Development & Tooling

Tooling for this repo, and downstream repos, is mainly provided by Google (including
[Copybara](https://github.com/google/copybara), [Protocol Buffers](https://github.com/protocolbuffers/protobuf), and
[Bazel](https://github.com/bazelbuild/bazel)). There is usually also a `Makefile` which can be invoked, that delegates
to repo-specific tools. It's usually advisable to use `make`.

Each repository's `Makefile` can be queried with `make help`, which lists commands at the developer's disposal (access
permitting). Here is a preview of that help for this repo:

```text
OpenCannabis v1.9.5-alpha1:
all                            Build and test the specification.
build                          Build all specification targets.
clean                          Clean built targets (safe).
distclean                      Clean built targets and dependencies.
env                            Bootstrap the local environment.
forceclean                     Clean everything, then sanitize changes (DANGEROUS).
help                           Show this help text.
migrate                        Perform a migration via Copybara.
test                           Run all spec and SDK tests.
```

## Legal

Coming soon.

