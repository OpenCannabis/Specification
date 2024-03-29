
#
## OpenCannabis: Specification
#

VERSION ?= 2.0.0-alpha2

CI ?= no
DEBUG ?= no
VERBOSE ?= no
WORKFLOW ?= protocol
TOOL ?=
APP ?=

UNGATED ?= no
SDK_VERSION = "v2"
SDK_REVISION = "r2"
SDK_DEPLOY_PROFILE = "default"

## Targets
SCHEMA ?= //opencannabis
#IMAGE ?= //opencannabis:image
DOCS ?= //opencannabis:docs

#### Targets: SDKs
PYSDK ?= //sdk/python:library
JAVASDK ?= //sdk/java

SDKS ?= $(PYSDK) $(JAVASDK)
DOCROOT ?= $(shell pwd)/site/docs

TARGETS ?= $(SCHEMA) $(IMAGE) $(SDKS)
DISABLED_TARGETS ?= $(DOCS)
RELEASE_TARGETS ?= $(SDKS) $(IMAGE)

## Args
PWD ?= $(shell pwd)
BAZELISK_ARGS ?=
BASE_ARGS ?=
BUILD_ARGS ?= $(BASE_ARGS)
ENV ?= $(PWD)/.env
BAZELISK_VERSION ?= v1.9.0

COPYBARA_ACTION ?= migrate
COPYBARA_FLAGS ?= --ignore-noop
NODE_MODULES ?= node_modules/
SITE_NODE_MODULES ?= site/node_modules/

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
CP ?= $(shell which cp)
TAR ?= $(shell which tar)
GIT ?= $(shell which git)
GREP ?= $(shell which grep)
JAVA ?= $(shell which java)
CURL ?= $(shell which curl)
BASH ?= $(shell which bash)
YARN ?= $(shell which yarn)
MKDIR ?= $(shell which mkdir)
CHMOD ?= $(shell which chmod)
GCLOUD ?= $(shell which gcloud)

## Local Tools
BAZELISK_BIN ?= $(ENV)/bazelisk
COPYBARA_JAR ?= $(ENV)/copybara.jar
COPYBARA_JAR_SRC ?= https://storage.googleapis.com/cookies-runtime/software/copybara.jar
BAZELISK_BIN_SRC ?= https://github.com/bazelbuild/bazelisk/releases/download/$(BAZELISK_VERSION)/bazelisk-$(PLATFORM)-amd64

LOCAL_TOOLS ?= $(COPYBARA_JAR)

## KMS
KMS_ARGS ?= --project=opencannabis-crypto --keyring=devops --key=keys --location=global

KMS_SITE_ENV_PLAINTEXT ?= site/.env
KMS_SITE_ENV_CIPHERTEXT ?= $(KMS_SITE_ENV_PLAINTEXT).enc
KMS_SITE_ENV ?= --plaintext-file=$(KMS_SITE_ENV_PLAINTEXT) --ciphertext-file=$(KMS_SITE_ENV_CIPHERTEXT)

## Aliases
BAZEL ?= $(BAZELISK_BIN) $(BAZELISK_ARGS)
COPYBARA ?= $(JAVA) -jar $(COPYBARA_JAR)


all: build test sdk-java  ## Build and test the specification.

build: $(BAZELISK_BIN) $(LOCAL_TOOLS) $(KEYS)  ## Build specification targets via `TARGETS=` (by default, all of them).
	$(info Building OpenCannabis...)
	$(RULE)$(BAZEL) build $(BUILD_ARGS) -- $(TARGETS)

run tool: $(BAZELISK_BIN) $(LOCAL_TOOLS) $(KEYS)  ## Run a tool or application, specified by `APP=`.
	$(info Running OpenCannabis...)
	$(RULE)$(BAZEL) run $(BUILD_ARGS) -- $(TOOL) $(APP)

site: $(BAZELISK_BIN) $(LOCAL_TOOLS) $(NODE_MODULES) $(SITE_NODE_MODULES) $(KEYS)  ## Build the OpenCannabis site.
	$(info Building OpenCannabis site...)
	$(RULE)cd site && $(YARN) run build;
	@echo "Site build complete."

export: $(BAZELISK_BIN) $(LOCAL_TOOLS) $(NODE_MODULES) $(SITE_NODE_MODULES) $(KEYS)  ## Export the OpenCannabis site as a static package.
	$(info Exporting OpenCannabis site...)
	$(RULE)cd site && $(YARN) run export;
	@echo "Site export complete. Targets ready in 'site/out'."

dev: $(BAZELISK_BIN) $(LOCAL_TOOLS) $(NODE_MODULES) $(SITE_NODE_MODULES) $(KEYS)  ## Run the OpenCannabis project site via Next.
	$(info Running OpenCannabis site...)
	$(RULE)cd site && $(YARN) run dev;

release: $(BAZELISK_BIN) $(LOCAL_TOOLS)  ## Perform a release build, including a doc/bin update.
	$(info Releasing OpenCannabis...)
	$(RULE)$(BAZEL) build $(BUILD_ARGS) --config=release -- $(RELEASE_TARGETS) \
		&& $(MKDIR) -p $(DOCROOT) \
		&& echo "Library release complete.";


#		&& $(CP) -f $(POSIX_FLAGS) dist/bin/opencannabis/OpenCannabis.buf.bin ./OpenCannabis.buf.bin \
#		&& echo "Image release complete.";

