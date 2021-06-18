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

<li><code>opencannabis/base/Compression.proto</code></li>

<ul>
    <li><a href="#opencannabis.base.Compression"><code>Compression</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.base.Compression.Type"><code>Compression.Type</code></a></li>
</ul><br />


<li><code>opencannabis/base/Language.proto</code></li>

<ul>
    <li><a href="#opencannabis.base.Language"><code>Language</code></a></li>
</ul><br />


<li><code>opencannabis/base/ProductKey.proto</code></li>

<ul>
    <li><a href="#opencannabis.base.ProductKey"><code>ProductKey</code></a></li><li><a href="#opencannabis.base.ProductReference"><code>ProductReference</code></a></li>
</ul><br />


<li><code>opencannabis/base/ProductKind.proto</code></li>

<ul>
    <li><a href="#opencannabis.base.ProductKind"><code>ProductKind</code></a></li>
</ul><br />


</ul>




_________________



<a name="opencannabis/base/Compression.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/base/Compression.proto`

Provides tools and structures related to compressing data, and indicating data compression. Also enumerates
registered compression algorithims.

To import this module:

```proto
import "opencannabis/base/Compression.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.base`     |
| **Bazel Target** | `//opencannabis.base`   |
|                  |                    |



<a name="opencannabis.base.Compression"></a>

### Message: <code>Compression</code> (`opencannabis.base.Compression`)

Specifies enabled/disabled state and compression type, and is usually attached to arbitrary data or metadata.

```proto
import "opencannabis/base/Compression.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.base.Compression field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `enabled` | [`bool`](#bool) | *None.* | Enabled/disabled flag for compression. Defaults to not being set, so, falsy. |
| `type` | [`Compression.Type`](#opencannabis.base.Compression.Type) | *None.* | Type of compression in use, if any. Enumerated herein via `Compression.Type`. |






<!-- end messages -->


<a name="opencannabis.base.Compression.Type"></a>

### Enumeration: <code>Compression.Type</code> (`opencannabis.base.Compression.Type`)

Enumerates available types of compression, or strategies or algorithms for compressing data.

```proto
import "opencannabis/base/Compression.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.base.Compression.Type enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `NO_COMPRESSION` | `0` | No compression. |
| `GZIP` | `1` | Gzip-based compression. |
| `BROTLI` | `2` | Brotli-based compression. |
| `SNAPPY` | `3` | Snappy-based compression. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/base/Language.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/base/Language.proto`

Specifies natural language-related messages and enumerations. Also enumerates registered languages.

To import this module:

```proto
import "opencannabis/base/Language.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.base`     |
| **Bazel Target** | `//opencannabis.base`   |
|                  |                    |


<!-- end messages -->


<a name="opencannabis.base.Language"></a>

### Enumeration: <code>Language</code> (`opencannabis.base.Language`)

Specifies languages available for specification, usually used as an attachment to content or media.

```proto
import "opencannabis/base/Language.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.base.Language enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `LANGUAGE_UNSPECIFIED` | `0` | Default or unset language. |
| `ENGLISH` | `1` | English. |
| `SPANISH` | `2` | Spanish. |
| `FRENCH` | `3` | French. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/base/ProductKey.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/base/ProductKey.proto`

Specifies structures that reference specific products at their unique key or name.

To import this module:

```proto
import "opencannabis/base/ProductKey.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.base`     |
| **Bazel Target** | `//opencannabis.base`   |
|                  |                    |



<a name="opencannabis.base.ProductKey"></a>

### Message: <code>ProductKey</code> (`opencannabis.base.ProductKey`)

Specifies a general key for a product, which is the combined specification of a product ID and type, which is
enumerated in `base.ProductType`.

```proto
import "opencannabis/base/ProductKey.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.base.ProductKey field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `id` | [`string`](#string) | *None.* | Product ID, an opaque string that is usually autogenerated. Within the scope of an implementing system, this may also be a stringified integer such as an auto-incrementing ID, for relational-type systems. The product ID is expected to be globally addressable and unique across all product categories. |
| `type` | [`ProductKind`](#opencannabis.base.ProductKind) | *None.* | Type of product the ID is referring to. In most cases this entry can be omitted. |







<a name="opencannabis.base.ProductReference"></a>

### Message: <code>ProductReference</code> (`opencannabis.base.ProductReference`)

Specifies a reference to a product.

```proto
import "opencannabis/base/ProductKey.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.base.ProductReference field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `name` | [`opencannabis.content.Name`](#opencannabis.content.Name) | *None.* | Specifies the name of a product. |
| `key` | [`ProductKey`](#opencannabis.base.ProductKey) | *None.* | Specifies the key, if known, of a product. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/base/ProductKind.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/base/ProductKind.proto`

Enumerates types of addressable cannabis products.

To import this module:

```proto
import "opencannabis/base/ProductKind.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.base`     |
| **Bazel Target** | `//opencannabis.base`   |
|                  |                    |


<!-- end messages -->


<a name="opencannabis.base.ProductKind"></a>

### Enumeration: <code>ProductKind</code> (`opencannabis.base.ProductKind`)

Enumerates types of non-abstract products known to the spec.

All [`ProductKey`](#opencannabis.base.ProductKey) records carry a `ProductKind`, which broadly identifies the type of
product referenced by the key. In polymorphic circumstances, a `oneof` field with concrete product types may also
carry an identifying instance of this enumeration, which allows for code re-use when decoding generic menu data.

#### Super kinds
Each `ProductKind` is related to a taxonomic category by way of
[`ProductSuperkind`](core.md#core.ProductSuperkind). Via the `taxonomy` annotation, one can scan for these super-kind
symbols and enforce constraints or apply other logic that effectively operates across multiple categories, based on
regulatory boundaries.

#### Concrete sub-kinds
Some product kinds have concrete (contextually-specific) _sub-kinds_. Examples include `FLOWER` and `EXTRACT`. These
sub-kinds are defined within the `opencannabis.products` package, with each expressed inline with the sibling model
which it relates to.

```proto
import "opencannabis/base/ProductKind.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.base.ProductKind enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `GENERIC` | `0` | Default value (do not use explicitly). Generic or unrecognized product kind. |
| `FLOWER` | `100` | Traditional buds or 'flower'-based products, essentially sold in bags or jars. |
| `PREROLL` | `200` | Pre-rolled items, generally made from flowers, like a cigarette - this would cover joints, etc. |
| `EXTRACT` | `300` | Manufactured products that are concentrated from flowers in some manner, such as wax or oil. |
| `EDIBLE` | `400` | Manufactured products that are edible, like drinks, snacks, candy, and food. |
| `APOTHECARY` | `500` | Tinctures, topicals, capsules, and other forms of manufactured cannabis. |
| `VAPE` | `600` | Vaporizer cartridges, batteries, and kits. |
| `PLANT` | `700` | Plants sold direct, in various forms such as pre-grown (clones) or raw seeds. |
| `MERCHANDISE` | `999` | Merchandise, usually branded in-house. Also covers glassware and miscellaneous items. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
