
#
## OpenCannabis SDK for Python
#

PROJECT ?= ocpy
VERSION ?= 1.0.0

PWD ?= $(shell pwd)
ENV ?= $(PWD)/.env
DIST ?= $(PWD)/dist
LIBDIST ?= $(DIST)/lib
GUSTLIB ?= $(DIST)/shim
VERBOSE ?= no
TARGET ?= //:archive //:shim
TESTS ?= //pytests:tests
IBAZEL_VERSION ?= v0.13.1
BAZELISK_VERSION ?= v1.6.0
COVERAGE ?= no
RELEASE ?= no
CI ?= no
COLORS ?= yes
TAG ?=
DISTRIBUTIONS ?= sdist bdist_egg
CODECOV_TOKEN ?= 92dcb8f1-a702-4eff-8239-0e19bcfbccd2
TWINE_ACTION ?= upload
TWINE_ARGS ?=

COVERAGE_ARGS ?= -t- \
	--instrument_test_targets \
	--experimental_cc_coverage \
	--test_output=all \
	--linkopt=--coverage \
	--linkopt=-lc \
	--combined_report=lcov \
	--test_env="PYTHON_COVERAGE=$(PWD)/.env/coverage/coveragepy-lcov-support/__main__.py"

ifeq ($(CI),yes)
COVERAGE_REPORT ?= $(PWD)/bazel-out/_coverage/_coverage_report.dat
else
COVERAGE_REPORT ?= $(DIST)/out/_coverage/_coverage_report.dat
endif

ifeq ($(COVERAGE),yes)
TEST_COMMAND ?= coverage
TEST_ARGS ?= $(COVERAGE_ARGS)
else
TEST_COMMAND ?= test
TEST_ARGS ?= --test_output=all
endif

ifeq ($(CI),yes)
TAG += --config=ci
endif

ifeq ($(RELEASE),yes)
TAG += --config=release
endif

ifeq ($(VERBOSE),no)
RULE ?= @
POSIX_FLAGS ?=
else
RULE ?=
POSIX_FLAGS ?= -v
endif

LIB_ARCHIVE ?= $(PWD)/dist/bin/opencannabis/ocp-lib-archive.tar
GUST_ARCHIVE ?= $(PWD)/dist/bin/opencannabis/gust-lib-archive.tar

CP ?= $(shell which cp)
MV ?= $(shell which mv)
LN ?= $(shell which ln)
TAR ?= $(shell which tar)
CAT ?= $(shell which cat)
SED ?= $(shell which sed)
AWK ?= $(shell which awk)
GREP ?= $(shell which grep)
CURL ?= $(shell which curl)
CHMOD ?= $(shell which chmod)
MKDIR ?= $(shell which mkdir)
TWINE ?= $(shell which twine)
VIRTUALENV ?= $(shell which virtualenv)
SYS_PYTHON ?= $(shell which python3)
GRCOV ?= $(shell which grcov)

PIP ?= $(ENV)/python/bin/pip
PYTHON ?= $(ENV)/python/bin/python
IBAZEL ?= $(ENV)/bin/ibazel
BAZELISK ?= $(ENV)/bin/bazelisk

include tools/Check.makefile

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


all: build test  ## Build and test the SDK.

build: $(LIBDIST) $(BAZELISK)  ## Build the Python SDK for OpenCannabis.

prompt: $(LIBDIST)  ## Run an interactive prompt with the build SDK.
	@echo "Starting interactive terminal session..."
	$(RULE)cd $(LIBDIST) && $(PYTHON)

ifeq ($(COVERAGE),yes)
test: $(ENV)/python $(BAZELISK) $(ENV)/coverage  ## Run unit tests for the SDK.
else
test: $(ENV)/python $(BAZELISK)
endif
	@echo "Running testsuite..."
	$(RULE)$(BAZELISK) $(TEST_COMMAND) $(TAG) $(TEST_ARGS) $(TESTS)

coverage:  ## Generate a unified coverage report. Typically run in CI and requires grcov.
	@echo "Generating coverage report..."
	$(RULE)$(CP) -f $(POSIX_FLAGS) $(COVERAGE_REPORT) coverage.py.info
	$(RULE)$(SED) -i 's/SF:.*test\.runfiles\/ocpy\/pytests/SF:ocpy\/pytests/g' coverage.py.info
	$(RULE)$(GRCOV) coverage.py.info -t lcov \
		--ignore "external/*" --ignore "/usr/*" \
		--ignore "*deps_*" --ignore "*_pb2.py" \
		--llvm > lcov.py.info
	$(RULE)file lcov.py.info

report-coverage:  ## Report coverage results to Codecov.
	@echo "Reporting coverage..."
	$(RULE)curl -s https://codecov.io/bash > codecov.sh
	$(RULE)bash -x codecov.sh -Z $(POSIX_FLAGS) -f ./lcov.py.info -F python_tests -t $(CODECOV_TOKEN)

release: $(LIBDIST) render-tpl  ## Build release artifacts for the library, and re-render codebase docs.
	@echo "Assembling package 'gust'..."
	$(RULE)cd $(GUSTLIB) && $(MV) setup-gust.py setup.py && $(PYTHON) setup.py $(DISTRIBUTIONS)
	$(RULE)cd $(LIBDIST) && $(RM) -fr $(POSIX_FLAGS) gust && $(PYTHON) setup.py $(DISTRIBUTIONS)

