
load(
    "@bazel_skylib//lib:new_sets.bzl",
    _sets = "sets",
)

load(
    "@com_google_protobuf//:protobuf.bzl",
    _proto_gen = "proto_gen",
)

_PROTOC = "$(location @com_google_protobuf//:protoc)"

_DOC_EXTENSIONS = {
  'docbook': 'dbk',
  'html': 'html',
  'markdown': 'md',
  'json': 'json'
}

_DOC_FORMATS = (
  'docbook',
  'html',
  'markdown',
  'json',
)

_ENABLED_FORMATS = (
  'markdown',
)

_STATIC_PROTO_DEPS = [
    "@com_google_protobuf//:descriptor_proto",
]


def __dedupe_protos(protos):

    """ Deduplicate proto sources. """

    return _sets.to_list(_sets.make(protos))


def __descriptor_dep(dep):

    """ Convert a dependency for a source proto. """

    return "$(location %s)" % dep


def __declare_proto_doc(name, srcs, format, kwargs):

    """ Declare protocol buffer documentation targets in Markdown, HTML, Docbook or JSON. """

    target = "%s.proto" % name
    descriptor_sets = ":".join([
        __descriptor_dep(dep) for dep in kwargs.get('deps', [])
    ] + [
        "$(location %s)" % static_dep for static_dep in _STATIC_PROTO_DEPS
    ])

    native.genrule(
        name = "%s-%s-doc" % (name, format),
        srcs = __dedupe_protos([target] + kwargs.get('deps', []) + _STATIC_PROTO_DEPS),
        outs = ["%s.%s" % (name, _DOC_EXTENSIONS[format])],
        cmd = " ".join([
            "%s" % _PROTOC,
            "-I.",
            "--descriptor_set_in=\"%s\"" % descriptor_sets,
            "--plugin=$(execpath //tools:protoc-gen-doc)",
            "--doc_opt=\"%s,$@\" --doc_out=$(@D) $(location %s)" % (format, target),
        ]),
        tools = [
            "//tools:protoc-gen-doc",
            "@com_google_protobuf//:protoc",
        ],
    )


def __declare_proto_docs(name, srcs, kwargs):

    """ Declare doc targets for a given proto in each doc format. """

    for format in _ENABLED_FORMATS:
        __declare_proto_doc(name, srcs, format, kwargs)
    native.filegroup(
        name = "%s-doc" % name,
        srcs = [("%s.%s" % (name, _DOC_EXTENSIONS[format])) for format in _ENABLED_FORMATS],
    )


def __declare_module_docs(name, modules, kwargs):

    """ Declare a doc target for module documentation. """

    native.filegroup(
        name = "%s-doc" % name,
        srcs = [("%s-doc" % submod) for submod in modules],
    )


declare_proto_docs = __declare_proto_docs
declare_module_docs = __declare_module_docs
