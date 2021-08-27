"""Declares tools for working with Protocol Buffer sources."""

load(
    "@io_bazel_rules_closure//closure:defs.bzl",
     _closure_proto_library = "closure_proto_library",
)

load(
    "@rules_proto//proto:defs.bzl",
    _proto_library="proto_library",
)

load(
    "@spec_npm//@bazel/labs:index.bzl",
    _ts_proto_library = "ts_proto_library",
)

load(
    "//tools/defs:doc.bzl",
    __declare_proto_docs="declare_proto_docs",
    __declare_module_docs="declare_module_docs",
)

_TSPROTO_POSTFIX = "ts_proto"
_JAVAPROTO_POSTFIX = "java_proto"
_CLOSUREPROTO_POSTFIX = "closure_proto"

_native_proto = _proto_library
_native_cc_proto = native.cc_proto_library
_native_java_proto = native.java_proto_library


def __declare_lang_protos(name, kwargs, module=False):

    """ Declare Java and CC proto libraries. """

    ckwargs = {}
    ckwargs["name"] = "%s-%s" % (name, _JAVAPROTO_POSTFIX)
    ckwargs["deps"] = [":%s" % kwargs["name"]]
    _native_java_proto(
        **ckwargs
    )
    __declare_ts_protos(
        name,
        kwargs,
        module
    )


def _fixup_target(name, postfix):

    """ Translate module targets to their TS aliases. """

    if name.startswith("//") and ":" not in name:
        # it's a workspace-relative module reference, like:
        # `//opencannabis/accounting`
        return "%s:%s-%s" % (
            "//%s" % "/".join(name[2:-1].split("/")[:-1]),
            name[2:-1].split("/")[-1],
            postfix
        )
    else:
        # it's either a workspace-relative target reference, like:
        # `//opencannabis/accounting:Taxes`
        # or it's a package-relative reference, like:
        # `:Taxes`
        # either way we can just append to it.
        return "%s-%s" % (
            name,
            postfix
        )


def __declare_ts_protos(name, kwargs, module=False):

    """ Declare targets for TypeScript proto libraries. """
    if module:
        # TS proto modules are simply virtualized file groups of constituent proto targets. this works recursively until
        # the library aggregation target, which is itself a composed set of virtualized file groups.
        native.filegroup(
            name = "%s-%s" % (name, _TSPROTO_POSTFIX),
            srcs = [
                _fixup_target(name, _TSPROTO_POSTFIX)
                for name in (kwargs["deps"] or kwargs["exports"])
            ],
        )
    else:
        _ts_proto_library(
            name = "%s-%s" % (name, _TSPROTO_POSTFIX),
            proto = ":%s" % name,
        )


def __declare_filegroup(name, srcs):

    """ Declare a sources filegroup. """

    native.filegroup(
        name = "%s-src" % name,
        srcs = srcs,
    )


def __declare_native(name, kwargs):

    """ Declare a target as a native proto library. """

    kwargs["name"] = name
    _native_proto(
        **kwargs
    )

def __declare_closure_proto(name, kwargs):

    """ Declare a target as a Closure proto library. """

    ckwargs = {}
    ckwargs["name"] = "%s-%s" % (kwargs["name"], _CLOSUREPROTO_POSTFIX)
    ckwargs["deps"] = [":%s" % kwargs["name"]]
    _closure_proto_library(
        **ckwargs
    )

def _proto(name, **kwargs):
    """
    Proxy individual proto declarations to relevant native and extension rules.
    
    Individual rules need to know about each individual proto. "Proto modules" are exported using the `module` function in
    the same way. Keyword arguments are proxied in full, with selected entries being removed where needed. Positional
    arguments are not supported.

    :param name: Name of the target.
    :param kwargs: Keyword arguments to pass along.
    :returns: Nothing - defines rules instead.
    """

    __declare_filegroup(name, kwargs["srcs"])
    __declare_native(name, kwargs)
    __declare_closure_proto(name, kwargs)
    __declare_lang_protos(name, kwargs)
    __declare_proto_docs(name, kwargs["srcs"], kwargs)


def _module(name, **kwargs):
    """
    Proxy module proto declarations to relevant native and extension rules, which need to know about each grouping of protos.

    Individual protos are exported each using the `_proto` function in the same way. Keyword arguments are
    proxied in full, with selected entries being removed where needed. Positional arguments are not supported.

    :param name: Name of the target.
    :param kwargs: Keyword arguments to pass along.
    :returns: Nothing - defines rules instead.
    """

    if "." in name:
        fail("OCP module names cannot contain `.` (in package name '%s')" % name)
    __declare_native(name, kwargs)
    __declare_closure_proto(name, kwargs)
    __declare_lang_protos(name, kwargs, module=True)
    __declare_module_docs(name, kwargs["deps"], kwargs)


proto = _proto
module = _module
