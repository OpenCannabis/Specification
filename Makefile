
#
## OpenCannabis: Specification
#

VERSION ?= 1.9.5-alpha1

CI ?= no
DEBUG ?= no
VERBOSE ?= no
WORKFLOW ?= protocol

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
ENV ?= $(PWD)/.env

COPYBARA_ACTION ?= migrate
COPYBARA_FLAGS ?= --ignore-noop

## Flag Logic
ifeq ($(VERBOSE),yes)
RULE ?=
BUILD_ARGS += --verbose_failures
POSIX_FLAGS ?= -v
else
RULE ?= @
POSIX_FLAGS ?=
endif

ifeq ($(DEBUG),yes)
BUILD_ARGS += --sandbox_debug
endif

ifeq ($(CI),yes)
BUILD_ARGS += --config=ci
endif

## Tools
GIT ?= $(shell which git)
GREP ?= $(shell which grep)
JAVA ?= $(shell which java)
CURL ?= $(shell which curl)
BASH ?= $(shell which bash)
MKDIR ?= $(shell which mkdir)
BAZELISK ?= $(shell which bazelisk)

## Local Tools
COPYBARA_JAR ?= $(ENV)/copybara.jar
COPYBARA_JAR_SRC ?= https://storage.googleapis.com/cookies-runtime/software/copybara.jar

LOCAL_TOOLS ?= $(COPYBARA_JAR)

## Aliases
BAZEL ?= $(BAZELISK) $(BAZELISK_ARGS)
COPYBARA ?= $(JAVA) -jar $(COPYBARA_JAR)


all: build test  ## Build and test the specification.

build: $(LOCAL_TOOLS)  ## Build all specification targets.
	$(RULE)$(BAZEL) build $(BUILD_ARGS) -- $(TARGETS)

test: $(LOCAL_TOOLS)  ## Run all spec and SDK tests.
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

env: $(ENV)  ## Bootstrap the local environment.

migrate: $(COPYBARA_JAR)  ## Perform a migration via Copybara.
	$(info Migrating '$(WORKFLOW)'...)
	$(RULE)$(COPYBARA) $(COPYBARA_ACTION) copy.bara.sky $(WORKFLOW) $(COPYBARA_FLAGS)

$(ENV):
	$(info Building local environment...)
	$(RULE)$(MKDIR) -p $(POSIX_FLAGS) $(ENV)

$(COPYBARA_JAR): $(ENV)
	$(info Installing Copybara...)
	$(RULE)$(CURL) --progress-bar $(COPYBARA_JAR_SRC) > $(COPYBARA)


.PHONY: build test clean distclean forceclean help env
