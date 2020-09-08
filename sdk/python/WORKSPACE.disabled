
workspace(
  name = "ocpy",
)

load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
)

load(
    "//config:gust.bzl",
    "LOCAL",
    GUST_FINGERPRINT = "FINGERPRINT",
    GUST_VERSION = "VERSION",
)

(local_repository(
    name = "gust",
    path = "/Users/sam.g/Workspace/GUST",
) if LOCAL else http_archive(
    name = "gust",
    urls = ["https://github.com/sgammon/gust/archive/%s.tar.gz" % GUST_VERSION],
    strip_prefix = "GUST-%s" % GUST_VERSION,
    sha256 = GUST_FINGERPRINT,
))


load("@gust//defs:build.bzl", "install_dependencies")
load("@//config:build.bzl", app_dependencies = "install_dependencies")
load("@gust//defs:config.bzl", "CHROMIUM", "FIREFOX", "SAUCE", "GRAALVM_VERSION", "GRAALVM_JDK_VERSION", "K8S_VERSION")
install_dependencies(False)
app_dependencies(False)

load("@gust//defs:workspace.bzl", "setup_workspace")
setup_workspace()

#
# Protobuf
#

load(
    "@com_google_protobuf//:protobuf_deps.bzl",
    "protobuf_deps",
)

protobuf_deps()


#
# Extensions
#

## Docker
load("@io_bazel_rules_docker//repositories:repositories.bzl", container_repositories = "repositories")
load("@io_bazel_rules_docker//python:image.bzl", _py_image_repos = "repositories")

load("@io_bazel_rules_docker//repositories:deps.bzl",
     container_deps = "deps")

container_repositories()
container_deps()

load("@io_bazel_rules_docker//repositories:pip_repositories.bzl", "pip_deps")
pip_deps()

_py_image_repos()

## Python
load("@rules_python//python:repositories.bzl", "py_repositories")
py_repositories()

load("@rules_python//python:pip.bzl", "pip_repositories")
pip_repositories()

load("@rules_python//python:pip.bzl", pip_import = "pip3_import")

pip_import(
    name = "protobuf_py_deps",
    requirements = "@build_stack_rules_proto//python/requirements:protobuf.txt")

load("@protobuf_py_deps//:requirements.bzl", proto_pip_install = "pip_install")
proto_pip_install()

pip_import(
    name = "py",
    requirements = "@gust//defs/toolchain/python:requirements_base.txt")

pip_import(
    name = "werkzeug",
    requirements = "@gust//defs/toolchain/python:requirements_werkzeug.txt")

pip_import(
    name = "grpc_python_dependencies",
    requirements = "@com_github_grpc_grpc//:requirements.bazel.txt")

load("@grpc_python_dependencies//:requirements.bzl", grpc_pip_install="pip_install")
grpc_pip_install()

load("@gust//defs/toolchain/python:repos.bzl", "gust_python_repositories")
gust_python_repositories()

load("@build_stack_rules_proto//python:deps.bzl", "python_proto_compile")
python_proto_compile()

## gRPC Core
load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps", "grpc_test_only_deps")
grpc_deps()
grpc_test_only_deps()

load("@com_github_grpc_grpc//bazel:grpc_extra_deps.bzl", "grpc_extra_deps")
grpc_extra_deps()

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")
protobuf_deps()

