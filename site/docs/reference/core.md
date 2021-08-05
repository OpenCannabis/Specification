# `module`: Protocol Reference
<a name="top"></a>

The OpenCannabis `module` module is designed to do some useful things, which are really valuable because reasons. More
description text blah blah.

|                   |                           |
| ----------------- | ------------------------- |
| **Module**        | `opencannabis.module`     |
| **Bazel Package** | `//opencannabis/module`   |
|                   |                           |

## Table of Contents

<ul>

<li><code>opencannabis/core/ocp.proto</code></li>

<ul>
    <li><a href="#core.KindOptions"><code>KindOptions</code></a></li><li><a href="#core.OCPFieldInfo"><code>OCPFieldInfo</code></a></li><li><a href="#core.OCPModelInfo"><code>OCPModelInfo</code></a></li><li><a href="#core.RecordOptions"><code>RecordOptions</code></a></li>
</ul>
<ul>
    <li><a href="#core.ProductSuperkind"><code>ProductSuperkind</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis/core/ocp.proto-extensions">File-level Extensions</a></li><li><a href="#opencannabis/core/ocp.proto-extensions">File-level Extensions</a></li><li><a href="#opencannabis/core/ocp.proto-extensions">File-level Extensions</a></li><li><a href="#opencannabis/core/ocp.proto-extensions">File-level Extensions</a></li>
</ul><br />


<li><code>opencannabis/core/datamodel.proto</code></li>

<ul>
    <li><a href="#core.BigQueryOptions"><code>BigQueryOptions</code></a></li><li><a href="#core.DatapointOptions"><code>DatapointOptions</code></a></li><li><a href="#core.FieldPersistenceOptions"><code>FieldPersistenceOptions</code></a></li><li><a href="#core.ObjectMapping"><code>ObjectMapping</code></a></li><li><a href="#core.PersistenceOptions"><code>PersistenceOptions</code></a></li><li><a href="#core.SpannerOptions"><code>SpannerOptions</code></a></li><li><a href="#core.SubmessageOptions"><code>SubmessageOptions</code></a></li><li><a href="#core.TableFieldOptions"><code>TableFieldOptions</code></a></li><li><a href="#core.TableOptions"><code>TableOptions</code></a></li>
</ul>
<ul>
    <li><a href="#core.BigQueryOptions.BigQueryType"><code>BigQueryOptions.BigQueryType</code></a></li><li><a href="#core.CollectionMode"><code>CollectionMode</code></a></li><li><a href="#core.DatapointType"><code>DatapointType</code></a></li><li><a href="#core.EnumeratedType"><code>EnumeratedType</code></a></li><li><a href="#core.FieldType"><code>FieldType</code></a></li><li><a href="#core.FieldVisibility"><code>FieldVisibility</code></a></li><li><a href="#core.SpannerOptions.SpannerType"><code>SpannerOptions.SpannerType</code></a></li><li><a href="#core.Visibility"><code>Visibility</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis/core/datamodel.proto-extensions">File-level Extensions</a></li><li><a href="#opencannabis/core/datamodel.proto-extensions">File-level Extensions</a></li><li><a href="#opencannabis/core/datamodel.proto-extensions">File-level Extensions</a></li><li><a href="#opencannabis/core/datamodel.proto-extensions">File-level Extensions</a></li><li><a href="#opencannabis/core/datamodel.proto-extensions">File-level Extensions</a></li><li><a href="#opencannabis/core/datamodel.proto-extensions">File-level Extensions</a></li><li><a href="#opencannabis/core/datamodel.proto-extensions">File-level Extensions</a></li><li><a href="#opencannabis/core/datamodel.proto-extensions">File-level Extensions</a></li><li><a href="#opencannabis/core/datamodel.proto-extensions">File-level Extensions</a></li><li><a href="#opencannabis/core/datamodel.proto-extensions">File-level Extensions</a></li><li><a href="#opencannabis/core/datamodel.proto-extensions">File-level Extensions</a></li><li><a href="#opencannabis/core/datamodel.proto-extensions">File-level Extensions</a></li><li><a href="#opencannabis/core/datamodel.proto-extensions">File-level Extensions</a></li><li><a href="#opencannabis/core/datamodel.proto-extensions">File-level Extensions</a></li><li><a href="#opencannabis/core/datamodel.proto-extensions">File-level Extensions</a></li>
