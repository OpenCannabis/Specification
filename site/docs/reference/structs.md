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

<li><code>opencannabis/structs/Genetics.proto</code></li>

<ul>
    <li><a href="#opencannabis.structs.Genetics"><code>Genetics</code></a></li>
</ul><br />


<li><code>opencannabis/structs/Grow.proto</code></li>

<ul>
    <li><a href="#opencannabis.structs.Grow"><code>Grow</code></a></li>
</ul><br />


<li><code>opencannabis/structs/ProductFlags.proto</code></li>

<ul>
    <li><a href="#opencannabis.structs.ProductFlag"><code>ProductFlag</code></a></li>
</ul><br />


<li><code>opencannabis/structs/Shelf.proto</code></li>

<ul>
    <li><a href="#opencannabis.structs.Shelf"><code>Shelf</code></a></li>
</ul><br />


<li><code>opencannabis/structs/Species.proto</code></li>

<ul>
    <li><a href="#opencannabis.structs.Species"><code>Species</code></a></li>
</ul><br />


<li><code>opencannabis/structs/Version.proto</code></li>

<ul>
    <li><a href="#opencannabis.structs.VersionSpec"><code>VersionSpec</code></a></li>
</ul><br />


</ul>




_________________



<a name="opencannabis/structs/Genetics.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/structs/Genetics.proto`

Provides genetic lineage structures.

To import this module:

```proto
import "opencannabis/structs/Genetics.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.structs`     |
| **Bazel Target** | `//opencannabis.structs`   |
|                  |                    |



<a name="opencannabis.structs.Genetics"></a>

### Message: <code>Genetics</code> (`opencannabis.structs.Genetics`)

Specifies genetics for a particular plant or flower item.

```proto
import "opencannabis/structs/Genetics.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.structs.Genetics field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `male` | [`opencannabis.base.ProductReference`](#opencannabis.base.ProductReference) | *None.* | Specifies the male side of an item's genetics. |
| `female` | [`opencannabis.base.ProductReference`](#opencannabis.base.ProductReference) | *None.* | Specifies the female side of an item's genetics. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/structs/Grow.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/structs/Grow.proto`

Enumerates grow type.

To import this module:

```proto
import "opencannabis/structs/Grow.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.structs`     |
| **Bazel Target** | `//opencannabis.structs`   |
|                  |                    |


<!-- end messages -->


<a name="opencannabis.structs.Grow"></a>

### Enumeration: <code>Grow</code> (`opencannabis.structs.Grow`)

Enumerates common/known types or styles of cultivation that might produce a flower for sale, or resale after
manufacture.

```proto
import "opencannabis/structs/Grow.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.structs.Grow enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `GENERIC` | `0` | Generic, or unknown, grow circumstances. |
| `INDOOR` | `1` | Indoor grow circumstances, implying high-precision environment controls (temperature, humidity, light, and so on) and close monitoring and optimization. |
| `GREENHOUSE` | `2` | Greenhouse-based grow circumstances. This includes any indoor grow operation that makes use of natural light in any manner, augmenting replacing controlled indoor lighting. |
| `OUTDOOR` | `3` | Outdoor-based grow circumstances, that use entirely natural light from the sun. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/structs/ProductFlags.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/structs/ProductFlags.proto`

Enumerates the flags a product entry can have applied.

To import this module:

```proto
import "opencannabis/structs/ProductFlags.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.structs`     |
| **Bazel Target** | `//opencannabis.structs`   |
|                  |                    |


<!-- end messages -->


<a name="opencannabis.structs.ProductFlag"></a>

### Enumeration: <code>ProductFlag</code> (`opencannabis.structs.ProductFlag`)

Flags that may be applied to an entire product entry, that govern how an independent product and all of its variants
or sub-products are processed or treated.

