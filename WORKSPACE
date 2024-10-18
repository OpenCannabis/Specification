
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

load(
    "//config:versions.bzl",
    "PROTOBUF_VERSION",
    "GRPC_VERSION",
    "NODE_VERSION",
    "YARN_VERSION",
)


http_archive(
    name = "com_google_protobuf",
    sha256 = "b10bf4e2d1a7586f54e64a5d9e7837e5188fc75ae69e36f215eb01def4f9721b",
    strip_prefix = "protobuf-%s" % PROTOBUF_VERSION,
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v%s.tar.gz" % PROTOBUF_VERSION],
)

http_archive(
    name = "com_google_googleapis",
    sha256 = "113e285e443ad73f70b6fda89aae93abb987b30d8ccb3f80cdef31ee3a42444a",
    strip_prefix = "googleapis-aa15f328736501d01fac1d599655c392b5b12a3c",
    urls = ["https://github.com/googleapis/googleapis/archive/aa15f328736501d01fac1d599655c392b5b12a3c.tar.gz"],
)

http_archive(
    name = "com_github_grpc_grpc",
    strip_prefix = "grpc-%s" % GRPC_VERSION,
    sha256 = "ddac86fe30efb879b42ffedf345f8abd3235407289dcb2acb7fe7fc2204c246f",
    urls = ["https://github.com/grpc/grpc/archive/v%s.zip" % GRPC_VERSION],
)

http_archive(
    name = "com_github_grpc_grpc_web",
    strip_prefix = "grpc-web-b0ea9c7c45d6f9ea5338fc61a81b47f589a91259",
    sha256 = "a7ae33e32b95049f11373b62019b742464576a17c602fa6b2457926749d58a1c",
    urls = ["https://github.com/grpc/grpc-web/archive/b0ea9c7c45d6f9ea5338fc61a81b47f589a91259.tar.gz"],
)

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "099a9fb96a376ccbbb7d291ed4ecbdfd42f6bc822ab77ae6f1b5cb9e914e94fa",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.35.0/rules_go-v0.35.0.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.35.0/rules_go-v0.35.0.zip",
    ],
)

http_archive(
    name = "io_grpc_proto",
    sha256 = "f081eba5884bf09051d27664aede4fc22bbaa77da477735d745bcef17bd088f1",
    strip_prefix = "grpc-proto-ec886024c2f7b7f597ba89d5b7d60c3f94627b17",
    urls = ["https://github.com/grpc/grpc-proto/archive/ec886024c2f7b7f597ba89d5b7d60c3f94627b17.tar.gz"],
)

http_archive(
    name = "io_grpc_grpc_java",
    sha256 = "80119952caa2111abd708e350be01e0615d1510a862cf0151eeae573445f98fa",
    strip_prefix = "grpc-java-%s" % GRPC_VERSION,
    urls = ["https://github.com/grpc/grpc-java/archive/v%s.tar.gz" % GRPC_VERSION],
)

http_archive(
    name = "rules_python",
    strip_prefix = "rules_python-0.1.0",
    sha256 = "48f7e716f4098b85296ad93f5a133baf712968c13fbc2fdf3a6136158fe86eac",
    url = "https://github.com/bazelbuild/rules_python/archive/0.1.0.tar.gz",
)

http_archive(
    name = "bazel_skylib",
    sha256 = "1dde365491125a3db70731e25658dfdd3bc5dbdfd11b840b3e987ecf043c7ca0",
    urls = ["https://github.com/bazelbuild/bazel-skylib/releases/download/0.9.0/bazel_skylib-0.9.0.tar.gz"],
)

http_archive(
    name = "io_buildbuddy_buildbuddy_toolchain",
    sha256 = "747dbf28cb8b8d27b2d909aa05e00691fe6d9d8a28026e359cc4943261687592",
    strip_prefix = "buildbuddy-toolchain-702567fd8a561ec94a0e8e7fd8aa00bb15d87b4f",
    urls = ["https://github.com/buildbuddy-io/buildbuddy-toolchain/archive/702567fd8a561ec94a0e8e7fd8aa00bb15d87b4f.tar.gz"],
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

load("@io_buildbuddy_buildbuddy_toolchain//:deps.bzl", "buildbuddy_deps")
buildbuddy_deps()
load("@io_buildbuddy_buildbuddy_toolchain//:rules.bzl", "buildbuddy")
buildbuddy(name = "buildbuddy_toolchain")

load("@gust//defs:build.bzl", "install_dependencies")
load("@//config:build.bzl", app_dependencies = "install_dependencies")
load("@gust//defs:config.bzl", "CHROMIUM", "FIREFOX", "SAUCE", "GRAALVM_VERSION", "GRAALVM_JDK_VERSION", "K8S_VERSION")

install_dependencies(False)
app_dependencies(False)

load("@gust//defs:workspace.bzl", "setup_workspace")
setup_workspace()

load("//:repository_rules.bzl", "switched_rules_by_language")

switched_rules_by_language(
    name = "com_google_googleapis_imports",
    cc = False,
    csharp = False,
    gapic = True,
    go = False,
    grpc = True,
    java = True,
    nodejs = False,
    php = False,
    python = False,
    ruby = False,
)


#
# Protobuf
#

load(
    "@com_google_protobuf//:protobuf_deps.bzl",
    "protobuf_deps",
)

protobuf_deps()

http_archive(
    name = "rules_proto",
    sha256 = "36476f17a78a4c495b9a9e70bd92d182e6e78db476d90c74bac1f5f19f0d6d04",
    strip_prefix = "rules_proto-fcad4680fee127dbd8344e6a961a28eef5820ef4",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_proto/archive/fcad4680fee127dbd8344e6a961a28eef5820ef4.tar.gz",
        "https://github.com/bazelbuild/rules_proto/archive/fcad4680fee127dbd8344e6a961a28eef5820ef4.tar.gz",
    ],
)

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

