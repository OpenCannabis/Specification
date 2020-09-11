
load(
    "@gust//defs:tools.bzl",
    "dependencies",
    "http_archive",
    "git_repository",
)

load(
    "@gust//defs/toolchain:deps.bzl",
    "maven",
)


DEPS = {
    "protoc_gen_doc": {
        "type": "github",
        "repo": "sgammon/protoc-gen-doc",
        "target": "59d9298a020f2386ffab0f9ab73595f42bec15b1",
        "seal": "ea1618f2c3d83e6363e9ac74b06e72eab2aeb4568d6adbb1e3b433271a1cd076"},
}


def _install_dependencies(local):

    """ Install all dependencies into the current WORKSPACE. """

    dependencies(DEPS, local)


install_dependencies = _install_dependencies
