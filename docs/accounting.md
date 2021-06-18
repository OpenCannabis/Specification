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

<li><code>opencannabis/accounting/Taxes.proto</code></li>

<ul>
    <li><a href="#opencannabis.taxes.FederalTax"><code>FederalTax</code></a></li><li><a href="#opencannabis.taxes.LocalTax"><code>LocalTax</code></a></li><li><a href="#opencannabis.taxes.ProvincialTax"><code>ProvincialTax</code></a></li><li><a href="#opencannabis.taxes.Tax"><code>Tax</code></a></li><li><a href="#opencannabis.taxes.TaxJurisdiction"><code>TaxJurisdiction</code></a></li><li><a href="#opencannabis.taxes.TaxSpec"><code>TaxSpec</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.taxes.TaxBasis"><code>TaxBasis</code></a></li><li><a href="#opencannabis.taxes.TaxJurisdictionMode"><code>TaxJurisdictionMode</code></a></li>
</ul><br />


</ul>




_________________



<a name="opencannabis/accounting/Taxes.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/accounting/Taxes.proto`

Provides enumerations and messages that structure and specify jurisdictionally-imposed costs on goods sold (i.e.,
taxes). Support is included for taxes at the federal, provincial, and municipal levels.

To import this module:

```proto
import "opencannabis/accounting/Taxes.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.taxes`     |
| **Bazel Target** | `//opencannabis.taxes`   |
|                  |                    |



<a name="opencannabis.taxes.FederalTax"></a>

### Message: <code>FederalTax</code> (`opencannabis.taxes.FederalTax`)

Specifies information about a federally-imposed tax.

```proto
import "opencannabis/accounting/Taxes.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.taxes.FederalTax field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `country` | [`opencannabis.geo.Country`](#opencannabis.geo.Country) | *None.* | Province the municipality is in. |







<a name="opencannabis.taxes.LocalTax"></a>

### Message: <code>LocalTax</code> (`opencannabis.taxes.LocalTax`)

Specifies information about a municipally- or locally-imposed tax.

```proto
import "opencannabis/accounting/Taxes.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.taxes.LocalTax field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `municipality` | [`string`](#string) | *None.* | Municipality imposing the tax. |
| `province` | [`opencannabis.geo.Province`](#opencannabis.geo.Province) | *None.* | Province the municipality is in. |
| `country` | [`opencannabis.geo.Country`](#opencannabis.geo.Country) | *None.* | Country the province is in. |







<a name="opencannabis.taxes.ProvincialTax"></a>

### Message: <code>ProvincialTax</code> (`opencannabis.taxes.ProvincialTax`)

Specifies information about a provincially-imposed tax.

```proto
import "opencannabis/accounting/Taxes.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.taxes.ProvincialTax field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `province` | [`opencannabis.geo.Province`](#opencannabis.geo.Province) | *None.* | Province the municipality is in. |
| `country` | [`opencannabis.geo.Country`](#opencannabis.geo.Country) | *None.* | Country the province is in. |







<a name="opencannabis.taxes.Tax"></a>

### Message: <code>Tax</code> (`opencannabis.taxes.Tax`)

Specifies a tax to be applied during a purchase.

```proto
import "opencannabis/accounting/Taxes.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.taxes.Tax field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `id` | [`string`](#string) | *None.* | ID code for this tax entry. |
| `spec` | [`TaxSpec`](#opencannabis.taxes.TaxSpec) | *None.* | Specification for how the tax behaves. |
| `name` | [`string`](#string) | *None.* | Back-office name for this tax. |
| `label` | [`string`](#string) | *None.* | User-visible name for this tax. |
| `description` | [`string`](#string) | *None.* | Narrative description for the tax, to be displayed to back-office and end-users in some special circumstances. |







<a name="opencannabis.taxes.TaxJurisdiction"></a>

### Message: <code>TaxJurisdiction</code> (`opencannabis.taxes.TaxJurisdiction`)

Specifies information about a particular tax jurisdiction.

```proto
import "opencannabis/accounting/Taxes.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.taxes.TaxJurisdiction field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `mode` | [`TaxJurisdictionMode`](#opencannabis.taxes.TaxJurisdictionMode) | *None.* | Operating mode of this tax jurisdiction. |
| `local` | [`LocalTax`](#opencannabis.taxes.LocalTax) | *None.* | Local tax jurisdiction information. |
| `provincial` | [`ProvincialTax`](#opencannabis.taxes.ProvincialTax) | *None.* | Provincial tax jurisdiction information. |
| `federal` | [`FederalTax`](#opencannabis.taxes.FederalTax) | *None.* | Federal tax jurisdiction information. |







<a name="opencannabis.taxes.TaxSpec"></a>

### Message: <code>TaxSpec</code> (`opencannabis.taxes.TaxSpec`)

Specification record for a type of taxes to apply.

```proto
import "opencannabis/accounting/Taxes.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.taxes.TaxSpec field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `basis` | [`TaxBasis`](#opencannabis.taxes.TaxBasis) | *None.* | The basis to calculate the tax value from. |
| `jurisdiction` | [`TaxJurisdiction`](#opencannabis.taxes.TaxJurisdiction) | *None.* | Jurisdiction that is levying the tax. |
| `transaction_label` | [`string`](#string) | *None.* | What to call this tax on receipts, and other end-user-visible materials. |
| `percentage` | [`double`](#double) | *None.* | Percentage rate for the tax. |
| `static_value` | [`double`](#double) | *None.* | Flat rate for the tax. |






<!-- end messages -->


<a name="opencannabis.taxes.TaxBasis"></a>

### Enumeration: <code>TaxBasis</code> (`opencannabis.taxes.TaxBasis`)

Enumerates the types of bases a tax may be calculated from.

```proto
import "opencannabis/accounting/Taxes.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.taxes.TaxBasis enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `ITEM` | `0` | The tax is calculated per-item. |
| `ORDER_SUBTOTAL` | `1` | The tax is calculated from the order subtotal. |
| `ORDER_TOTAL` | `2` | The tax is calculated in a second phase, applied to the subtotal which includes other taxes. |



<a name="opencannabis.taxes.TaxJurisdictionMode"></a>

### Enumeration: <code>TaxJurisdictionMode</code> (`opencannabis.taxes.TaxJurisdictionMode`)

Enumerates the jurisdictions at which tax may be levied.

```proto
import "opencannabis/accounting/Taxes.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.taxes.TaxJurisdictionMode enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `LOCAL` | `0` | The tax is levied by a local municipality. |
| `PROVINCE` | `1` | The tax is levied by a provincial jurisdiction. |
| `FEDERAL` | `2` | The tax is levied by a national government. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
