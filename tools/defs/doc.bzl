"""Provides tools for doc generation."""

load(
    "@bazel_skylib//lib:new_sets.bzl",
    _sets = "sets",
)

load(
    "@rules_proto//proto:defs.bzl",
    "ProtoInfo",
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

    module_docs(
        name = "%s-doc" % name,
        modules = modules,
        template = "//tools/doctpl:markdown.tmpl",
        module_name = name,
        format = kwargs.get("format", "markdown"),
    )


def __build_module_docs(ctx):
    """Build documentation for an entire OpenCannabis module."""

    out = ctx.actions.declare_file(
        "%s.%s" % (ctx.attr.module_name, _DOC_EXTENSIONS[ctx.attr.format]),
    )

    extra_deps = []
    args = ctx.actions.args()
    args.add("--plugin=%s" % ctx.executable._plugin.path)
    args.add("--doc_out=%s" % out.dirname)
    if ctx.attr.template:
        args.add("--doc_opt=%s,%s" % (ctx.files.template[0].path, out.basename))
        extra_deps.append(ctx.files.template[0])
    else:
        args.add("--doc_opt=%s,%s" % (ctx.attr.format, out.basename))

    outputs = depset([out])
    protos = []
    deps = []
    depsrcs = []
    seen_descriptors = []
    paths = []

    for mod in ctx.attr.modules:
        info = mod[ProtoInfo]

        if info.proto_source_root not in paths:
            paths.append(info.proto_source_root)
            args.add("-I%s" % info.proto_source_root)

        protos.extend([f for f in info.direct_sources if f not in protos])
        depsrcs.extend([f for f in info.transitive_sources.to_list() if f not in protos])
        deps.extend([f for f in info.transitive_descriptor_sets.to_list() if f not in deps])

    tools = [ctx.executable._tool] + [ctx.executable._plugin]
    args.add("--descriptor_set_in=%s" % ":".join([f.path for f in deps if f not in protos]))

    # add proto sources last
    for proto in protos:
        args.add(proto.path)

    ctx.actions.run(
        inputs = tools + ctx.files.modules + protos + deps + depsrcs + extra_deps,
        outputs = [out],
        executable = ctx.executable._tool,
        progress_message = "Generating docs for module '%s'" % ctx.attr.module_name,
        arguments = [args],
    )

    return struct(
        providers = [
            DefaultInfo(files = outputs),
        ],
    )

module_docs = rule(
    implementation = __build_module_docs,
    doc = """
Generate Markdown documentation for an OpenCannabis protocol module.
""",
    attrs = {
        "modules": attr.label_list(
            doc = "Protocol sub-modules to enclose.",
            providers = [ProtoInfo],
            mandatory = True,
        ),
        "module_name": attr.string(
            doc = "Name of the module we're building docs for.",
            mandatory = True,
        ),
        "format": attr.string(
            doc = "Format to generate for the documentation. Defaults to Markdown.",
            default = "markdown",
        ),
        "template": attr.label(
            allow_files = True,
            doc = "Optional custom Go template file to render for each proto. Overrides 'format'.",
        ),
        "_tool": attr.label(
            executable = True,
            cfg = "host",
            allow_files = True,
            default = Label("@com_google_protobuf//:protoc"),
        ),
        "_plugin": attr.label(
            executable = True,
            cfg = "host",
            allow_files = True,
            default = Label("//tools:protoc-gen-doc"),
        ),
    }
)


declare_proto_docs = __declare_proto_docs
declare_module_docs = __declare_module_docs
