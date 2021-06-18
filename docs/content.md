# Protocol Documentation
<a name="top"></a>

---
Module: `module`
Package: `opencannabis.module`
Domain: rfc.opencannabis.info
---


## Reference Documentation

- [opencannabis/content/Name.proto](#opencannabis/content/Name.proto)
  - [Name](#opencannabis.content.Name)

- [opencannabis/content/Colors.proto](#opencannabis/content/Colors.proto)
  - [CMYKColorSpec](#opencannabis.content.CMYKColorSpec)
  - [Color](#opencannabis.content.Color)
  - [ColorScheme](#opencannabis.content.ColorScheme)
  - [HSBColorSpec](#opencannabis.content.HSBColorSpec)
  - [RGBAColorSpec](#opencannabis.content.RGBAColorSpec)

  - [StandardColor](#opencannabis.content.StandardColor)

- [opencannabis/content/Content.proto](#opencannabis/content/Content.proto)
  - [Content](#opencannabis.content.Content)

  - [Content.Type](#opencannabis.content.Content.Type)
  - [Encoding](#opencannabis.content.Encoding)

- [opencannabis/content/Data.proto](#opencannabis/content/Data.proto)
  - [DataFormat](#opencannabis.content.DataFormat)

- [opencannabis/content/MaterialsData.proto](#opencannabis/content/MaterialsData.proto)
  - [MaterialsData](#opencannabis.content.MaterialsData)

- [opencannabis/content/Brand.proto](#opencannabis/content/Brand.proto)
  - [Brand](#opencannabis.content.Brand)
  - [BrandAsset](#opencannabis.content.BrandAsset)
  - [RasterGraphic](#opencannabis.content.RasterGraphic)

- [opencannabis/content/ProductContent.proto](#opencannabis/content/ProductContent.proto)
  - [ProductContent](#opencannabis.content.ProductContent)
  - [ProductTimestamps](#opencannabis.content.ProductTimestamps)





<a name="opencannabis/content/Name.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/content/Name.proto
Specifies the generic concept of a "name," in the concept of a non-human object.


<a name="opencannabis.content.Name"></a>

### Name
Displayable content name.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| primary | [string](#string) |  | Primary name. |
| display | [string](#string) |  | Display name, if different from the 'primary name'. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/content/Colors.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/content/Colors.proto
Structures for dealing with colors in various forms (including hex, RGBA, etc), color schemes, and so on.


<a name="opencannabis.content.CMYKColorSpec"></a>

### CMYKColorSpec
Specifies a cyan-magenta-yellow-key color specification.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| c | [uint64](#uint64) |  | Cyan value for the color. |
| m | [uint64](#uint64) |  | Magenta value for the color. |
| y | [uint64](#uint64) |  | Yellow value for the color. |
| k | [uint64](#uint64) |  | Key value (or, black) for the color. |






<a name="opencannabis.content.Color"></a>

### Color
Specifies an individual color, via standard reference, or hex, or some other form.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| standard | [StandardColor](#opencannabis.content.StandardColor) |  | Specifies a reference to a standard, simple color. |
| hex | [string](#string) |  | Specifies a reference to a color by RGB hex code. |
| rgba | [RGBAColorSpec](#opencannabis.content.RGBAColorSpec) |  | Specifies a full RGBA color. |
| hsb | [HSBColorSpec](#opencannabis.content.HSBColorSpec) |  | Specifies an HSB-based color. |
| cmyk | [CMYKColorSpec](#opencannabis.content.CMYKColorSpec) |  | Specifies a CMYK-based color. |






<a name="opencannabis.content.ColorScheme"></a>

### ColorScheme
Specifies a scheme of color selections, with primary and secondary colors and additional configurable color values.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| primary | [Color](#opencannabis.content.Color) |  | Primary color for the color scheme. |
| secondary | [Color](#opencannabis.content.Color) |  | Secondary color for the color scheme. |
| alert | [Color](#opencannabis.content.Color) |  | Alert, or attention color, for the color scheme. |
| shades | [Color](#opencannabis.content.Color) | repeated | Color shades to be used in various contexts. |






<a name="opencannabis.content.HSBColorSpec"></a>

### HSBColorSpec
Specifies a hue-saturation-brightness color specification.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| h | [uint64](#uint64) |  | Hue value for the color. |
| s | [uint64](#uint64) |  | Saturation value for the color. |
| b | [uint64](#uint64) |  | Brightness value for the color. |






<a name="opencannabis.content.RGBAColorSpec"></a>

### RGBAColorSpec
Specifies a component of a high-res color specification.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| r | [uint64](#uint64) |  | Red value for the color. |
| g | [uint64](#uint64) |  | Green value for the color. |
| b | [uint64](#uint64) |  | Blue value for the color. |
| a | [uint64](#uint64) |  | Alpha value for the color. |





<!-- end messages -->


<a name="opencannabis.content.StandardColor"></a>

### StandardColor
Specifies standard colors.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED_COLOR | 0 | Unspecified or unrecognized standard color. |
| RED | 1 | The color red. |
| GREEN | 2 | The color green. |
| BLUE | 3 | The color blue. |
| YELLOW | 4 | The color yellow. |
| PURPLE | 5 | The color purple. |
| ORANGE | 6 | The color orange. |
| PINK | 7 | The color pink. |
| GRAY | 8 | The color gray. |
| BROWN | 9 | The color brown. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/content/Content.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/content/Content.proto
Specifies the generic concept of "content," which may be attached to nearly anything.


<a name="opencannabis.content.Content"></a>

### Content
Specifies a freeform content payload of some kind.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [Content.Type](#opencannabis.content.Content.Type) |  | Format/underlying type of content data. |
| encoding | [Encoding](#opencannabis.content.Encoding) |  | Encoding of underlying content data. |
| language | [opencannabis.base.Language](#opencannabis.base.Language) |  | Language information for underlying content. |
| compression | [opencannabis.base.Compression](#opencannabis.base.Compression) |  | Compression settings for underlying content. |
| id | [string](#string) |  | ID for the content attached herein, if applicable. |
| revision | [string](#string) |  | UUID for a specific content revision, if applicable. |
| content | [string](#string) |  | Raw bytes of underlying content data. |
| raw | [bytes](#bytes) |  | Raw data attached to this content blob. |





<!-- end messages -->


<a name="opencannabis.content.Content.Type"></a>

### Content.Type
Enumerates supported types/formats for content data.

| Name | Number | Description |
| ---- | ------ | ----------- |
| TEXT | 0 | Plaintext format. |
| MARKDOWN | 1 | Markdown format. |
| HTML | 2 | HTML format. |
| BINARY | 3 | Binary data of some kind (for instance, images). |



<a name="opencannabis.content.Encoding"></a>

### Encoding
Enumerates supported encodings for content data.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UTF8 | 0 | UTF-8 standard encoding. |
| B64 | 1 | Base-64 encoded UTF-8. |
| B64_ASCII | 2 | Base-64 encoded ASCII. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/content/Data.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/content/Data.proto
Provides definitions, structures, and enumerations related to raw data and data formats.

<!-- end messages -->


<a name="opencannabis.content.DataFormat"></a>

### DataFormat
Enumerates known data encapsulation or encoding formats, which are commonly found or used to integrate systems. These
formats (or, a subset of them) are supported for adaption to and from OpenCannabis.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNKNOWN_FORMAT | 0 | Sentinel value for an unknown, or unrecognized, data format. |
| CSV | 10 | Comma-Separated-Values. When referred to with no other demarcation, this enumeration corresponds with [RFC4180 (Common Format and MIME Type for Comma-Separated Values)](https://tools.ietf.org/html/rfc4180). |
| TSV | 11 | Tab-Separated-Values (i.e. CSV, but with tabs). Follows the same quoting and newline guidelines as RFC-4180. |
| EXCEL_CSV | 12 | Excel-style CSV (Comma-Separated-Values) format. |
| EXCEL_XLS | 13 | Old-style Excel spreadsheet format. |
| EXCEL_XLSX | 14 | Modern Excel spreadsheet format. |
| MSGPACK | 20 | MessagePack: length-prefixed JSON-like binary encoding format, schemaless. |
| AVRO | 30 | Avro: length-prefixed JSON-like binary encoding format, schema'd. |
| SQL | 40 | Structured Query Language-based systems or dialects. |
| JSON | 50 | ProtoJSON/JSON object format, serialized to comply with the OpenCannabis standard. |
| OCP_TEXT | 61 | Proto-text format, serialized to comply with the OpenCannabis standard. |
| OCP_BINARY | 62 | Proto-binary format, serialized to comply with the OpenCannabis standard. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/content/MaterialsData.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/content/MaterialsData.proto
Quantitative or empirical content regarding the substance or material of a given product.


<a name="opencannabis.content.MaterialsData"></a>

### MaterialsData
Specifies materials-related data about a product that contains cannabis.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| species | [opencannabis.structs.Species](#opencannabis.structs.Species) |  | Species of an item, if known. |
| genetics | [opencannabis.structs.Genetics](#opencannabis.structs.Genetics) |  | Specifies the genetics of an item, if known. |
| grow | [opencannabis.structs.Grow](#opencannabis.structs.Grow) |  | Specifies how this item was grown. |
| shelf | [opencannabis.structs.Shelf](#opencannabis.structs.Shelf) |  | Shelf status of this product. |
| channel | [opencannabis.products.distribution.DistributionPolicy](#opencannabis.products.distribution.DistributionPolicy) | repeated | Specifies distribution policy for this particular subject material. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/content/Brand.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/content/Brand.proto
Specifies a structure for dealing with brand content information.


<a name="opencannabis.content.Brand"></a>

### Brand
Information about a particular brand or producer of products or materials.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [Name](#opencannabis.content.Name) |  | Naming information for this brand. |
| parent | [Brand](#opencannabis.content.Brand) |  | Parent/owning brand, if applicable. |
| summary | [Content](#opencannabis.content.Content) |  | Summary information or content about this brand. |
| media | [BrandAsset](#opencannabis.content.BrandAsset) | repeated | Media items attached to this brand. |
| theme | [ColorScheme](#opencannabis.content.ColorScheme) |  | Specifies color scheme and app theme values. |
| slug | [string](#string) |  | Formatted slug to use for the brand, as applicable. |
| link | [string](#string) |  | Link to the brand's main page. |






<a name="opencannabis.content.BrandAsset"></a>

### BrandAsset
Individual brand asset.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| raster | [RasterGraphic](#opencannabis.content.RasterGraphic) |  | Raster graphic references. |
| vector | [opencannabis.media.MediaReference](#opencannabis.media.MediaReference) |  | Vector graphic reference. |






<a name="opencannabis.content.RasterGraphic"></a>

### RasterGraphic
Raster graphic URL reference.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| standard | [opencannabis.media.MediaReference](#opencannabis.media.MediaReference) |  | Standard-resolution graphic link. |
| retina | [opencannabis.media.MediaReference](#opencannabis.media.MediaReference) |  | High-resolution graphic link. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/content/ProductContent.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/content/ProductContent.proto
Specifies the generic concept of product content.


<a name="opencannabis.content.ProductContent"></a>

### ProductContent
Specifies a common model for product content, mostly user-visible, and shared by all concrete models. Most of the
information you see when a product is displayed or listed comes from this model.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [Name](#opencannabis.content.Name) |  | Main product name. |
| brand | [Brand](#opencannabis.content.Brand) |  | Brand information for this product. |
| summary | [Content](#opencannabis.content.Content) |  | Description or narrative-style content about this product. |
| usage | [Content](#opencannabis.content.Content) |  | Content about how this product is best used, or recommended to be used, either from the manufacturer or retailer. |
| dosage | [Content](#opencannabis.content.Content) |  | Dosage advice about this product, either from the manufacturer or retailer. |
| media | [opencannabis.media.MediaReference](#opencannabis.media.MediaReference) | repeated | Product media, including images, videos, and so on. |
| pricing | [opencannabis.structs.pricing.ProductPricing](#opencannabis.structs.pricing.ProductPricing) |  | Pricing specification for this product, regardless of pricing type (i.e. weighted or unit-style pricing). |
| tests | [opencannabis.structs.labtesting.TestResults](#opencannabis.structs.labtesting.TestResults) |  | Lab testing information concerning this product. |
| flags | [opencannabis.structs.ProductFlag](#opencannabis.structs.ProductFlag) | repeated | Product flags attached to this content. |
| ts | [ProductTimestamps](#opencannabis.content.ProductTimestamps) |  | Timestamps for this product. |






<a name="opencannabis.content.ProductTimestamps"></a>

### ProductTimestamps
Specifies timestamps applied to a product, so that it may be tracked or sorted according to publish date, creation
date, or last modification date.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| created | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | When the subject product was created. |
| modified | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | When the subject product was last modified. |
| published | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | When the subject product was last or first published. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
