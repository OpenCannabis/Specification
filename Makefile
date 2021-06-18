
#
## OpenCannabis: Specification
#

VERSION ?= 1.9.5-alpha4

CI ?= no
DEBUG ?= no
VERBOSE ?= no
WORKFLOW ?= protocol

## Targets
SCHEMA ?= //opencannabis
IMAGE ?= //opencannabis:image
DOCS ?= //opencannabis:docs

#### Targets: SDKs
PYSDK ?= //sdk/python:library
SDKS ?= $(PYSDK)
DOCROOT ?= $(shell pwd)/docs

TARGETS ?= $(SCHEMA) $(IMAGE) $(DOCS) $(SDKS)

## Args
PWD ?= $(shell pwd)
BAZELISK_ARGS ?=
BASE_ARGS ?=
BUILD_ARGS ?= $(BASE_ARGS)
ENV ?= $(PWD)/.env
BAZELISK_VERSION ?= v1.9.0

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

# OS tweaks
ifeq ($(OS),Windows_NT)
export PLATFORM ?= windows
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        export PLATFORM ?= linux
    endif
    ifeq ($(UNAME_S),Darwin)
        export PLATFORM ?= darwin
    endif
    UNAME_P := $(shell uname -p)
    ifeq ($(UNAME_P),x86_64)
        export ARCH ?= x86
    endif
    ifneq ($(filter arm%,$(UNAME_P)),)
        export ARCH ?= ARM
    endif
endif

## Tools
TAR ?= $(shell which tar)
GIT ?= $(shell which git)
GREP ?= $(shell which grep)
JAVA ?= $(shell which java)
CURL ?= $(shell which curl)
BASH ?= $(shell which bash)
MKDIR ?= $(shell which mkdir)
CHMOD ?= $(shell which chmod)

## Local Tools
BAZELISK_BIN ?= $(ENV)/bazelisk
COPYBARA_JAR ?= $(ENV)/copybara.jar
COPYBARA_JAR_SRC ?= https://storage.googleapis.com/cookies-runtime/software/copybara.jar
BAZELISK_BIN_SRC ?= https://github.com/bazelbuild/bazelisk/releases/download/$(BAZELISK_VERSION)/bazelisk-$(PLATFORM)-amd64


LOCAL_TOOLS ?= $(COPYBARA_JAR)

## Aliases
BAZEL ?= $(BAZELISK_BIN) $(BAZELISK_ARGS)
COPYBARA ?= $(JAVA) -jar $(COPYBARA_JAR)


all: build test  ## Build and test the specification.

build: $(BAZELISK_BIN) $(LOCAL_TOOLS)  ## Build all specification targets.
	$(info Building OpenCannabis...)
	$(RULE)$(BAZEL) build $(BUILD_ARGS) -- $(TARGETS)

docs: $(BAZELISK_BIN) $(LOCAL_TOOLS)  ## Update built docs.
	$(info Building OpenCannabis docs...)
	$(RULE)$(BAZEL) build $(BUILD_ARGS) -- $(DOCS) \
		&& mkdir -p $(DOCROOT) \
		&& $(TAR) -xvf dist/bin/opencannabis/docs.tar -C $(DOCROOT)/ \
		&& echo "Docs ready in directory 'docs/'."

test: $(BAZELISK_BIN) $(LOCAL_TOOLS)  ## Run all spec and SDK tests.
	$(info Running testsuite...)

clean: $(BAZELISK_BIN)  ## Clean built targets (safe).
	$(info Cleaning...)
	$(RULE)$(BAZEL) clean

distclean: $(BAZELISK_BIN)  ## Clean built targets and dependencies.
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

migrate: $(COPYBARA_JAR) $(BAZELISK_BIN)  ## Perform a migration via Copybara.
	$(info Migrating '$(WORKFLOW)'...)
ifeq ($(CI),yes)
	$(RULE)$(GIT) config --global user.name "Cookiebot"
	$(RULE)$(GIT) config --global user.email "techteam+github@cookiescalifornia.com"
endif
	$(RULE)$(COPYBARA) $(COPYBARA_ACTION) copy.bara.sky $(WORKFLOW) $(COPYBARA_FLAGS)

$(ENV):
	$(info Building local environment...)
	$(RULE)$(MKDIR) -p $(POSIX_FLAGS) $(ENV)

$(COPYBARA_JAR): $(ENV)
	$(info Installing Copybara...)
	$(RULE)$(CURL) --progress-bar $(COPYBARA_JAR_SRC) > $(COPYBARA_JAR)

$(BAZELISK_BIN): $(ENV)
	$(info Installing Bazelisk...)
	$(RULE)$(CURL) -L --progress-bar $(BAZELISK_BIN_SRC) > $(BAZELISK_BIN) && $(CHMOD) +x $(BAZELISK_BIN)

.PHONY: build test clean distclean forceclean help env
