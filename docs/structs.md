# Protocol Documentation
<a name="top"></a>

---
Module: `module`
Package: `opencannabis.module`
Domain: rfc.opencannabis.info
---


## Reference Documentation

- [opencannabis/structs/Genetics.proto](#opencannabis/structs/Genetics.proto)
  - [Genetics](#opencannabis.structs.Genetics)

- [opencannabis/structs/Grow.proto](#opencannabis/structs/Grow.proto)
  - [Grow](#opencannabis.structs.Grow)

- [opencannabis/structs/ProductFlags.proto](#opencannabis/structs/ProductFlags.proto)
  - [ProductFlag](#opencannabis.structs.ProductFlag)

- [opencannabis/structs/Shelf.proto](#opencannabis/structs/Shelf.proto)
  - [Shelf](#opencannabis.structs.Shelf)

- [opencannabis/structs/Species.proto](#opencannabis/structs/Species.proto)
  - [Species](#opencannabis.structs.Species)

- [opencannabis/structs/Version.proto](#opencannabis/structs/Version.proto)
  - [VersionSpec](#opencannabis.structs.VersionSpec)





<a name="opencannabis/structs/Genetics.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/structs/Genetics.proto
Provides genetic lineage structures.


<a name="opencannabis.structs.Genetics"></a>

### Genetics
Specifies genetics for a particular plant or flower item.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| male | [opencannabis.base.ProductReference](#opencannabis.base.ProductReference) |  | Specifies the male side of an item's genetics. |
| female | [opencannabis.base.ProductReference](#opencannabis.base.ProductReference) |  | Specifies the female side of an item's genetics. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/structs/Grow.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/structs/Grow.proto
Enumerates grow type.

<!-- end messages -->


<a name="opencannabis.structs.Grow"></a>

### Grow
Enumerates common/known types or styles of cultivation that might produce a flower for sale, or resale after
manufacture.

| Name | Number | Description |
| ---- | ------ | ----------- |
| GENERIC | 0 | Generic, or unknown, grow circumstances. |
| INDOOR | 1 | Indoor grow circumstances, implying high-precision environment controls (temperature, humidity, light, and so on) and close monitoring and optimization. |
| GREENHOUSE | 2 | Greenhouse-based grow circumstances. This includes any indoor grow operation that makes use of natural light in any manner, augmenting replacing controlled indoor lighting. |
| OUTDOOR | 3 | Outdoor-based grow circumstances, that use entirely natural light from the sun. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/structs/ProductFlags.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/structs/ProductFlags.proto
Enumerates the flags a product entry can have applied.

<!-- end messages -->


<a name="opencannabis.structs.ProductFlag"></a>

### ProductFlag
Flags that may be applied to an entire product entry, that govern how an independent product and all of its variants
or sub-products are processed or treated.

| Name | Number | Description |
| ---- | ------ | ----------- |
| VISIBLE | 0 | Default flag value. Marks a product as 'VISIBLE,' meaning it is eligible to be displayed in public circumstances. In some cases, this is interpreted to mean 'IN STOCK.' Being that this flag is a default value, the absence of this flag does not designate an item as non-visible - this is accomplished by explicitly specifying the 'HIDDEN' flag. |
| HIDDEN | 1 | Indicates that this entire product entry should be 'HIDDEN' from public view, or considered 'OUT-OF-STOCK' in back- office systems. |
| PREMIUM | 2 | Designates a product as 'PREMIUM,' indicating it is a top-shelf or super-high-quality product. In some cases, this flag is used to indicate items that are produced in-house. |
| FEATURED | 3 | Designates a product as 'FEATURED,' which makes it eligible for extra promotional display. Featured products are generally highlighted or displayed top-of-the-fold. |
| EXCLUSIVE | 4 | Designates a product as 'EXCLUSIVE,' meaning it is only carried or produced by the owning retailer or manufacturer. |
| IN_HOUSE | 5 | Designates a product as 'IN-HOUSE,' indicating it is carried and produced by the same organization. In a retail context, this flag is used to indicate items manufactured by the retailer or the retailer's partners. |
| LAST_CHANCE | 6 | Indicates that a product will not be around long, or that it is running out. In retail contexts, this designates the product in a way that may trigger extra promotional UI. |
| LIMITED_TIME | 7 | Indicates that a particular product will only be available for a limited time, or is available only in limited batches. |
| LOCAL | 8 | Indicates that a particular product is produced locally. In retail contexts, this may trigger extra promotional UI. |
| DELETED | 9 | Indicates that this product was deleted and subsequently tombstoned. Items "soft deleted" in this manner can be restored by removing this flag. |
| ON_SALE | 20 | Designates, in general, that a product is 'ON-SALE.' This designation SHOULD be propagated-to by implementing servers, from a product's weighted pricing sale flags. This means, if ANY product weight or variant is marked on sale, the 'ON-SALE' flag SHOULD be sent along with the top-level product information. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/structs/Shelf.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/structs/Shelf.proto
Enumerates the "shelf" of a product. Indicates the quality of an entry.

<!-- end messages -->


<a name="opencannabis.structs.Shelf"></a>

### Shelf
Enumerates available 'shelf' entries, for use in retail contexts, to indicate the quality of a particular product
entry (usually flowers).

| Name | Number | Description |
| ---- | ------ | ----------- |
| GENERIC_SHELF | 0 | Default value, indicating no specific shelf choice. |
| ECONOMY | 1 | 'Economy' shelf. Best value for the money, generally with a focus on THC-per-gram. |
| MIDSHELF | 2 | 'Midshelf'. Medium-grade products that strike a balance between cost and potency/quality. |
| TOPSHELF | 3 | 'Topshelf'. High-grade, or highly-refined products, that focus on potency or quality to the exclusion or detriment of cost. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/structs/Species.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/structs/Species.proto
Enumerates the species of a flower.

<!-- end messages -->


<a name="opencannabis.structs.Species"></a>

### Species
Enumerates known cannabis species, that may be applied to products to indicate their general genetic and
pharmacokinetic traits.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED | 0 | Unspecified or unknown species value. |
| SATIVA | 1 | Purely Sativa species value. |
| HYBRID_SATIVA | 2 | Hybrid Indica/Sativa species value, with a focus or predominance towards Sativa. |
| HYBRID | 3 | Purely hybrid Indica/Sativa species value. |
| HYBRID_INDICA | 4 | Hybrid Indica/Sativa species value, with a focus or predominance towards Indica. |
| INDICA | 5 | Purely Indica species value. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/structs/Version.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/structs/Version.proto
Provides a structure defining the concept of a version.


<a name="opencannabis.structs.VersionSpec"></a>

### VersionSpec
Structure that allows universal specification of most common version patterns.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [string](#string) |  | Version specified by arbitrary name. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
