"""Provides basic macros for working with formatted POM structures."""

POM_DEP_FORMAT_ = """
        <dependency>
            <groupId>%s</groupId>
            <artifactId>%s</artifactId>
            <version>%s</version>
        </dependency>
"""

POM_DEP_CONTAINER_ = """
%s
"""

def pom_dep(group, artifact, version):

    """Format an artifact for use in a POM dependency.

    Args:
        group: Maven artifact group.
        artifact: Maven artifact name.
        version: Maven artifact version.

    Returns:
        Formatted XML POM dependency."""

    return POM_DEP_FORMAT_ % (
        group,
        artifact,
        version
    )


def pom_deps(artifacts = []):

    """Format a set of artifacts for use in a POM dependency.

    Args:
        artifacts: List of rendered outputs from `pom_dep`.

    Returns:
        Formatted XML POM stanzas, joined together and tabbed in."""

    return POM_DEP_CONTAINER_ % (
        "\n".join(artifacts)
    )
