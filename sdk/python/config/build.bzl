
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
    # OpenCannabis Protocol Sources
    "ocp": {
        "type": "github",
        "repo": "OpenCannabis/Protocol",
        "target": "d9405b04737a3c085d0e061b0aefeda70d8907c0",
        "seal": "822cff667e84fb14110360694750686e0853d9ce7b8df7f976fc804a6ecf7b98"},

    # OpenCannabis: Python Sources
    "protocol": {
        "type": "archive",
        "format": "tar",
        "overlay": "ocpy.bzl",
        "targets": ["https://raw.githubusercontent.com/OpenCannabis/Protocol/master/releases/python-1.9.0-alpha1.tar.gz"],
        "seal": "b5f797ac02cd2d350f7638e96db61f351f557f5be0f95545a0495335ff736830"},

    # Rules: PyPI Packaging
    "pypi_packaging": {
        "type": "github",
        "repo": "sgammon/bazel-pypi-package",
        "target": "91519eb2245ccdbbed91380df028b6762456099c",
        "seal": "33acfad8d98d627bb3dacdb76e903ff1c998a0c4e4c42d2c35fa4b4ff7226aea"},
}


def _install_dependencies(local):

    """ Install all dependencies into the current WORKSPACE. """

    dependencies(DEPS, local)


install_dependencies = _install_dependencies