docs: $(BAZELISK_BIN) $(LOCAL_TOOLS)  ## Update built docs.
	$(info Building OpenCannabis docs...)
	$(RULE)$(BAZEL) build $(BUILD_ARGS) -- $(DOCS) \
		&& $(MKDIR) -p $(DOCROOT)/reference \
		&& $(TAR) -xvf dist/bin/opencannabis/docs.tar -C $(DOCROOT)/reference/ \
		&& echo "Docs ready in directory 'docs/'."

test: $(BAZELISK_BIN) $(LOCAL_TOOLS)  ## Run all spec and SDK tests.
	$(info Running testsuite...)

clean-env:  ## Refresh the local codebase environment (safe).
	$(info Dropping env...)
	$(RULE)rm -fr $(ENV)

clean: clean-env $(BAZELISK_BIN)  ## Clean built targets (safe).
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

env: $(ENV) $(KEYS)  ## Bootstrap the local environment.

keys $(KEYS):  ## Decrypt key material needed for development. Requires GCP permissions.
	$(info Decrypting key material...)
	$(RULE)$(GCLOUD) kms decrypt $(KMS_ARGS) $(KMS_SITE_ENV)
	@echo "Keys decrypted."

sdk-java: $(ENV) $(KEYS)  ## Build the full OpenCannabis SDK for Java.
	@echo "Cleaning Java SDK build root..."
	$(RULE)$(RM) -rf ./sdk/java/java-sdk-v2.tar.gz
	$(RULE)bash ./sdk/java/build.sh

sdk-java-publish:  ## Publish the OpenCannabis SDK for Java.
	$(info Publishing OpenCannabis SDK for Java...)
	@echo "Active deploy profile: '$(SDK_DEPLOY_PROFILE)'"
	$(RULE)echo "Unpacking SDK..." \
		&& mkdir -p ./sdk/java/dist \
		&& cd ./sdk/java/dist \
		&& cp $(POSIX_FLAGS) -f ../java-sdk-$(SDK_VERSION).tar.gz ./java-sdk.tar.gz \
		&& tar $(POSIX_FLAGS) -xzf java-sdk.tar.gz \
		&& echo "Unpacking library 'proto-opencannabis-base-$(SDK_VERSION)'..." \
		&& tar $(POSIX_FLAGS) -xzf ./proto-opencannabis-base-$(SDK_VERSION).pkg.tar.gz \
		&& echo "Publishing 'proto-opencannabis-base-$(SDK_VERSION).tar.gz'..." \
		&& ../publish_$(SDK_DEPLOY_PROFILE).sh ./proto-opencannabis-base-$(SDK_VERSION)-pom.xml ./proto-opencannabis-base-$(SDK_VERSION).jar $(SDK_VERSION)$(SDK_REVISION) $(SDK_DEPLOY_PROFILE) \
		&& echo "Published 'proto-opencannabis-base-$(SDK_VERSION).tar.gz.";
	@echo "Cleaning up..."
	$(RULE)rm $(POSIX_FLAGS) -fr ./sdk/java/dist
	@echo "Finished publish cycle for Java SDK $(SDK_VERSION) (deploy profile: '$(SDK_DEPLOY_PROFILE)')."

sdk-java-release:  ## Publish the OpenCannabis SDK for Java to all production repositories.
ifeq ($(UNGATED),yes)
	@echo "\n\nCAUTION: Deploying to Maven Central. You have 10 seconds to cancel...\n\n";
	@sleep 10;
	@echo "\nDeploying to Maven Central...";
	$(RULE)$(MAKE) sdk-java-publish SDK_DEPLOY_PROFILE=stage;
else
ifeq ($(SNAPSHOT),yes)
	@echo "\n\nCAUTION: Deploying to Maven Snapshots. You have 10 seconds to cancel...\n\n";
	@sleep 10;
	@echo "\nDeploying to Maven Snapshots...";
	$(RULE)$(MAKE) sdk-java-publish SDK_DEPLOY_PROFILE=snapshot;
else
	$(RULE)$(MAKE) sdk-java RELEASE=yes
	@echo "\nPublishing to Artifact Registry (sandbox)..."
	$(RULE)$(MAKE) sdk-java-publish SDK_DEPLOY_PROFILE=default;
endif
endif

#		&& echo "Building Java SDK with Gradle..." \
#		&& cd java-sdk-v2 \
#		 	&& ./gradlew --no-daemon -q projects \
#		 	&& ./gradlew --no-daemon assemble -x test \
#		&& echo "Build complete. Cleaning up..." \
#		&& cd ../.. && rm -fr dist \
#		&& du -h ./*.tar.gz \
#		&& echo "SDK release ready.";

encrypt:  ## Encrypt, or re-encrypt, local key material. Requires GCP permissions.
	$(info Encrypting key material...)
	$(RULE)$(GCLOUD) kms encrypt $(KMS_ARGS) $(KMS_SITE_ENV)
	@echo "Keys encrypted."

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

$(NODE_MODULES):
	$(info Installing Node dependencies for module 'main'...)
	$(RULE)$(YARN)

$(SITE_NODE_MODULES):
	$(info Installing Node dependencies for module 'site'...)
	$(RULE)cd site && $(YARN)

$(COPYBARA_JAR): $(ENV)
	$(info Installing Copybara...)
	$(RULE)$(CURL) --progress-bar $(COPYBARA_JAR_SRC) > $(COPYBARA_JAR)

$(BAZELISK_BIN): $(ENV)
	$(info Installing Bazelisk...)
	$(RULE)$(CURL) -L --progress-bar $(BAZELISK_BIN_SRC) > $(BAZELISK_BIN) && $(CHMOD) +x $(BAZELISK_BIN)

.PHONY: build test clean distclean forceclean help env docs site
