
#
## OpenCannabis: Specification
#

VERSION ?= 1.9.5-alpha1

CI ?= no
DEBUG ?= no
VERBOSE ?= no


## Targets
SCHEMA ?= //opencannabis:OpenCannabis
DOCS ?=

#### Targets: SDKs
PYSDK ?= //sdk/python:library
SDKS ?= $(PYSDK)

TARGETS ?= $(SCHEMA) $(DOCS) $(SDKS)


## Args
PWD ?= $(shell pwd)
BAZELISK_ARGS ?=
BASE_ARGS ?=
BUILD_ARGS ?= $(BASE_ARGS)

## Flag Logic
ifeq ($(VERBOSE),yes)
RULE ?=
BUILD_ARGS += --verbose_failures
else
RULE ?= @
endif

ifeq ($(DEBUG),yes)
BUILD_ARGS += --sandbox_debug
endif

## Tools
GIT ?= $(shell which git)
GREP ?= $(shell which grep)
BAZELISK ?= $(shell which bazelisk)

## Aliases
BAZEL ?= $(BAZELISK) $(BAZELISK_ARGS)


all: build test  ## Build and test the specification.

build:  ## Build all specification targets.
	$(RULE)$(BAZEL) build $(BUILD_ARGS) -- $(TARGETS)

test:  ## Run all spec and SDK tests.
	$(info Running testsuite...)

clean:  ## Clean built targets (safe).
	$(info Cleaning...)
	$(RULE)$(BAZEL) clean

distclean:  ## Clean built targets and dependencies.
	$(info Cleaning dependencies...)
	$(RULE)$(BAZEL) clean --expunge

forceclean:  ## Clean everything, then sanitize changes (DANGEROUS).
	$(info Force-cleaning codebase...)
	$(RULE)$(GIT) reset --hard
	$(RULE)$(GIT) clean -xdf

help:  ## Show this help text.
	$(info OpenCannabis v$(VERSION):)
	$(RULE)$(GREP) -E '^[a-z1-9A-Z_-]+:.*?## .*$$' $(PWD)/Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


.PHONY: build test clean distclean forceclean

