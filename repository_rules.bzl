"""Rules and macros for setting up dependencies from the WORKSPACE file, either
directly from the OpenCannabis Specification project or from downstream projects.
"""

load(
    "@com_google_googleapis//:repository_rules.bzl",
    _switched_rules = "switched_rules_by_language",
)


## Exports
switched_rules_by_language = _switched_rules