publish: $(LIBDIST) render-tpl  ## Publish release artifacts (assuming requisite permissions).
	@echo "Publishing package 'gust'..."
	$(RULE)-cd $(GUSTLIB) && $(TWINE) $(TWINE_ACTION) $(TWINE_ARGS) \
		dist/gust-*.tar.gz;
	@echo "Publishing package 'opencannabis'..."
	$(RULE)cd $(LIBDIST) && $(TWINE) $(TWINE_ACTION) $(TWINE_ARGS) \
		dist/opencannabis-*.tar.gz \
		dist/opencannabis-*.egg;
	@echo "Package published: 'opencannabis==$(VERSION)'."

clean:  ## Remove built artifacts (safe to run with codebase changes).
	@echo "Cleaning codebase..."
	$(RULE)$(RM) -fr $(POSIX_FLAGS) $(LIBDIST) $(GUSTLIB)

render-tpl:  ## Render templates for help materials, such as the main README.
	@echo "Re-rendering codebase templates..."
	@$(SED) "s/{{VERSION}}/$(VERSION)/g" .tpl/ocp-setup.py.tpl > opencannabis/setup.py;
	@$(SED) "s/{{VERSION}}/$(VERSION)/g" .tpl/README.md.tpl > README.md;
	@$(MAKE) help COLORS=no >> README.md;
	@$(CAT) .tpl/README_FOOTER.md.tpl >> README.md;
	@echo "Doc templates rendered."

ifeq ($(COLORS),yes)
help:  ## Show this help text.
	@echo "$(PROJECT) / $(VERSION):\n"
	$(RULE)$(GREP) -E '^[a-z1-9A-Z_-]+:.*?## .*$$' $(PWD)/Makefile | sort | $(AWK) 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
else
help:
	@echo "$(PROJECT) / $(VERSION):\n"
	$(RULE)$(GREP) -E '^[a-z1-9A-Z_-]+:.*?## .*$$' $(PWD)/Makefile | sort | $(AWK) 'BEGIN {FS = ":.*?## "}; {printf "%-30s %s\n", $$1, $$2}'
endif


$(LIBDIST): $(ENV)/python $(BAZELISK)
	@echo "Building SDK..."
	$(RULE)$(BAZELISK) build $(TAG) $(TARGET)
	$(RULE)$(MKDIR) -p $(DIST) $(LIBDIST) $(GUSTLIB)
	$(RULE)cd $(LIBDIST) && $(TAR) $(POSIX_FLAGS) -xf $(LIB_ARCHIVE)
	$(RULE)cd $(GUSTLIB) && $(TAR) $(POSIX_FLAGS) -xf $(GUST_ARCHIVE)

environment env: $(ENV)/python $(BAZELISK)  ## Prepare the local Python environment.
	@echo "Environment ready."

$(ENV):
	@echo "Creating local environment..."
	$(RULE)$(MKDIR) -p $(ENV)

$(ENV)/python: $(ENV)
	@echo "Establishing Python virtualenv..."
	$(RULE)$(VIRTUALENV) $(ENV)/python --python=$(SYS_PYTHON) --prompt="$(PROJECT): " \
		--pip bundle \
		--setuptools bundle \
		--no-wheel;
	@echo "Installing Pip deps..."
	$(RULE)$(PIP) install -r requirements.txt
	@echo "Python environment ready."

$(ENV)/coverage: $(ENV)
	@echo "Installing coverage tools..."
	$(RULE)$(MKDIR) -p $(ENV)/coverage && \
		cd $(ENV)/coverage && \
		$(CURL) -L https://github.com/ulfjack/coveragepy/archive/lcov-support.tar.gz | $(TAR) xz;
	@echo "Coverage tools ready."

$(BAZELISK):
	@echo "Installing local Bazel toolchain..."
	$(_RULE)$(MKDIR) -p $(ENV)/bazel $(ENV)/bin
	@echo "Downloading Bazelisk..."
	$(_RULE)$(CURL) -qL https://github.com/bazelbuild/bazelisk/releases/download/$(BAZELISK_VERSION)/bazelisk-$(PLATFORM)-amd64 > $(ENV)/bazel/bazelisk-$(PLATFORM)
	@echo "Downloading iBazel..."
	$(_RULE)$(CURL) -qL https://github.com/bazelbuild/bazel-watcher/releases/download/$(IBAZEL_VERSION)/ibazel_$(PLATFORM)_amd64 > $(ENV)/bazel/ibazel-$(PLATFORM)
	$(_RULE)$(LN) -s $(ENV)/bazel/bazelisk-$(PLATFORM) $(ENV)/bin/bazelisk
	$(_RULE)$(LN) -s $(ENV)/bazel/ibazel-$(PLATFORM) $(ENV)/bin/ibazel
	$(_RULE)$(CHMOD) +x $(ENV)/bazel/bazelisk-$(PLATFORM) $(ENV)/bin/bazelisk $(ENV)/bazel/ibazel-$(PLATFORM) $(ENV)/bin/ibazel
	$(_RULE)$(ENV)/bin/bazelisk version

.PHONY: build test release env environment clean distclean forceclean
