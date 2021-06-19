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

<li><code>opencannabis/partner/PartnerKey.proto</code></li>

<ul>
    <li><a href="#opencannabis.partner.PartnerKey"><code>PartnerKey</code></a></li>
</ul><br />


<li><code>opencannabis/partner/LocationKey.proto</code></li>

<ul>
    <li><a href="#opencannabis.partner.LocationKey"><code>LocationKey</code></a></li>
</ul><br />


</ul>




_________________



<a name="opencannabis/partner/PartnerKey.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/partner/PartnerKey.proto`

Specifies the structure of a key that unique describes the identity of a partner record. "Partners" in the
OpenCannabis ecosystem are companies or organizations that participate in the universal data graph.

To import this module:

```proto
import "opencannabis/partner/PartnerKey.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.partner`     |
| **Bazel Target** | `//opencannabis.partner`   |
|                  |                    |



<a name="opencannabis.partner.PartnerKey"></a>

### Message: <code>PartnerKey</code> (`opencannabis.partner.PartnerKey`)

Specifies a key that uniquely references an implementing OpenCannabis partner. OCP partners include any organization
or company which adopts the OpenCannabis specification and is assigned a global ID by the OCP Initiative.

```proto
import "opencannabis/partner/PartnerKey.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.partner.PartnerKey field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `oid` | [`string`](#string) | *None.* | Short globally-assigned opaque and unique string that identifies an OpenCannabis partner organization. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/partner/LocationKey.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/partner/LocationKey.proto`

Specifies a key that points to a location record owned by a known OpenCannabis partner organization. "Locations" in
OpenCannabis represent retail stores, warehouses that carry inventory, and other concrete physical locations.

To import this module:

```proto
import "opencannabis/partner/LocationKey.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.partner`     |
| **Bazel Target** | `//opencannabis.partner`   |
|                  |                    |



<a name="opencannabis.partner.LocationKey"></a>

### Message: <code>LocationKey</code> (`opencannabis.partner.LocationKey`)

Specifies a key that references a location owned or otherwise managed by a known (and globally-assigned) OpenCannabis
partner organization. This may represent a retail store, inventory warehouse, farm, or any other physical location.

```proto
import "opencannabis/partner/LocationKey.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.partner.LocationKey field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `partner` | [`PartnerKey`](#opencannabis.partner.PartnerKey) | *None.* | Specifies the OpenCannabis partner record that owns this location. |
| `oid` | [`string`](#string) | *None.* | Short string that uniquely identifies this location, under a given partner account. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
