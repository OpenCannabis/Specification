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

<li><code>opencannabis/content/Name.proto</code></li>

<ul>
    <li><a href="#opencannabis.content.Name"><code>Name</code></a></li>
</ul><br />


<li><code>opencannabis/content/Colors.proto</code></li>

<ul>
    <li><a href="#opencannabis.content.CMYKColorSpec"><code>CMYKColorSpec</code></a></li><li><a href="#opencannabis.content.Color"><code>Color</code></a></li><li><a href="#opencannabis.content.ColorScheme"><code>ColorScheme</code></a></li><li><a href="#opencannabis.content.HSBColorSpec"><code>HSBColorSpec</code></a></li><li><a href="#opencannabis.content.RGBAColorSpec"><code>RGBAColorSpec</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.content.StandardColor"><code>StandardColor</code></a></li>
</ul><br />


<li><code>opencannabis/content/Content.proto</code></li>

<ul>
    <li><a href="#opencannabis.content.Content"><code>Content</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.content.Content.Type"><code>Content.Type</code></a></li><li><a href="#opencannabis.content.Encoding"><code>Encoding</code></a></li>
</ul><br />


<li><code>opencannabis/content/Data.proto</code></li>

<ul>
    <li><a href="#opencannabis.content.DataFormat"><code>DataFormat</code></a></li>
</ul><br />


<li><code>opencannabis/content/MaterialsData.proto</code></li>

<ul>
    <li><a href="#opencannabis.content.MaterialsData"><code>MaterialsData</code></a></li><li><a href="#opencannabis.content.SubjectiveTesting"><code>SubjectiveTesting</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.content.Feeling"><code>Feeling</code></a></li><li><a href="#opencannabis.content.PotencyEstimate"><code>PotencyEstimate</code></a></li><li><a href="#opencannabis.content.TasteNote"><code>TasteNote</code></a></li>
</ul><br />


<li><code>opencannabis/content/Brand.proto</code></li>

<ul>
    <li><a href="#opencannabis.content.Brand"><code>Brand</code></a></li><li><a href="#opencannabis.content.BrandAsset"><code>BrandAsset</code></a></li><li><a href="#opencannabis.content.RasterGraphic"><code>RasterGraphic</code></a></li>
</ul><br />


<li><code>opencannabis/content/ProductContent.proto</code></li>

<ul>
    <li><a href="#opencannabis.content.ProductContent"><code>ProductContent</code></a></li><li><a href="#opencannabis.content.ProductTimestamps"><code>ProductTimestamps</code></a></li>
</ul><br />


</ul>




_________________



<a name="opencannabis/content/Name.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/content/Name.proto`

Specifies the generic concept of a "name," in the concept of a non-human object.

To import this module:

```proto
import "opencannabis/content/Name.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.content`     |
| **Bazel Target** | `//opencannabis.content`   |
|                  |                    |



<a name="opencannabis.content.Name"></a>

### Message: <code>Name</code> (`opencannabis.content.Name`)

Displayable content name.

```proto
import "opencannabis/content/Name.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.content.Name field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `primary` | [`string`](#string) | *None.* | Primary name. |
| `display` | [`string`](#string) | *None.* | Display name, if different from the 'primary name'. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/content/Colors.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/content/Colors.proto`

Structures for dealing with colors in various forms (including hex, RGBA, etc), color schemes, and so on.

To import this module:

```proto
import "opencannabis/content/Colors.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.content`     |
| **Bazel Target** | `//opencannabis.content`   |
|                  |                    |



<a name="opencannabis.content.CMYKColorSpec"></a>

### Message: <code>CMYKColorSpec</code> (`opencannabis.content.CMYKColorSpec`)

Specifies a cyan-magenta-yellow-key color specification.

