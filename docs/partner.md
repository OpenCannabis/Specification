# Protocol Documentation
<a name="top"></a>

---
Module: `module`
Package: `opencannabis.module`
Domain: rfc.opencannabis.info
---


## Reference Documentation

- [opencannabis/partner/PartnerKey.proto](#opencannabis/partner/PartnerKey.proto)
  - [PartnerKey](#opencannabis.partner.PartnerKey)

- [opencannabis/partner/LocationKey.proto](#opencannabis/partner/LocationKey.proto)
  - [LocationKey](#opencannabis.partner.LocationKey)





<a name="opencannabis/partner/PartnerKey.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/partner/PartnerKey.proto
Specifies the structure of a key that unique describes the identity of a partner record. "Partners" in the
OpenCannabis ecosystem are companies or organizations that participate in the universal data graph.


<a name="opencannabis.partner.PartnerKey"></a>

### PartnerKey
Specifies a key that uniquely references an implementing OpenCannabis partner. OCP partners include any organization
or company which adopts the OpenCannabis specification and is assigned a global ID by the OCP Initiative.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| oid | [string](#string) |  | Short globally-assigned opaque and unique string that identifies an OpenCannabis partner organization. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/partner/LocationKey.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/partner/LocationKey.proto
Specifies a key that points to a location record owned by a known OpenCannabis partner organization. "Locations" in
OpenCannabis represent retail stores, warehouses that carry inventory, and other concrete physical locations.


<a name="opencannabis.partner.LocationKey"></a>

### LocationKey
Specifies a key that references a location owned or otherwise managed by a known (and globally-assigned) OpenCannabis
partner organization. This may represent a retail store, inventory warehouse, farm, or any other physical location.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| partner | [PartnerKey](#opencannabis.partner.PartnerKey) |  | Specifies the OpenCannabis partner record that owns this location. |
| oid | [string](#string) |  | Short string that uniquely identifies this location, under a given partner account. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
