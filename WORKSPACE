
workspace(
  name = "opencannabis",
)

load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
)

load(
    "//config:elide.bzl",
    "LOCAL",
    GUST_FINGERPRINT = "FINGERPRINT",
    GUST_VERSION = "VERSION",
)

(local_repository(
    name = "gust",
    path = "/Users/sam.g/Workspace/Elide",
) if LOCAL else http_archive(
    name = "gust",
    urls = ["https://github.com/sgammon/elide/archive/%s.tar.gz" % GUST_VERSION],
    strip_prefix = "elide-%s" % GUST_VERSION,
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

## JVM External (Maven)
RULES_JVM_EXTERNAL_TAG = "4.0"
RULES_JVM_EXTERNAL_SHA = "31701ad93dbfe544d597dbe62c9a1fdd76d81d8a9150c2bf1ecf928ecdf97169"

http_archive(
    name = "rules_jvm_external",
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    sha256 = RULES_JVM_EXTERNAL_SHA,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

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

## Go
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

go_rules_dependencies()
go_register_toolchains()
gazelle_dependencies()

load("@protoc_gen_doc//defs:deps.bzl", protoc_gen_doc_dependencies="go_dependencies")
protoc_gen_doc_dependencies()

## Buf
RULES_BUF_VERSION = "a86e01e3df1d86e7ec6cd852c75999e0c9cec737"
RULES_BUF_FINGERPRINT = "6231cfaf453b27c4639b58d683c9213e0dd61af7f4545a4cfc677e5745b45e92"

(local_repository(
    name = "rules_buf",
    path = "/Users/sam.g/Workspace/rules_buf",
) if LOCAL else http_archive(
    name = "rules_buf",
    urls = ["https://github.com/sgammon/rules_buf/archive/%s.tar.gz" % RULES_BUF_VERSION],
    strip_prefix = "rules_buf-%s" % RULES_BUF_VERSION,
    sha256 = RULES_BUF_FINGERPRINT,
))


load("@rules_buf//buf:repos.bzl", "buf_repositories")
buf_repositories()

