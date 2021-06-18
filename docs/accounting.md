# Protocol Documentation
<a name="top"></a>

---
Module: `module`
Package: `opencannabis.module`
Domain: rfc.opencannabis.info
---


## Reference Documentation

- [opencannabis/accounting/Taxes.proto](#opencannabis/accounting/Taxes.proto)
  - [FederalTax](#opencannabis.taxes.FederalTax)
  - [LocalTax](#opencannabis.taxes.LocalTax)
  - [ProvincialTax](#opencannabis.taxes.ProvincialTax)
  - [Tax](#opencannabis.taxes.Tax)
  - [TaxJurisdiction](#opencannabis.taxes.TaxJurisdiction)
  - [TaxSpec](#opencannabis.taxes.TaxSpec)

  - [TaxBasis](#opencannabis.taxes.TaxBasis)
  - [TaxJurisdictionMode](#opencannabis.taxes.TaxJurisdictionMode)





<a name="opencannabis/accounting/Taxes.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/accounting/Taxes.proto
Provides enumerations and messages that structure and specify jurisdictionally-imposed costs on goods sold (i.e.,
taxes). Support is included for taxes at the federal, provincial, and municipal levels.


<a name="opencannabis.taxes.FederalTax"></a>

### FederalTax
Specifies information about a federally-imposed tax.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| country | [opencannabis.geo.Country](#opencannabis.geo.Country) |  | Province the municipality is in. |






<a name="opencannabis.taxes.LocalTax"></a>

### LocalTax
Specifies information about a municipally- or locally-imposed tax.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| municipality | [string](#string) |  | Municipality imposing the tax. |
| province | [opencannabis.geo.Province](#opencannabis.geo.Province) |  | Province the municipality is in. |
| country | [opencannabis.geo.Country](#opencannabis.geo.Country) |  | Country the province is in. |






<a name="opencannabis.taxes.ProvincialTax"></a>

### ProvincialTax
Specifies information about a provincially-imposed tax.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| province | [opencannabis.geo.Province](#opencannabis.geo.Province) |  | Province the municipality is in. |
| country | [opencannabis.geo.Country](#opencannabis.geo.Country) |  | Country the province is in. |






<a name="opencannabis.taxes.Tax"></a>

### Tax
Specifies a tax to be applied during a purchase.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | ID code for this tax entry. |
| spec | [TaxSpec](#opencannabis.taxes.TaxSpec) |  | Specification for how the tax behaves. |
| name | [string](#string) |  | Back-office name for this tax. |
| label | [string](#string) |  | User-visible name for this tax. |
| description | [string](#string) |  | Narrative description for the tax, to be displayed to back-office and end-users in some special circumstances. |






<a name="opencannabis.taxes.TaxJurisdiction"></a>

### TaxJurisdiction
Specifies information about a particular tax jurisdiction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| mode | [TaxJurisdictionMode](#opencannabis.taxes.TaxJurisdictionMode) |  | Operating mode of this tax jurisdiction. |
| local | [LocalTax](#opencannabis.taxes.LocalTax) |  | Local tax jurisdiction information. |
| provincial | [ProvincialTax](#opencannabis.taxes.ProvincialTax) |  | Provincial tax jurisdiction information. |
| federal | [FederalTax](#opencannabis.taxes.FederalTax) |  | Federal tax jurisdiction information. |






<a name="opencannabis.taxes.TaxSpec"></a>

### TaxSpec
Specification record for a type of taxes to apply.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| basis | [TaxBasis](#opencannabis.taxes.TaxBasis) |  | The basis to calculate the tax value from. |
| jurisdiction | [TaxJurisdiction](#opencannabis.taxes.TaxJurisdiction) |  | Jurisdiction that is levying the tax. |
| transaction_label | [string](#string) |  | What to call this tax on receipts, and other end-user-visible materials. |
| percentage | [double](#double) |  | Percentage rate for the tax. |
| static_value | [double](#double) |  | Flat rate for the tax. |





<!-- end messages -->


<a name="opencannabis.taxes.TaxBasis"></a>

### TaxBasis
Enumerates the types of bases a tax may be calculated from.

| Name | Number | Description |
| ---- | ------ | ----------- |
| ITEM | 0 | The tax is calculated per-item. |
| ORDER_SUBTOTAL | 1 | The tax is calculated from the order subtotal. |
| ORDER_TOTAL | 2 | The tax is calculated in a second phase, applied to the subtotal which includes other taxes. |



<a name="opencannabis.taxes.TaxJurisdictionMode"></a>

### TaxJurisdictionMode
Enumerates the jurisdictions at which tax may be levied.

| Name | Number | Description |
| ---- | ------ | ----------- |
| LOCAL | 0 | The tax is levied by a local municipality. |
| PROVINCE | 1 | The tax is levied by a provincial jurisdiction. |
| FEDERAL | 2 | The tax is levied by a national government. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
