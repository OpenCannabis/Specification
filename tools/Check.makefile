
#
# Checks for required tooling.
#

ifeq ($(shell which rm),)
$(error Could not resolve `rm`. Please check your environment)
endif
ifeq ($(shell which cp),)
$(error Could not resolve `cp`. Please check your environment)
endif
ifeq ($(shell which ln),)
$(error Could not resolve `ln`. Please check your environment)
endif
ifeq ($(shell which git),)
ifeq ($(PLATFORM),darwin)
$(error Could not resolve `git`. Please install Xcode tools (`sudo xcode-select --install`))
else
$(error Could not resolve `git`. Please check your environment)
endif
endif
ifeq ($(shell which tar),)
$(error Could not resolve `tar`. Please check your environment)
endif
ifeq ($(shell which grep),)
$(error Could not resolve `grep`. Please check your environment)
endif
ifeq ($(shell which curl),)
$(error Could not resolve `curl`. Please check your environment)
endif
ifeq ($(shell which mkdir),)
$(error Could not resolve `mkdir`. Please check your environment)
endif
ifeq ($(shell which chmod),)
$(error Could not resolve `chmod`. Please check your environment)
endif
ifeq ($(shell which python3),)
$(error Could not resolve `python3`. PLease check your environment)
endif
ifeq ($(shell which virtualenv),)
$(error Could not resolve `virtualenv`. Please run: `pip3 install virtualenv`)
endif
