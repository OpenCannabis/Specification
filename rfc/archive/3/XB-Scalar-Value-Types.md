
## Appendix B: Scalar Value Types

This document addendum to the _OpenCannabis Specification_ enumerates _Scalar Value Types_, or raw native types used in
the specification. This list originates directly from
[Google's Protobuf documentation](https://developers.google.com/protocol-buffers/docs/proto3#scalar).

| Type | Notes | C++ Type | Java Type | Python Type |
| ----------- | ----- | -------- | --------- | ----------- |
| <a name="double" ></a> double | Generic double-precision floating point number. | double | double | float |
| <a name="float" ></a> float | Generic standard-precision floating point number. | float | float | float |
| <a name="int32" ></a> int32 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint32 instead. | int32 | int | int |
| <a name="int64" ></a> int64 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint64 instead. | int64 | long | int/long |
| <a name="uint32" ></a> uint32 | Uses variable-length encoding. | uint32 | int | int/long |
| <a name="uint64" ></a> uint64 | Uses variable-length encoding. | uint64 | long | int/long |
| <a name="sint32" ></a> sint32 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int32s. | int32 | int | int |
| <a name="sint64" ></a> sint64 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int64s. | int64 | long | int/long |
| <a name="fixed32" ></a> fixed32 | Always four bytes. More efficient than uint32 if values are often greater than 2^28. | uint32 | int | int |
| <a name="fixed64" ></a> fixed64 | Always eight bytes. More efficient than uint64 if values are often greater than 2^56. | uint64 | long | int/long |
| <a name="sfixed32" ></a> sfixed32 | Always four bytes. | int32 | int | int |
| <a name="sfixed64" ></a> sfixed64 | Always eight bytes. | int64 | long | int/long |
| <a name="bool" ></a> bool | Boolean value of `true` or `false`. Default value is `false`. | bool | boolean | boolean |
| <a name="string" ></a> string | A string must always contain UTF-8 encoded or 7-bit ASCII text. | string | String | str/unicode |
| <a name="bytes" ></a> bytes | May contain any arbitrary sequence of bytes. | string | ByteString | str |

### Subpart 1: Default Values

From [Protobuf's documentation](https://developers.google.com/protocol-buffers/docs/proto3#default):
>  When a message is parsed, if the encoded message does not contain a particular singular element, the corresponding
>  field in the parsed object is set to the default value for that field. These defaults are type-specific:
> - For strings, the default value is the empty string.
> - For bytes, the default value is empty bytes.
> - For bools, the default value is false.
> - For numeric types, the default value is zero.
> - For [enums](https://developers.google.com/protocol-buffers/docs/proto3#enum), the default value is the **first
    defined enum value**, which must be 0.
> - For message fields, the field is not set. Its exact value is language-dependent. See the
    [generated code guide](https://developers.google.com/protocol-buffers/docs/reference/overview) for details.