```proto
import "opencannabis/content/Colors.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.content.CMYKColorSpec field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `c` | [`uint64`](#uint64) | *None.* | Cyan value for the color. |
| `m` | [`uint64`](#uint64) | *None.* | Magenta value for the color. |
| `y` | [`uint64`](#uint64) | *None.* | Yellow value for the color. |
| `k` | [`uint64`](#uint64) | *None.* | Key value (or, black) for the color. |







<a name="opencannabis.content.Color"></a>

### Message: <code>Color</code> (`opencannabis.content.Color`)

Specifies an individual color, via standard reference, or hex, or some other form.

```proto
import "opencannabis/content/Colors.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.content.Color field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `standard` | [`StandardColor`](#opencannabis.content.StandardColor) | *None.* | Specifies a reference to a standard, simple color. |
| `hex` | [`string`](#string) | *None.* | Specifies a reference to a color by RGB hex code. |
| `rgba` | [`RGBAColorSpec`](#opencannabis.content.RGBAColorSpec) | *None.* | Specifies a full RGBA color. |
| `hsb` | [`HSBColorSpec`](#opencannabis.content.HSBColorSpec) | *None.* | Specifies an HSB-based color. |
| `cmyk` | [`CMYKColorSpec`](#opencannabis.content.CMYKColorSpec) | *None.* | Specifies a CMYK-based color. |







<a name="opencannabis.content.ColorScheme"></a>

### Message: <code>ColorScheme</code> (`opencannabis.content.ColorScheme`)

Specifies a scheme of color selections, with primary and secondary colors and additional configurable color values.

```proto
import "opencannabis/content/Colors.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.content.ColorScheme field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `primary` | [`Color`](#opencannabis.content.Color) | *None.* | Primary color for the color scheme. |
| `secondary` | [`Color`](#opencannabis.content.Color) | *None.* | Secondary color for the color scheme. |
| `alert` | [`Color`](#opencannabis.content.Color) | *None.* | Alert, or attention color, for the color scheme. |
| `shades` | [`Color`](#opencannabis.content.Color) | repeated | Color shades to be used in various contexts. |







<a name="opencannabis.content.HSBColorSpec"></a>

### Message: <code>HSBColorSpec</code> (`opencannabis.content.HSBColorSpec`)

Specifies a hue-saturation-brightness color specification.

```proto
import "opencannabis/content/Colors.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.content.HSBColorSpec field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `h` | [`uint64`](#uint64) | *None.* | Hue value for the color. |
| `s` | [`uint64`](#uint64) | *None.* | Saturation value for the color. |
| `b` | [`uint64`](#uint64) | *None.* | Brightness value for the color. |







<a name="opencannabis.content.RGBAColorSpec"></a>

### Message: <code>RGBAColorSpec</code> (`opencannabis.content.RGBAColorSpec`)

Specifies a component of a high-res color specification.

```proto
import "opencannabis/content/Colors.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.content.RGBAColorSpec field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `r` | [`uint64`](#uint64) | *None.* | Red value for the color. |
| `g` | [`uint64`](#uint64) | *None.* | Green value for the color. |
| `b` | [`uint64`](#uint64) | *None.* | Blue value for the color. |
| `a` | [`uint64`](#uint64) | *None.* | Alpha value for the color. |






<!-- end messages -->


<a name="opencannabis.content.StandardColor"></a>

### Enumeration: <code>StandardColor</code> (`opencannabis.content.StandardColor`)

Specifies standard colors.

```proto
import "opencannabis/content/Colors.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.content.StandardColor enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNSPECIFIED_COLOR` | `0` | Unspecified or unrecognized standard color. |
| `RED` | `1` | The color red. |
| `GREEN` | `2` | The color green. |
| `BLUE` | `3` | The color blue. |
| `YELLOW` | `4` | The color yellow. |
| `PURPLE` | `5` | The color purple. |
| `ORANGE` | `6` | The color orange. |
| `PINK` | `7` | The color pink. |
| `GRAY` | `8` | The color gray. |
| `BROWN` | `9` | The color brown. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/content/Content.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/content/Content.proto`

Specifies the generic concept of "content," which may be attached to nearly anything.

To import this module:

```proto
import "opencannabis/content/Content.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.content`     |
| **Bazel Target** | `//opencannabis.content`   |
|                  |                    |



<a name="opencannabis.content.Content"></a>

### Message: <code>Content</code> (`opencannabis.content.Content`)

Specifies a freeform content payload of some kind.

```proto
import "opencannabis/content/Content.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.content.Content field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `type` | [`Content.Type`](#opencannabis.content.Content.Type) | *None.* | Format/underlying type of content data. |
| `encoding` | [`Encoding`](#opencannabis.content.Encoding) | *None.* | Encoding of underlying content data. |
| `language` | [`opencannabis.base.Language`](#opencannabis.base.Language) | *None.* | Language information for underlying content. |
| `compression` | [`opencannabis.base.Compression`](#opencannabis.base.Compression) | *None.* | Compression settings for underlying content. |
| `id` | [`string`](#string) | *None.* | ID for the content attached herein, if applicable. |
| `revision` | [`string`](#string) | *None.* | UUID for a specific content revision, if applicable. |
| `content` | [`string`](#string) | *None.* | Raw bytes of underlying content data. |
| `raw` | [`bytes`](#bytes) | *None.* | Raw data attached to this content blob. |






<!-- end messages -->


<a name="opencannabis.content.Content.Type"></a>

### Enumeration: <code>Content.Type</code> (`opencannabis.content.Content.Type`)

Enumerates supported types/formats for content data.

```proto
import "opencannabis/content/Content.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.content.Content.Type enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `TEXT` | `0` | Plaintext format. |
| `MARKDOWN` | `1` | Markdown format. |
| `HTML` | `2` | HTML format. |
| `BINARY` | `3` | Binary data of some kind (for instance, images). |



<a name="opencannabis.content.Encoding"></a>

### Enumeration: <code>Encoding</code> (`opencannabis.content.Encoding`)

Enumerates supported encodings for content data.

```proto
import "opencannabis/content/Content.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.content.Encoding enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UTF8` | `0` | UTF-8 standard encoding. |
| `B64` | `1` | Base-64 encoded UTF-8. |
| `B64_ASCII` | `2` | Base-64 encoded ASCII. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/content/Data.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/content/Data.proto`

Provides definitions, structures, and enumerations related to raw data and data formats.

To import this module:

```proto
import "opencannabis/content/Data.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.content`     |
| **Bazel Target** | `//opencannabis.content`   |
|                  |                    |


<!-- end messages -->


<a name="opencannabis.content.DataFormat"></a>

### Enumeration: <code>DataFormat</code> (`opencannabis.content.DataFormat`)

Enumerates known data encapsulation or encoding formats, which are commonly found or used to integrate systems. These
formats (or, a subset of them) are supported for adaption to and from OpenCannabis.

```proto
import "opencannabis/content/Data.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.content.DataFormat enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNKNOWN_FORMAT` | `0` | Sentinel value for an unknown, or unrecognized, data format. |
| `CSV` | `10` | Comma-Separated-Values. When referred to with no other demarcation, this enumeration corresponds with [RFC4180 (Common Format and MIME Type for Comma-Separated Values)](https://tools.ietf.org/html/rfc4180). |
| `TSV` | `11` | Tab-Separated-Values (i.e. CSV, but with tabs). Follows the same quoting and newline guidelines as RFC-4180. |
| `EXCEL_CSV` | `12` | Excel-style CSV (Comma-Separated-Values) format. |
| `EXCEL_XLS` | `13` | Old-style Excel spreadsheet format. |
| `EXCEL_XLSX` | `14` | Modern Excel spreadsheet format. |
| `MSGPACK` | `20` | MessagePack: length-prefixed JSON-like binary encoding format, schemaless. |
| `AVRO` | `30` | Avro: length-prefixed JSON-like binary encoding format, schema'd. |
| `SQL` | `40` | Structured Query Language-based systems or dialects. |
| `JSON` | `50` | ProtoJSON/JSON object format, serialized to comply with the OpenCannabis standard. |
| `OCP_TEXT` | `61` | Proto-text format, serialized to comply with the OpenCannabis standard. |
| `OCP_BINARY` | `62` | Proto-binary format, serialized to comply with the OpenCannabis standard. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/content/MaterialsData.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/content/MaterialsData.proto`

Quantitative or empirical content regarding the substance or material of a given product.

To import this module:

```proto
import "opencannabis/content/MaterialsData.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.content`     |
| **Bazel Target** | `//opencannabis.content`   |
|                  |                    |



<a name="opencannabis.content.MaterialsData"></a>

### Message: <code>MaterialsData</code> (`opencannabis.content.MaterialsData`)

Specifies materials-related data about a product that contains cannabis.

```proto
import "opencannabis/content/MaterialsData.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.content.MaterialsData field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `species` | [`opencannabis.structs.Species`](#opencannabis.structs.Species) | *None.* | Species of an item, if known. |
| `genetics` | [`opencannabis.structs.Genetics`](#opencannabis.structs.Genetics) | *None.* | Specifies the genetics of an item, if known. |
| `grow` | [`opencannabis.structs.Grow`](#opencannabis.structs.Grow) | *None.* | Specifies how this item was grown. |
| `shelf` | [`opencannabis.structs.Shelf`](#opencannabis.structs.Shelf) | *None.* | Shelf status of this product. |
| `channel` | [`opencannabis.products.distribution.DistributionPolicy`](#opencannabis.products.distribution.DistributionPolicy) | repeated | Specifies distribution policy for this particular subject material. |
| `subjective_tests` | [`SubjectiveTesting`](#opencannabis.content.SubjectiveTesting) | *None.* | Describes subjective test results, including tasting notes, feelings, etc. |







<a name="opencannabis.content.SubjectiveTesting"></a>

### Message: <code>SubjectiveTesting</code> (`opencannabis.content.SubjectiveTesting`)

Specifies the structure of "subjective testing" results, wherein a consumer or user has tried the product and
evaluated its subjective effects.

```proto
import "opencannabis/content/MaterialsData.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.content.SubjectiveTesting field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `description` | [`Content`](#opencannabis.content.Content) | *None.* | Subjective description of using this product. |
| `taste` | [`Content`](#opencannabis.content.Content) | *None.* | Subjective description of the taste of this product. |
| `potency` | [`PotencyEstimate`](#opencannabis.content.PotencyEstimate) | *None.* | Subjective potency estimate for this product. |
| `feeling` | [`Feeling`](#opencannabis.content.Feeling) | repeated | Subjective feeling tags for this product. |
| `aroma` | [`TasteNote`](#opencannabis.content.TasteNote) | repeated | Subjective taste or aroma notes for this product. |






<!-- end messages -->


<a name="opencannabis.content.Feeling"></a>

### Enumeration: <code>Feeling</code> (`opencannabis.content.Feeling`)

Enumerates symptomatic/experiential feeling results from subjective product testing. Feeling states are not designed
to be scientific or interpreted as medical advice.

```proto
import "opencannabis/content/MaterialsData.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.content.Feeling enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `NO_FEELING_PREFERENCE` | `0` | No feeling preference or value. |
| `GROUNDING` | `1` | "Grounding" feeling. |
| `SLEEP` | `2` | "Sleepy" feeling. |
| `CALMING` | `3` | "Calming" feeling. |
| `STIMULATING` | `4` | "Stimulating" feeling. |
| `FUNNY` | `5` | "Funny" feeling. |
| `FOCUS` | `6` | "Focus" feeling. |
| `PASSION` | `7` | "Passion" feeling. |



<a name="opencannabis.content.PotencyEstimate"></a>

### Enumeration: <code>PotencyEstimate</code> (`opencannabis.content.PotencyEstimate`)

Generic potency estimate enumeration, either based on subjective product testing or calculated against some metric
for the user's tolerance level.

```proto
import "opencannabis/content/MaterialsData.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.content.PotencyEstimate enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `LIGHT` | `0` | Light potency. |
| `MEDIUM` | `1` | Medium potency. |
| `HEAVY` | `2` | Heavy potency. |
| `SUPER` | `3` | Top/super potency. |



<a name="opencannabis.content.TasteNote"></a>

### Enumeration: <code>TasteNote</code> (`opencannabis.content.TasteNote`)

Enumerates taste or aroma notes, either based on subjective product testing or quantitative/empirical terpene
compound testing.

```proto
import "opencannabis/content/MaterialsData.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.content.TasteNote enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `NO_TASTE_PREFERENCE` | `0` | No particular taste or aroma preference or value. |
| `SWEET` | `1` | "Sweet" taste/aroma note. |
| `SOUR` | `2` | "Sour" taste/aroma note. |
| `SPICE` | `3` | "Spice" taste/aroma note. |
| `SMOOTH` | `4` | "Smooth" taste/aroma note. |
| `CITRUS` | `5` | "Citrus" taste/aroma note. |
| `PINE` | `6` | "Pine" taste/aroma note. |
| `FRUIT` | `7` | "Fruit" taste/aroma note. |
| `TROPICS` | `8` | "Tropics" taste/aroma note. |
| `FLORAL` | `9` | "Floral" taste/aroma note. |
| `HERB` | `10` | "Herbal" taste/aroma note. |
| `EARTH` | `11` | "Earthy" taste/aroma note. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/content/Brand.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/content/Brand.proto`

Specifies a structure for dealing with brand content information.

To import this module:

```proto
import "opencannabis/content/Brand.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.content`     |
| **Bazel Target** | `//opencannabis.content`   |
|                  |                    |



<a name="opencannabis.content.Brand"></a>

### Message: <code>Brand</code> (`opencannabis.content.Brand`)

Information about a particular brand or producer of products or materials.

```proto
import "opencannabis/content/Brand.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.content.Brand field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `name` | [`Name`](#opencannabis.content.Name) | *None.* | Naming information for this brand. |
| `parent` | [`Brand`](#opencannabis.content.Brand) | *None.* | Parent/owning brand, if applicable. |
| `summary` | [`Content`](#opencannabis.content.Content) | *None.* | Summary information or content about this brand. |
| `media` | [`BrandAsset`](#opencannabis.content.BrandAsset) | repeated | Media items attached to this brand. |
| `theme` | [`ColorScheme`](#opencannabis.content.ColorScheme) | *None.* | Specifies color scheme and app theme values. |
| `slug` | [`string`](#string) | *None.* | Formatted slug to use for the brand, as applicable. |
| `link` | [`string`](#string) | *None.* | Link to the brand's main page. |







<a name="opencannabis.content.BrandAsset"></a>

### Message: <code>BrandAsset</code> (`opencannabis.content.BrandAsset`)

Individual brand asset.

```proto
import "opencannabis/content/Brand.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.content.BrandAsset field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `raster` | [`RasterGraphic`](#opencannabis.content.RasterGraphic) | *None.* | Raster graphic references. |
| `vector` | [`opencannabis.media.MediaReference`](#opencannabis.media.MediaReference) | *None.* | Vector graphic reference. |







<a name="opencannabis.content.RasterGraphic"></a>

### Message: <code>RasterGraphic</code> (`opencannabis.content.RasterGraphic`)

Raster graphic URL reference.

```proto
import "opencannabis/content/Brand.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.content.RasterGraphic field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `standard` | [`opencannabis.media.MediaReference`](#opencannabis.media.MediaReference) | *None.* | Standard-resolution graphic link. |
| `retina` | [`opencannabis.media.MediaReference`](#opencannabis.media.MediaReference) | *None.* | High-resolution graphic link. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/content/ProductContent.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/content/ProductContent.proto`

Specifies the generic concept of product content.

To import this module:

```proto
import "opencannabis/content/ProductContent.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.content`     |
| **Bazel Target** | `//opencannabis.content`   |
|                  |                    |



<a name="opencannabis.content.ProductContent"></a>

### Message: <code>ProductContent</code> (`opencannabis.content.ProductContent`)

Specifies a common model for product content, mostly user-visible, and shared by all concrete models. Most of the
information you see when a product is displayed or listed comes from this model.

```proto
import "opencannabis/content/ProductContent.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.content.ProductContent field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `name` | [`Name`](#opencannabis.content.Name) | *None.* | Main product name. |
| `brand` | [`Brand`](#opencannabis.content.Brand) | *None.* | Brand information for this product. |
| `summary` | [`Content`](#opencannabis.content.Content) | *None.* | Description or narrative-style content about this product. |
| `usage` | [`Content`](#opencannabis.content.Content) | *None.* | Content about how this product is best used, or recommended to be used, either from the manufacturer or retailer. |
| `dosage` | [`Content`](#opencannabis.content.Content) | *None.* | Dosage advice about this product, either from the manufacturer or retailer. |
| `media` | [`opencannabis.media.MediaReference`](#opencannabis.media.MediaReference) | repeated | Product media, including images, videos, and so on. |
| `pricing` | [`opencannabis.structs.pricing.ProductPricing`](#opencannabis.structs.pricing.ProductPricing) | *None.* | Pricing specification for this product, regardless of pricing type (i.e. weighted or unit-style pricing). |
| `tests` | [`opencannabis.labtesting.TestResults`](#opencannabis.labtesting.TestResults) | *None.* | Lab testing information concerning this product. |
| `flags` | [`opencannabis.structs.ProductFlag`](#opencannabis.structs.ProductFlag) | repeated | Product flags attached to this content. |
| `ts` | [`ProductTimestamps`](#opencannabis.content.ProductTimestamps) | *None.* | Timestamps for this product. |







<a name="opencannabis.content.ProductTimestamps"></a>

### Message: <code>ProductTimestamps</code> (`opencannabis.content.ProductTimestamps`)

Specifies timestamps applied to a product, so that it may be tracked or sorted according to publish date, creation
date, or last modification date.

```proto
import "opencannabis/content/ProductContent.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.content.ProductTimestamps field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `created` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | When the subject product was created. |
| `modified` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | When the subject product was last modified. |
| `published` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | When the subject product was last or first published. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