#
# Go
#
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

go_rules_dependencies()
go_register_toolchains(version = "1.19.1")
gazelle_dependencies()

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
http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "c911b5bd8aee8b0498cc387cacdb5f917098ce477fb4182db07b0ef8a9e045c0",
    urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/4.7.1/rules_nodejs-4.7.1.tar.gz"],
)

load(
    "@build_bazel_rules_nodejs//:index.bzl",
    "node_repositories",
    "yarn_install",
)


_rules_gapic_version = "0.5.5"

http_archive(
    name = "rules_gapic",
    strip_prefix = "rules_gapic-%s" % _rules_gapic_version,
    urls = ["https://github.com/googleapis/rules_gapic/archive/v%s.tar.gz" % _rules_gapic_version],
    sha256 = "d2e03360921cfb27faed91593332cd173be805e492fab9074453e89e83ded69f",
)

load("@rules_gapic//:repositories.bzl", "rules_gapic_repositories")

rules_gapic_repositories()


##############################################################################
# C++
##############################################################################
# C++ must go before everything else, since the key dependencies (protobuf and gRPC)
# are C++ repositories and they have the highest chance to have the correct versions of the
# transitive dependencies (for those dependencies which are shared by many other repositories
# imported in this workspace).
#
# Note, even though protobuf and gRPC are mostly written in C++, they are used to generate stuff
# for most of the other languages as well, so they can be considered as the core cross-language
# dependencies.

load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")

grpc_deps()

load("@com_github_grpc_grpc//bazel:grpc_extra_deps.bzl", "grpc_extra_deps")

grpc_extra_deps()

load("@build_bazel_rules_apple//apple:repositories.bzl", "apple_rules_dependencies")

apple_rules_dependencies()

load("@build_bazel_apple_support//lib:repositories.bzl", "apple_support_dependencies")

apple_support_dependencies()

load("@build_bazel_rules_swift//swift:repositories.bzl", "swift_rules_dependencies")

swift_rules_dependencies()



##############################################################################
# Java
##############################################################################
_gax_java_version = "1.65.1"

http_archive(
    name = "com_google_api_gax_java",
    strip_prefix = "gax-java-%s" % _gax_java_version,
    urls = ["https://github.com/googleapis/gax-java/archive/v%s.zip" % _gax_java_version],
    sha256 = "6ef7305f0b5a994816b33cac8c0b8055a1945ca7284bd7ffb3d2d3989b2ecce4",
)

load("@com_google_api_gax_java//:repository_rules.bzl", "com_google_api_gax_java_properties")

com_google_api_gax_java_properties(
    name = "com_google_api_gax_java_properties",
    file = "@com_google_api_gax_java//:dependencies.properties",
)

load("@com_google_api_gax_java//:repositories.bzl", "com_google_api_gax_java_repositories")

com_google_api_gax_java_repositories()

load("@io_grpc_grpc_java//:repositories.bzl", "grpc_java_repositories")

grpc_java_repositories()

# Java microgenerator.
# Must go AFTER java-gax, since both java gax and gapic-generator are written in java and may conflict.
_gapic_generator_java_version = "8a2fb1329c4ed0dc3257bfead65dfd192d99e7b2"

http_archive(
    name = "gapic_generator_java",
    strip_prefix = "gapic-generator-java-%s" % _gapic_generator_java_version,
    sha256 = "ce68a4a1ed22b61483f6a73654d5ccef53f0b328dd1f4e97aa3ddc261ff4b153",
    urls = ["https://github.com/sgammon/gapic-generator-java/archive/%s.zip" % _gapic_generator_java_version],
)

load("@gapic_generator_java//:repository_rules.bzl", "gapic_generator_java_properties")

gapic_generator_java_properties(
    name = "gapic_generator_java_properties",
    file = "@gapic_generator_java//:dependencies.properties",
)