</ul><br />


</ul>




_________________



<a name="opencannabis/core/ocp.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/core/ocp.proto`

Specifies structures that relate to data modeling and the structure of the data. Enumerates collection mode and field
type. Overridden from the central Gust framework which defines the core of the spec.

To import this module:

```proto
import "opencannabis/core/ocp.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `core`     |
| **Bazel Target** | `//core`   |
|                  |                    |



<a name="core.KindOptions"></a>

### Message: <code>KindOptions</code> (`core.KindOptions`)



```proto
import "opencannabis/core/ocp.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    core.KindOptions field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `taxonomy` | [`ProductSuperkind`](#core.ProductSuperkind) | *None.* |  |







<a name="core.OCPFieldInfo"></a>

### Message: <code>OCPFieldInfo</code> (`core.OCPFieldInfo`)

Describes info relating to OpenCannabis for a given model field.

```proto
import "opencannabis/core/ocp.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    core.OCPFieldInfo field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `map_to` | [`string`](#string) | *None.* | Field that corresponds to this one on the abstract version of this model, mapped via `Message.model`. |
| `key_path` | [`string`](#string) | *None.* | Describes the universal key path assigned to this field by the OpenCannabis Spec, as applicable. |







<a name="core.OCPModelInfo"></a>

### Message: <code>OCPModelInfo</code> (`core.OCPModelInfo`)

Describes info relating to OpenCannabis for a given concrete model definition.

```proto
import "opencannabis/core/ocp.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    core.OCPModelInfo field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `model` | [`string`](#string) | *None.* | Named model which this record should inflate to. |







<a name="core.RecordOptions"></a>

### Message: <code>RecordOptions</code> (`core.RecordOptions`)



```proto
import "opencannabis/core/ocp.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    core.RecordOptions field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `anchor` | [`bool`](#bool) | *None.* | Treat this record as an anchor/root record when loading data. |






<!-- end messages -->


<a name="core.ProductSuperkind"></a>

### Enumeration: <code>ProductSuperkind</code> (`core.ProductSuperkind`)

Enumerates abstract meta-types that relate to products known to the spec.

Every [`ProductKind`](#ProductKind) instance relates to a single `ProductSuperkind`, which describes how that product
category fits into the taxonomic hierarchy for regulated cannabis markets. By and large, regulatory boundaries are
drawn at the borders between flower, extracts, CBD, and non-cannabis products. Each of those are enumerated herein,
and then related to a [`ProductKind`](#ProductKind) by way of annotation.

```proto
import "opencannabis/core/ocp.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  core.ProductSuperkind enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `NON_CANNABIS` | `0` | Designates a non-cannabis product category or type.

Non-cannabis product categories or types classify products which contain no cannabis and no hemp product, in any way, shape, or form. Examples of non-cannabis products include t-shirts, rolling trays, stickers, and keychains. |
| `CANNABIS_FLOWER` | `110` |  |
| `CANNABIS_EXTRACT` | `120` |  |


<!-- end enums -->


<a name="opencannabis/core/ocp.proto-extensions"></a>

### File-level Extensions

| Extension | Type | Base | Number | Description |
| --------- | ---- | ---- | ------ | ----------- |
| meta_kind | KindOptions | .google.protobuf.EnumValueOptions | 420001 | Taxonomy mapping for a given product kind. |
| ocp | OCPFieldInfo | .google.protobuf.FieldOptions | 420004 | Describes configuration for this field when used in OpenCannabis systems. |
| model | OCPModelInfo | .google.protobuf.MessageOptions | 420002 | Info regarding how a concrete model maps to an abstract model. |
| record | RecordOptions | .google.protobuf.MessageOptions | 420003 |  |

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/core/datamodel.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/core/datamodel.proto`

Specifies structures that relate to data modeling and the structure of the data. Enumerates collection mode and field
type, required status, and so on. Also includes field metadata (like summaries, descriptions, and so on).

To import this module:

```proto
import "opencannabis/core/datamodel.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `core`     |
| **Bazel Target** | `//core`   |
|                  |                    |



<a name="core.BigQueryOptions"></a>

### Message: <code>BigQueryOptions</code> (`core.BigQueryOptions`)

Defines options structures that relate to Google BigQuery.

```proto
import "opencannabis/core/datamodel.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    core.BigQueryOptions field_name = 1;
}

```







<a name="core.DatapointOptions"></a>

### Message: <code>DatapointOptions</code> (`core.DatapointOptions`)

Options specified for a given datamodel point (which can be a message, a field, an enum, and so on), which describe
how the object or field may be validated in various circumstances, and how it should be handled with regard to
exposure visibility to invoking code.

```proto
import "opencannabis/core/datamodel.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    core.DatapointOptions field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `visibility` | [`Visibility`](#core.Visibility) | *None.* | Sets the visibility options for this data point. Depending on these options, a property or model may be exposed to invoking code, protected from rewriting, and so on. |
| `required` | [`bool`](#bool) | *None.* | Whether this data point (model or field or enum, etc) should be considered "required" for this model to be valid. This setting is applied in various circumstances, usually when data crosses API boundaries. |
| `concrete` | [`bool`](#bool) | *None.* | Whether this property contains a "concrete" sub-message, in which case, its properties are lifted to the parent entity. During decoding, a property is added to indicate the concrete selection made. This is usually combined with generic types in a one-of field, for instance, in `MenuProduct`. |
| `ephemeral` | [`bool`](#bool) | *None.* | Indicate to the data storage engine that a given field is ephemeral, and should not be stored, but rather held with a calculated value for use in systems upstream from the data storage layer. |







<a name="core.FieldPersistenceOptions"></a>

### Message: <code>FieldPersistenceOptions</code> (`core.FieldPersistenceOptions`)

Persistence/data engine options specific to an individual message field.

```proto
import "opencannabis/core/datamodel.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    core.FieldPersistenceOptions field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `type` | [`FieldType`](#core.FieldType) | *None.* | Field type, for special-case fields. |
| `summary` | [`string`](#string) | *None.* | Summary for this field, which provides a narrative description. It should be suitable for use in external circumstances, like documentation. |
| `stamp_update` | [`bool`](#bool) | *None.* | This item is a timestamp, and we would like it to be automatically updated each time the model that contains it is modified in underlying storage. The field should be read-only. |
| `stamp_create` | [`bool`](#bool) | *None.* | This item is a timestamp, and we would like it to be automatically set when the model is created. After that point, we would like this field to be read-only. |
| `read_only` | [`bool`](#bool) | *None.* | This field should not allow writes, but rather produce its value dynamically. Fields marked in this manner cannot be set by external code at any point in time. |
| `immutable` | [`bool`](#bool) | *None.* | This field should allow writes when the model that contains it is written, but then, henceforth, the model should not allow this field to be mutated. |
| `explicit` | [`bool`](#bool) | *None.* | This field should always be explicitly listed with a value, even if it is set to the default value. This function is especially useful for enums with default values, when there is a desire to have consistent indexes. |
| `visibility` | [`FieldVisibility`](#core.FieldVisibility) | *None.* | Describes the visibility level of a given field in a tree of fields. This value applies recursively under message fields on which it is applied. Depending on the visibility level active when data is deserialized or serialized, certain data may be withheld corresponding to the invoking user or system's access level. |
| `description` | [`string`](#string) | *None.* | **Deprecated.** Provided for backwards compatibility. Do not use. |







<a name="core.ObjectMapping"></a>

### Message: <code>ObjectMapping</code> (`core.ObjectMapping`)

Specifies mappings for an arbitrary protobuf message object.

```proto
import "opencannabis/core/datamodel.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    core.ObjectMapping field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `instance` | [`string`](#string) | repeated | Maps an enumeration instance to this object. Enumeration membership is contextual. |







<a name="core.PersistenceOptions"></a>

### Message: <code>PersistenceOptions</code> (`core.PersistenceOptions`)

Specifies options related to persistence of underlying model data associated with this particular message type. This
includes settings related to Firestore and other data engines.

```proto
import "opencannabis/core/datamodel.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    core.PersistenceOptions field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `mode` | [`CollectionMode`](#core.CollectionMode) | *None.* | Specifies the storage mode for this entity. |
| `path` | [`string`](#string) | *None.* | Data path for a given message, with items in the URL corresponding to parameters in the item's key path. |
| `parent` | [`string`](#string) | *None.* | Name of this item's parent collection, if applicable. |







<a name="core.SpannerOptions"></a>

### Message: <code>SpannerOptions</code> (`core.SpannerOptions`)

Defines options structures that relate to Google Cloud Spanner.

```proto
import "opencannabis/core/datamodel.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    core.SpannerOptions field_name = 1;
}

```







<a name="core.SubmessageOptions"></a>

### Message: <code>SubmessageOptions</code> (`core.SubmessageOptions`)

Specifies options related to storing a sub-message.

```proto
import "opencannabis/core/datamodel.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    core.SubmessageOptions field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `mode` | [`CollectionMode`](#core.CollectionMode) | *None.* | Collection storage mode for the given sub-message field. |
| `concrete` | [`string`](#string) | *None.* | Concrete type name for this sub-message type. |
| `path` | [`string`](#string) | *None.* | Data path for the given sub-message field. |
| `embed` | [`bool`](#bool) | *None.* | If the persistence node is in `COLLECTION` mode, this flag will embed it in the parent entity anyway. Useful in some circumstances where sub-listed data is for indexing, and fetching it repeatedly would be inefficient. |







<a name="core.TableFieldOptions"></a>

### Message: <code>TableFieldOptions</code> (`core.TableFieldOptions`)

Specifies options specific to storing this field in a tabular-style data engine.

```proto
import "opencannabis/core/datamodel.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    core.TableFieldOptions field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `require` | [`bool`](#bool) | *None.* | Marks this field as `REQUIRED` in tabular schemas. |
| `ignore` | [`bool`](#bool) | *None.* | Marks this field as ignored for serialization in tabular circumstances. |
| `bqtype` | [`BigQueryOptions.BigQueryType`](#core.BigQueryOptions.BigQueryType) | *None.* | Overrides the BigQuery type associated with the exported form of this message field. |
| `sptype` | [`SpannerOptions.SpannerType`](#core.SpannerOptions.SpannerType) | *None.* | Overrides the Spanner type associated with the exported form of this message field. |
| `repeated` | [`bool`](#bool) | *None.* | Converts this field into a `REPEATED`-mode field in BigQuery. |
| `size` | [`uint32`](#uint32) | *None.* | Size of the field. Pass `0` (the default) for maximum width. |
| `name` | [`string`](#string) | *None.* | Name of the field in columnar circumstances. |
| `id` | [`string`](#string) | *None.* | Unique ID or path assigned to this field in a universally specified data model. |







<a name="core.TableOptions"></a>

### Message: <code>TableOptions</code> (`core.TableOptions`)

Options specific to model integration with table-style engines, where there can be a table name and/or description
that should be mapped to a particular message structure.

```proto
import "opencannabis/core/datamodel.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    core.TableOptions field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `name` | [`string`](#string) | *None.* | Name of the table bound to this model. |
| `description` | [`string`](#string) | *None.* | Description for the table bound to this model. |






<!-- end messages -->


<a name="core.BigQueryOptions.BigQueryType"></a>

### Enumeration: <code>BigQueryOptions.BigQueryType</code> (`core.BigQueryOptions.BigQueryType`)

Specifies types applicable to BigQuery property translation.

```proto
import "opencannabis/core/datamodel.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  core.BigQueryOptions.BigQueryType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNSPECIFIED_TYPE` | `0` | Unspecified type for Spanner fields. |
| `STRING` | `1` | Default concrete type for BigQuery columns: `STRING`. |
| `NUMERIC` | `2` | `NUMERIC` type. |
| `FLOAT` | `3` | `FLOAT` type. |
| `FLOAT64` | `4` | `FLOAT64` type. |
| `INTEGER` | `5` | `INTEGER` type. |
| `INT64` | `6` | `INT64` type. |
| `BYTES` | `7` | `BYTES` type. |
| `RECORD` | `8` | `RECORD` type. |
| `BOOLEAN` | `9` | `BOOLEAN` type. |
| `GEOGRAPHY` | `10` | `GEOGRAPHY` type. |
| `TIME` | `11` | `TIME` type. |
| `DATE` | `12` | `DATE` type. |
| `DATETIME` | `13` | `DATETIME` type. |
| `TIMESTAMP` | `14` | `TIMESTAMP` type. |
| `JSON` | `99` | `JSON` (special type). |



<a name="core.CollectionMode"></a>

### Enumeration: <code>CollectionMode</code> (`core.CollectionMode`)

Specifies how a sub-object in a particular message should be persisted.

```proto
import "opencannabis/core/datamodel.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  core.CollectionMode enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `NESTED` | `0` | `NESTED` mode stores the specified collection within the parent document. |
| `COLLECTION` | `1` | `COLLECTION` mode stores the specified collection as a sub-collection under the parent document. |
| `GROUP` | `2` | `GROUP` mode stores the specified collection at the root of the data system. |



<a name="core.DatapointType"></a>

### Enumeration: <code>DatapointType</code> (`core.DatapointType`)

Specifies the types an object may use when defining special objects. These types govern how an object is treated,
listed, and adapted throughout its lifecycle.

```proto
import "opencannabis/core/datamodel.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  core.DatapointType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `OBJECT` | `0` | The datamodel represents an object record. |
| `OBJECT_KEY` | `1` | Specifies that this datapoint type is a record key. |
| `EVENT` | `2` | The datamodel represents an event type. |
| `TABLE` | `3` | The datamodel represents a table. |
| `WIRE` | `4` | The datamodel represents a wire object. |
| `HASH` | `5` | The datamodel represents a hash pre-image. |



<a name="core.EnumeratedType"></a>

### Enumeration: <code>EnumeratedType</code> (`core.EnumeratedType`)

Specifies a special role, if applicable, for a given enumerated type. Each selection governs some special behavior
related to defined enums with APIs, databases, and so on.

```proto
import "opencannabis/core/datamodel.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  core.EnumeratedType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `GENERIC_ENUMERATION` | `0` | Specifies a generic enumeration structure. |
| `ERRORS` | `1` | Specifies a structure which enumerates error states. |



<a name="core.FieldType"></a>

### Enumeration: <code>FieldType</code> (`core.FieldType`)

Enumerates field handling special-cases. Fields may be annotated with these special types to change the way they are
handled by the model mapping layer.

```proto
import "opencannabis/core/datamodel.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  core.FieldType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `STANDARD` | `0` | This is a standard field (default value). |
| `KEY` | `1` | This is a key field (a primary key sub-message) for a GROUP or COLLECTION-mode message. |
| `ID` | `2` | This is an ID field that should be used as the final name of this document. |
| `TAGS` | `3` | This is a tags-style field. |
| `FLAGS` | `4` | Store this object as a special flags-style mapping. |
| `REFERENCE` | `5` | This key is a foreign reference. |
| `TIMESTAMP` | `6` | This item is a timestamp. |
| `PARENT` | `7` | This field represents a key for this item's parent. |
| `PATH` | `8` | This field represents a full key path in hierarchical storage. |



<a name="core.FieldVisibility"></a>

### Enumeration: <code>FieldVisibility</code> (`core.FieldVisibility`)

Describes the visibility options for a given field.

```proto
import "opencannabis/core/datamodel.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  core.FieldVisibility enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `DEFAULT_VISIBILITY` | `0` | Default visibility level. No change to default behavior. |
| `OPEN` | `1` | Denotes data that is fine to expose publicly. |
| `AUTHORIZED` | `2` | Denotes data that should only be exposed to authorized users. |
| `OWNER` | `3` | Denotes data that should only be exposed to users authorized by the owner. |
| `INTERNAL` | `4` | Denotes data that should only be exposed internally. |



<a name="core.SpannerOptions.SpannerType"></a>

### Enumeration: <code>SpannerOptions.SpannerType</code> (`core.SpannerOptions.SpannerType`)

Specifies types applicable to Spanner property translation.

```proto
import "opencannabis/core/datamodel.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  core.SpannerOptions.SpannerType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNSPECIFIED_TYPE` | `0` | Unspecified type for Spanner fields. |
| `STRING` | `1` | `STRING` type. |
| `NUMERIC` | `2` | `NUMERIC` type. |
| `FLOAT64` | `3` | `FLOAT64` type. |
| `INT64` | `4` | `INT64` type. |
| `BYTES` | `5` | `BYTES` type. |
| `BOOL` | `6` | `BOOL` type. |
| `DATE` | `7` | `DATE` type. |
| `TIMESTAMP` | `8` | `TIMESTAMP` type. |
| `JSON` | `9` | `JSON` (special type). |



<a name="core.Visibility"></a>

### Enumeration: <code>Visibility</code> (`core.Visibility`)

Sets the visibility of a given object and its constituent properties, in circumstances where the object is served to
a frontend client/agent. Depending on the visibility of a given property, it may or may not be emitted by an API
service, or made available (or not) in the JS context.

```proto
import "opencannabis/core/datamodel.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  core.Visibility enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `PUBLIC` | `0` | Default visibility: the property or item is public. |
| `PRIVATE` | `1` | Private visibility: only usable and addressable by itself, or associated items. |
| `PROTECTED` | `2` | Protected visibility: children and other associated objects can access or address this item. |
| `PACKAGE` | `3` | Package visibility: items or objects in the same package can access and address this item. |
| `EXPORT` | `4` | Export visibility: expose this item to the outer invoking context. |


<!-- end enums -->


<a name="opencannabis/core/datamodel.proto-extensions"></a>

### File-level Extensions

| Extension | Type | Base | Number | Description |
| --------- | ---- | ---- | ------ | ----------- |
| enum_role | EnumeratedType | .google.protobuf.EnumOptions | 9000 | Specifies a special role, if applicable, for a given enumerated type. |
| enumeration | DatapointOptions | .google.protobuf.EnumOptions | 9001 | Settings that specify state for this enum value, including validation settings, as applicable. |
| alias | string | .google.protobuf.EnumValueOptions | 8005 | Aliases when decoding values of this type. |
| label | string | .google.protobuf.EnumValueOptions | 8003 | Human-readable label for a given enumeration value state. Optional, can be used by invoking code to generate labels for states in forms or other UI. |
| value | DatapointOptions | .google.protobuf.EnumValueOptions | 8007 | Settings that specify state for this enum value, including validation settings, as applicable. |
| collection | SubmessageOptions | .google.protobuf.FieldOptions | 7002 | Specifies options related to storage of a sub-message-typed field. |
| column | TableFieldOptions | .google.protobuf.FieldOptions | 7001 | Specifies options related to storage of this field in a tabular-style data engine. |
| field | FieldPersistenceOptions | .google.protobuf.FieldOptions | 7000 | Database engine persistence options specific to an individual document field. |
| id | string | .google.protobuf.FieldOptions | 7004 | Unique ID or path assigned to this field in a universally specified data model. |
| opts | DatapointOptions | .google.protobuf.FieldOptions | 7003 | Settings that specify state for this field, including validation settings, as applicable. |
| db | PersistenceOptions | .google.protobuf.MessageOptions | 6001 | Settings specific to how a particular message entity is stored in the underlying persistence engine. |
| map | ObjectMapping | .google.protobuf.MessageOptions | 6003 | Settings that determine meta-mappings between this message object and enumerated states, declared in a foreign structure. Foreign structure mappings are contextually defined by the invoking application. |
| msg | DatapointOptions | .google.protobuf.MessageOptions | 6004 | Settings that specify state for this message, which may include settings related to visibility or handling, and validation of this object in various circumstances. |
| role | DatapointType | .google.protobuf.MessageOptions | 6000 | Specifies the type of datapoint represented by a given message entity. This can be `RECORD` (generally used for arbitrary datamodel objects), `EVENT` (specialized telemetry event records), `TABLE` (tabular data, generally used for analytics events / BigQuery). |
| table | TableOptions | .google.protobuf.MessageOptions | 6002 | Table-specific configuration for this message. Kicks in when engines are in play that observe or couch data in a table/row-style pattern. Usually used for integration with BigQuery. |

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