```proto
import "opencannabis/structs/ProductFlags.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.structs.ProductFlag enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `VISIBLE` | `0` | Default flag value. Marks a product as 'VISIBLE,' meaning it is eligible to be displayed in public circumstances. In some cases, this is interpreted to mean 'IN STOCK.' Being that this flag is a default value, the absence of this flag does not designate an item as non-visible - this is accomplished by explicitly specifying the 'HIDDEN' flag. |
| `HIDDEN` | `1` | Indicates that this entire product entry should be 'HIDDEN' from public view, or considered 'OUT-OF-STOCK' in back- office systems. |
| `PREMIUM` | `2` | Designates a product as 'PREMIUM,' indicating it is a top-shelf or super-high-quality product. In some cases, this flag is used to indicate items that are produced in-house. |
| `FEATURED` | `3` | Designates a product as 'FEATURED,' which makes it eligible for extra promotional display. Featured products are generally highlighted or displayed top-of-the-fold. |
| `EXCLUSIVE` | `4` | Designates a product as 'EXCLUSIVE,' meaning it is only carried or produced by the owning retailer or manufacturer. |
| `IN_HOUSE` | `5` | Designates a product as 'IN-HOUSE,' indicating it is carried and produced by the same organization. In a retail context, this flag is used to indicate items manufactured by the retailer or the retailer's partners. |
| `LAST_CHANCE` | `6` | Indicates that a product will not be around long, or that it is running out. In retail contexts, this designates the product in a way that may trigger extra promotional UI. |
| `LIMITED_TIME` | `7` | Indicates that a particular product will only be available for a limited time, or is available only in limited batches. |
| `LOCAL` | `8` | Indicates that a particular product is produced locally. In retail contexts, this may trigger extra promotional UI. |
| `DELETED` | `9` | Indicates that this product was deleted and subsequently tombstoned. Items "soft deleted" in this manner can be restored by removing this flag. |
| `ON_SALE` | `20` | Designates, in general, that a product is 'ON-SALE.' This designation SHOULD be propagated-to by implementing servers, from a product's weighted pricing sale flags. This means, if ANY product weight or variant is marked on sale, the 'ON-SALE' flag SHOULD be sent along with the top-level product information. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/structs/Shelf.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/structs/Shelf.proto`

Enumerates the "shelf" of a product. Indicates the quality of an entry.

To import this module:

```proto
import "opencannabis/structs/Shelf.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.structs`     |
| **Bazel Target** | `//opencannabis.structs`   |
|                  |                    |


<!-- end messages -->


<a name="opencannabis.structs.Shelf"></a>

### Enumeration: <code>Shelf</code> (`opencannabis.structs.Shelf`)

Enumerates available 'shelf' entries, for use in retail contexts, to indicate the quality of a particular product
entry (usually flowers).

```proto
import "opencannabis/structs/Shelf.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.structs.Shelf enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `GENERIC_SHELF` | `0` | Default value, indicating no specific shelf choice. |
| `ECONOMY` | `1` | 'Economy' shelf. Best value for the money, generally with a focus on THC-per-gram. |
| `MIDSHELF` | `2` | 'Midshelf'. Medium-grade products that strike a balance between cost and potency/quality. |
| `TOPSHELF` | `3` | 'Topshelf'. High-grade, or highly-refined products, that focus on potency or quality to the exclusion or detriment of cost. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/structs/Species.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/structs/Species.proto`

Enumerates the species of a flower.

To import this module:

```proto
import "opencannabis/structs/Species.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.structs`     |
| **Bazel Target** | `//opencannabis.structs`   |
|                  |                    |


<!-- end messages -->


<a name="opencannabis.structs.Species"></a>

### Enumeration: <code>Species</code> (`opencannabis.structs.Species`)

Enumerates known cannabis species, that may be applied to products to indicate their general genetic and
pharmacokinetic traits.

```proto
import "opencannabis/structs/Species.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.structs.Species enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNSPECIFIED` | `0` | Unspecified or unknown species value. |
| `SATIVA` | `1` | Purely Sativa species value. |
| `HYBRID_SATIVA` | `2` | Hybrid Indica/Sativa species value, with a focus or predominance towards Sativa. |
| `HYBRID` | `3` | Purely hybrid Indica/Sativa species value. |
| `HYBRID_INDICA` | `4` | Hybrid Indica/Sativa species value, with a focus or predominance towards Indica. |
| `INDICA` | `5` | Purely Indica species value. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/structs/Version.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/structs/Version.proto`

Provides a structure defining the concept of a version.

To import this module:

```proto
import "opencannabis/structs/Version.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.structs`     |
| **Bazel Target** | `//opencannabis.structs`   |
|                  |                    |



<a name="opencannabis.structs.VersionSpec"></a>

### Message: <code>VersionSpec</code> (`opencannabis.structs.VersionSpec`)

Structure that allows universal specification of most common version patterns.

```proto
import "opencannabis/structs/Version.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.structs.VersionSpec field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `name` | [`string`](#string) | *None.* | Version specified by arbitrary name. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
