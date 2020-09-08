
load(
    "@gust//defs/toolchain/java:repos.bzl",
    "gust_java_repositories",
)

load(
    "@rules_jvm_external//:defs.bzl",
    "maven_install",
)

load(
    "@rules_jvm_external//:specs.bzl",
    "maven",
)


GSON_VERSION = "2.8.6"
COMMONS_CSV_VERSION = "1.8"


def java_repositories():

    """ Prep Java repositories. """

    gust_java_repositories(
        app_artifacts = [
            # Server
            "com.google.code.gson:gson:%s" % GSON_VERSION,
            "org.apache.commons:commons-csv:%s" % COMMONS_CSV_VERSION,
        ]
    )

