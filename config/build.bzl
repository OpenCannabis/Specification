
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


DEPS = {}


def _install_dependencies(local):

    """ Install all dependencies into the current WORKSPACE. """

    dependencies(DEPS, local)


install_dependencies = _install_dependencies

