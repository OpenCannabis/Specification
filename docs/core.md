# Protocol Documentation
<a name="top"></a>

---
Module: `module`
Package: `opencannabis.module`
Domain: rfc.opencannabis.info
---


## Reference Documentation

- [opencannabis/core/datamodel.proto](#opencannabis/core/datamodel.proto)
  - [DatapointOptions](#core.DatapointOptions)
  - [FieldPersistenceOptions](#core.FieldPersistenceOptions)
  - [ObjectMapping](#core.ObjectMapping)
  - [PersistenceOptions](#core.PersistenceOptions)
  - [SubmessageOptions](#core.SubmessageOptions)
  - [TableFieldOptions](#core.TableFieldOptions)
  - [TableOptions](#core.TableOptions)

  - [CollectionMode](#core.CollectionMode)
  - [FieldType](#core.FieldType)
  - [FieldVisibility](#core.FieldVisibility)
  - [Visibility](#core.Visibility)

  - [File-level Extensions](#opencannabis/core/datamodel.proto-extensions)
  - [File-level Extensions](#opencannabis/core/datamodel.proto-extensions)
  - [File-level Extensions](#opencannabis/core/datamodel.proto-extensions)
  - [File-level Extensions](#opencannabis/core/datamodel.proto-extensions)
  - [File-level Extensions](#opencannabis/core/datamodel.proto-extensions)
  - [File-level Extensions](#opencannabis/core/datamodel.proto-extensions)
  - [File-level Extensions](#opencannabis/core/datamodel.proto-extensions)
  - [File-level Extensions](#opencannabis/core/datamodel.proto-extensions)
  - [File-level Extensions](#opencannabis/core/datamodel.proto-extensions)
  - [File-level Extensions](#opencannabis/core/datamodel.proto-extensions)
  - [File-level Extensions](#opencannabis/core/datamodel.proto-extensions)





<a name="opencannabis/core/datamodel.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/core/datamodel.proto
Specifies structures that relate to data modeling and the structure of the data. Enumerates collection mode and field
type. Overridden from the central Gust framework which defines the core of the spec.


<a name="core.DatapointOptions"></a>

### DatapointOptions
Options specified for a given datamodel point (which can be a message, a field, an enum, and so on), which describe
how the object or field may be validated in various circumstances, and how it should be handled with regard to
exposure visibility to invoking code.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| visibility | [Visibility](#core.Visibility) |  | Sets the visibility options for this data point. Depending on these options, a property or model may be exposed to invoking code, protected from rewriting, and so on. |
| required | [bool](#bool) |  | Whether this data point (model or field or enum, etc) should be considered "required" for this model to be valid. This setting is applied in various circumstances, usually when data crosses API boundaries. |
| concrete | [bool](#bool) |  | Whether this property contains a "concrete" sub-message, in which case, its properties are lifted to the parent entity. During decoding, a property is added to indicate the concrete selection made. This is usually combined with generic types in a one-of field, for instance, in `MenuProduct`. |
| ephemeral | [bool](#bool) |  | Indicate to the data storage engine that a given field is ephemeral, and should not be stored, but rather held with a calculated value for use in systems upstream from the data storage layer. |






<a name="core.FieldPersistenceOptions"></a>

### FieldPersistenceOptions
Persistence/data engine options specific to an individual message field.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [FieldType](#core.FieldType) |  | Field type, for special-case fields. |
| description | [string](#string) |  | String description of this field included in schemas. |
| summary | [string](#string) |  | Summary for this field, which provides a narrative description. It should be suitable for use in external circumstances, like documentation. |
| stamp_update | [bool](#bool) |  | This item is a timestamp, and we would like it to be automatically updated each time the model that contains it is modified in underlying storage. The field should be read-only. |
| stamp_create | [bool](#bool) |  | This item is a timestamp, and we would like it to be automatically set when the model is created. After that point, we would like this field to be read-only. |
| read_only | [bool](#bool) |  | This field should not allow writes, but rather produce its value dynamically. Fields marked in this manner cannot be set by external code at any point in time. |
| immutable | [bool](#bool) |  | This field should allow writes when the model that contains it is written, but then, henceforth, the model should not allow this field to be mutated. |
| explicit | [bool](#bool) |  | This field should always be explicitly listed with a value, even if it is set to the default value. This function is especially useful for enums with default values, when there is a desire to have consistent indexes. |
| visibility | [FieldVisibility](#core.FieldVisibility) |  | Describes the visibility level of a given field in a tree of fields. This value applies recursively under message fields on which it is applied. Depending on the visibility level active when data is deserialized or serialized, certain data may be withheld corresponding to the invoking user or system's access level. |






<a name="core.ObjectMapping"></a>

### ObjectMapping
Specifies mappings for an arbitrary protobuf message object.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| instance | [string](#string) | repeated | Maps an enumeration instance to this object. Enumeration membership is contextual. |






<a name="core.PersistenceOptions"></a>

### PersistenceOptions
Specifies options related to persistence of underlying model data associated with this particular message type. This
includes settings related to Firestore and other data engines.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| mode | [CollectionMode](#core.CollectionMode) |  | Specifies the storage mode for this entity. |
| path | [string](#string) |  | Data path for a given message, with items in the URL corresponding to parameters in the item's key path. |
| parent | [string](#string) |  | Name of this item's parent collection, if applicable. |






<a name="core.SubmessageOptions"></a>

### SubmessageOptions
Specifies options related to storing a sub-message.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| mode | [CollectionMode](#core.CollectionMode) |  | Collection storage mode for the given sub-message field. |
| concrete | [string](#string) |  | Concrete type name for this sub-message type. |
| path | [string](#string) |  | Data path for the given sub-message field. |
| embed | [bool](#bool) |  | If the persistence node is in `COLLECTION` mode, this flag will embed it in the parent entity anyway. Useful in some circumstances where sub-listed data is for indexing, and fetching it repeatedly would be inefficient. |






<a name="core.TableFieldOptions"></a>

### TableFieldOptions
Specifies options specific to storing this field in a tabular-style data engine.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| require | [bool](#bool) |  | Marks this field as `REQUIRED` in tabular schemas. |
| ignore | [bool](#bool) |  | Marks this field as ignored for serialization in tabular circumstances. |
| bqtype | [string](#string) |  | Overrides the BigQuery type associated with the exported form of this message. |






<a name="core.TableOptions"></a>

### TableOptions
Options specific to model integration with table-style engines, where there can be a table name and/or description
that should be mapped to a particular message structure.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [string](#string) |  | Name of the table bound to this model. |
| description | [string](#string) |  | Description for the table bound to this model. |





<!-- end messages -->


<a name="core.CollectionMode"></a>

### CollectionMode
Specifies how a sub-object in a particular message should be persisted.

| Name | Number | Description |
| ---- | ------ | ----------- |
| NESTED | 0 | `NESTED` mode stores the specified collection within the parent document. |
| COLLECTION | 1 | `COLLECTION` mode stores the specified collection as a sub-collection under the parent document. |
| GROUP | 2 | `GROUP` mode stores the specified collection at the root of the data system. |



<a name="core.FieldType"></a>

### FieldType
Enumerates field handling special-cases. Fields may be annotated with these special types to change the way they are
handled by the model mapping layer.

| Name | Number | Description |
| ---- | ------ | ----------- |
| STANDARD | 0 | This is a standard field (default value). |
| KEY | 1 | This is a key field (a primary key submessage) for a GROUP or COLLECTION-mode message. |
| ID | 2 | This is an ID field that should be used as the final name of this document. |
| TAGS | 3 | This is a tags-style field. |
| FLAGS | 4 | Store this object as a special flags-style mapping. |
| REFERENCE | 5 | This key is a foreign reference. |
| TIMESTAMP | 6 | This item is a timestamp. |
| PARENT | 7 | This field represents a key for this item's parent. |



<a name="core.FieldVisibility"></a>

### FieldVisibility
Describes the visibility options for a given field.

| Name | Number | Description |
| ---- | ------ | ----------- |
| DEFAULT_VISIBILITY | 0 | Default visibility level. No change to default behavior. |
| OPEN | 1 | Denotes data that is fine to expose publicly. |
| AUTHORIZED | 2 | Denotes data that should only be exposed to authorized users. |
| OWNER | 3 | Denotes data that should only be exposed to users authorized by the owner. |
| INTERNAL | 4 | Denotes data that should only be exposed internally. |



<a name="core.Visibility"></a>

### Visibility
Sets the visibility of a given object and its constituent properties, in circumstances where the object is served to
a frontend client/agent. Depending on the visibility of a given property, it may or may not be emitted by an API
service, or made available (or not) in the JS context.

| Name | Number | Description |
| ---- | ------ | ----------- |
| PUBLIC | 0 | Default visibility: the property or item is public. |
| PRIVATE | 1 | Private visibility: only usable and addressable by itself, or associated items. |
| PROTECTED | 2 | Protected visibility: children and other associated objects can access or address this item. |
| PACKAGE | 3 | Package visibility: items or objects in the same package can access and address this item. |
| EXPORT | 4 | Export visibility: expose this item to the outer invoking context. |


<!-- end enums -->


<a name="opencannabis/core/datamodel.proto-extensions"></a>

### File-level Extensions
| Extension | Type | Base | Number | Description |
| --------- | ---- | ---- | ------ | ----------- |
| enumeration | DatapointOptions | .google.protobuf.EnumOptions | 9001 | Settings that specify state for this enum value, including validation settings, as applicable. |
| label | string | .google.protobuf.EnumValueOptions | 8003 | Human-readable label for a given enumeration value state. Optional, can be used by invoking code to generate labels for states in forms or other UI. |
| value | DatapointOptions | .google.protobuf.EnumValueOptions | 8007 | Settings that specify state for this enum value, including validation settings, as applicable. |
| collection | SubmessageOptions | .google.protobuf.FieldOptions | 7002 | Specifies options related to storage of a submessage-typed field. |
| column | TableFieldOptions | .google.protobuf.FieldOptions | 7001 | Specifies options related to storage of this field in a tabular-style data engine. |
| field | FieldPersistenceOptions | .google.protobuf.FieldOptions | 7000 | Database engine persistence options specific to an individual document field. |
| opts | DatapointOptions | .google.protobuf.FieldOptions | 7003 | Settings that specify state for this field, including validation settings, as applicable. |
| db | PersistenceOptions | .google.protobuf.MessageOptions | 6000 | Settings specific to how a particular message entity is stored in the underlying persistence engine. For Bloombox, this generally means Cloud Firestore. |
| map | ObjectMapping | .google.protobuf.MessageOptions | 6002 | Settings that determine meta-mappings between this message object and enumerated states, declared in a foreign structure. Foreign structure mappings are contextually defined by the invoking application. |
| msg | DatapointOptions | .google.protobuf.MessageOptions | 6003 | Settings that specify state for this message, which may include settings related to visibility or handling, and validation of this object in various circumstances. |
| table | TableOptions | .google.protobuf.MessageOptions | 6001 | Table-specific configuration for this message. Kicks in when engines are in play that observe or couch data in a table/row-style pattern. Usually used for integration with BigQuery. |

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