com_google_api_gax_java_properties(
    name = "co_cookies_sdk_properties",
    file = "//sdk/java:ocp.properties",
)

load("@gapic_generator_java//:repositories.bzl", "gapic_generator_java_repositories")

gapic_generator_java_repositories()


##############################################################################
# Python
##############################################################################
load("@rules_gapic//python:py_gapic_repositories.bzl", "py_gapic_repositories")

py_gapic_repositories()

load("@rules_python//python:pip.bzl", "pip_install")

pip_install(requirements = "sdk/python/requirements.txt")

_gapic_generator_python_version = "0.50.5"

http_archive(
    name = "gapic_generator_python",
    strip_prefix = "gapic-generator-python-%s" % _gapic_generator_python_version,
    sha256 = "68bed6e528c00db547aaf283deef5afc24675e9786adf6385a775b1821725eea",
    urls = ["https://github.com/googleapis/gapic-generator-python/archive/v%s.zip" % _gapic_generator_python_version],
)

load(
    "@gapic_generator_python//:repositories.bzl",
    "gapic_generator_python",
    "gapic_generator_register_toolchains",
)

gapic_generator_python()

gapic_generator_register_toolchains()


##############################################################################
# TypeScript
##############################################################################

_gapic_generator_typescript_version = "2.1.1"

_gapic_generator_typescript_sha256 = "c4117fedcd726c14af8c6a70c810b25a6bdf2523b43a867bafdf6478c0ac745a"

### TypeScript generator
http_archive(
    name = "gapic_generator_typescript",
    sha256 = _gapic_generator_typescript_sha256,
    strip_prefix = "gapic-generator-typescript-%s" % _gapic_generator_typescript_version,
    urls = ["https://github.com/googleapis/gapic-generator-typescript/archive/v%s.tar.gz" % _gapic_generator_typescript_version],
)

load("@gapic_generator_typescript//:repositories.bzl", "gapic_generator_typescript_repositories")

gapic_generator_typescript_repositories()


###
# Node JS Init
###

node_repositories(
    package_json = ["//:package.json", "//site:package.json", "@gapic_generator_typescript//:package.json"],
    node_version = NODE_VERSION,
    yarn_version = YARN_VERSION,
)

yarn_install(
    name = "spec_npm",
    package_json = "//:package.json",
    yarn_lock = "//:yarn.lock",
    strict_visibility = True,
)

yarn_install(
    name = "site_npm",
    package_json = "//site:package.json",
    yarn_lock = "//:yarn.lock",
    strict_visibility = True,
)

yarn_install(
    name = "npm",
    package_json = "@gapic_generator_typescript//:package.json",
    yarn_lock = "@gapic_generator_typescript//:yarn.lock",
)


## Java Repos/Deps
load("//config:jdeps.bzl", java_setup = "java_repositories")
java_setup()

load("@maven//:defs.bzl", "pinned_maven_install")
pinned_maven_install()

## JS Interop
load("@com_google_jsinterop_generator//build_defs:rules.bzl", "setup_jsinterop_generator_workspace")
load("@com_google_jsinterop_generator//build_defs:repository.bzl", "load_jsinterop_generator_repo_deps")
load_jsinterop_generator_repo_deps()
setup_jsinterop_generator_workspace()

## Stardoc
load("@io_bazel_stardoc//:setup.bzl", "stardoc_repositories")
stardoc_repositories()

## Swift
load("@build_stack_rules_proto//swift:deps.bzl", "swift_proto_library")
swift_proto_library()

## Protoc-Gen-Doc
load("@protoc_gen_doc//defs:deps.bzl", protoc_gen_doc_dependencies="go_dependencies")
protoc_gen_doc_dependencies()

## Buf
RULES_BUF_VERSION = "7e55fac95a13c2fd126201dc1aacc5a2af04c356"
RULES_BUF_FINGERPRINT = "736f446b4fcf929e4fffdc73779672fd25873ddaa2693f081ea35b1f342c1fd6"

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

load(
    "@spec_npm//@bazel/labs:package.bzl",
    "npm_bazel_labs_dependencies",
)

npm_bazel_labs_dependencies()


## JarJar
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

http_archive(
    name = "com_github_johnynek_bazel_jar_jar",
    sha256 = "97c5f862482a05f385bd8f9d28a9bbf684b0cf3fae93112ee96f3fb04d34b193",
    strip_prefix = "bazel_jar_jar-171f268569384c57c19474b04aebe574d85fde0d",
    urls = ["https://github.com/OpenCannabis/bazel_jar_jar/archive/171f268569384c57c19474b04aebe574d85fde0d.tar.gz"],
)

load(
    "@com_github_johnynek_bazel_jar_jar//:jar_jar.bzl",
    "jar_jar_repositories",
)
jar_jar_repositories()

