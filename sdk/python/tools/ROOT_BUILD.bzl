
package(
    default_visibility = ["//visibility:public"],
)

load(
    "//config:rules.bzl",
    "package",
)


exports_files([
    "README.md",
    "requirements.txt",
])


## Top-level (Public) Aliases
alias(
    name = "library",
    actual = "//opencannabis:library",
)

alias(
    name = "tool",
    actual = "//opencannabis:tool",
)

alias(
    name = "archive",
    actual = "//opencannabis:archive",
)

alias(
    name = "shim",
    actual = "//opencannabis:shim",
    visibility = ["//visibility:public"],
)
