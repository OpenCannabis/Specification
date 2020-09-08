
workspace(
  name = "opencannabis",
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
# Apple Platforms
#

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

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

## NodeJS
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "6a67a8a1bf6fddc9113f73471029b819eef4575c3a936a4a01d57e411894d692",
    urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/2.0.2/rules_nodejs-2.0.2.tar.gz"],
)

load("@build_bazel_rules_nodejs//:index.bzl",
     "node_repositories",
     "yarn_install")

node_repositories(
    package_json = ["//:package.json"],
    node_version = "10.13.0",
    yarn_version = "1.12.1")

yarn_install(
    name = "npm",
    package_json = "//:package.json",
    yarn_lock = "//:yarn.lock")

## Java Repos/Deps
load("//config:jdeps.bzl", java_setup = "java_repositories")
java_setup()

load("@maven//:defs.bzl", "pinned_maven_install")
pinned_maven_install()

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

## JS Interop
load("@com_google_jsinterop_generator//build_defs:rules.bzl", "setup_jsinterop_generator_workspace")
load("@com_google_jsinterop_generator//build_defs:repository.bzl", "load_jsinterop_generator_repo_deps")
load_jsinterop_generator_repo_deps()
setup_jsinterop_generator_workspace()

## API Codegen
load("@com_google_api_codegen//rules_gapic/java:java_gapic_repositories.bzl", "java_gapic_repositories")
java_gapic_repositories()

load("@com_google_api//:repository_rules.bzl", "switched_rules_by_language")
switched_rules_by_language(
    name = "com_google_googleapis_imports",
    grpc = True)

## Stardoc
load("@io_bazel_stardoc//:setup.bzl", "stardoc_repositories")
stardoc_repositories()

## Swift
load("@build_stack_rules_proto//swift:deps.bzl", "swift_proto_library")
swift_proto_library()

## gRPC Java
load("@io_grpc_java//:repositories.bzl", "grpc_java_repositories")
grpc_java_repositories()

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")
protobuf_deps()

