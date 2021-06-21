---
domain: rfc.opencannabis.info
shortname: 9/OCS-A
name: OpenCannabis Accounting Extension
status: raw
editor: Randal Stevens <randy@bloombox.io>
contributors:
- Sam Gammon <sam@bloombox.io>
---

<a name="top"></a>

# OpenCannabis: Accounting Extension
- Version `1.0`
- Status: `RAW`

### Status of this Memo

This specification's current status is considered `RAW`, i.e. pre-`DRAFT`. Distribution of this memo is unlimited.

### Abstract

This document describes an extension to the _OpenCannabis Specification, version 1_, that introduces accounting-related
definitions structures, and services that compose, create and reference accounting.

_"Accounting"_ in this context, refers to:
- Tax Jurisdictions
- Local Tax
- Federal Tax

### Table of Contents
- [Protocol Definition](#Protocol-Definition): `accounting`: Bookkeeping, accounting, taxes, and so on.
- [accounting/Taxes.proto](#accounting/Taxes.proto)
    - [FederalTax](#opencannabis.taxes.FederalTax)
    - [LocalTax](#opencannabis.taxes.LocalTax)
    - [ProvincialTax](#opencannabis.taxes.ProvincialTax)
    - [Tax](#opencannabis.taxes.Tax)
    - [TaxJurisdiction](#opencannabis.taxes.TaxJurisdiction)
    - [TaxSpec](#opencannabis.taxes.TaxSpec)
    - [TaxBasis](#opencannabis.taxes.TaxBasis)
    - [TaxJurisdictionMode](#opencannabis.taxes.TaxJurisdictionMode)
----
## Protocol Definition
### `opencannabis.accounting`

{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[FederalTax
  | country:opencannabis.geo.Country]

[LocalTax
  | municipality:string
  | province:opencannabis.geo.Province
  | country:opencannabis.geo.Country]
{% endnomnoml %}

{% nomnoml %}

#fill: #d5e7ee; #8ebff2

[ProvincialTax
  | province:opencannabis.geo.Province
  | country:opencannabis.geo.Country]

[Tax
  | id:string
  | spec:TaxSpec
  | name:string
  | label:string
  | description:string]

{% endnomnoml %}

{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[TaxJurisdiction
  | mode:TaxJurisdictionMode
  | local:LocalTax
  | provincial:ProvincialTax
  | federal:FederalTax]

[TaxSpec
  | basis:TaxBasis
  | jurisdiction:TaxJurisdiction
  | transaction_label:string
  | percentage:double
  | static_value:double]

[TaxBasis
  | ITEM:0
  | ORDER_SUBTOTAL:1
  | ORDER_TOTAL:2]

[TaxJurisdiction
  | LOCAL:0
  | PROVINCE:1
  | FEDERAL:2]

{% endnomnoml %}

<a name="opencannabis.taxes.FederalTax"></a>

### FederalTax
Specifies information about a federally-imposed tax.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| country | [opencannabis.geo.Country](#opencannabis.geo.Country) |  | Province the municipality is in. |


<a name="opencannabis.taxes.LocalTax"></a>
<a href="#top">Top</a></p>

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
