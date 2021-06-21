---
domain: rfc.opencannabis.info
shortname: 5/OCS-N
name: OpenCannabis Menu Extension
status: raw
editor: Randal Stevens <randy@bloombox.io>
contributors:
- Sam Gammon <sam@bloombox.io>
---

# OpenCannabis: Menu Extension
- Version `1.0`
- Status: `RAW`
<a name="top"></a>

### Status of this Memo

This specification's current status is considered `RAW`, i.e. pre-`DRAFT`. Distribution of this memo is unlimited.

### Abstract

This document describes an extension to the _OpenCannabis Specification, version 1_, that introduces menu-
related definitions structures, and services that compose, create and reference menus.

_"Menu"_ in this context, refers to:
- The contents of a dispensary&#39;s products
- The product categories and their respective names
- The status of the "Menu"
- The channel through which the "Menu" is displayed to customers


### Table of Contents
- [Protocol Definition](#Protocol-Definition): `Menu`: Distribution channels, product labels, product types, etc.
    - [CustomSection](#opencannabis.products.menu.section.CustomSection)
    - [SectionMedia](#opencannabis.products.menu.section.SectionMedia)
    - [SectionSettings](#opencannabis.products.menu.section.SectionSettings)
    - [SectionSpec](#opencannabis.products.menu.section.SectionSpec)
    - [FilteredSection](#opencannabis.products.menu.section.FilteredSection)
    - [Section](#opencannabis.products.menu.section.Section)
    - [SectionFlag](#opencannabis.products.menu.section.SectionFlag)
    - [Menu](#opencannabis.products.menu.Menu)
    - [MenuProduct](#opencannabis.products.menu.MenuProduct)
    - [MenuSettings](#opencannabis.products.menu.MenuSettings)
    - [Metadata](#opencannabis.products.menu.Metadata)
    - [SectionData](#opencannabis.products.menu.SectionData)
    - [SectionedMenu](#opencannabis.products.menu.SectionedMenu)
    - [StaticMenu](#opencannabis.products.menu.StaticMenu)
    - [StaticMenu.ApothecaryEntry](#opencannabis.products.menu.StaticMenu.ApothecaryEntry)
    - [StaticMenu.CartridgesEntry](#opencannabis.products.menu.StaticMenu.CartridgesEntry)
    - [StaticMenu.EdiblesEntry](#opencannabis.products.menu.StaticMenu.EdiblesEntry)
    - [StaticMenu.ExtractsEntry](#opencannabis.products.menu.StaticMenu.ExtractsEntry)
    - [StaticMenu.FlowersEntry](#opencannabis.products.menu.StaticMenu.FlowersEntry)
    - [StaticMenu.MerchandiseEntry](#opencannabis.products.menu.StaticMenu.MerchandiseEntry)
    - [StaticMenu.PlantsEntry](#opencannabis.products.menu.StaticMenu.PlantsEntry)
    - [StaticMenu.PrerollsEntry](#opencannabis.products.menu.StaticMenu.PrerollsEntry)


----

## Protocol Definition
### `opencannabis.menu`
Specifies a menu, menu data structure, contents, products and so on.

{% nomnoml %}

#fill: #d5e7ee; #8ebff2

[Menu
  | metadata:Metadata
  | payload:SectionedMenu
  | menu:StaticMenu]

[MenuSettings
  | full:bool
  | keys_only:bool
  | snapshot:opencannabis.crypto.primitives.integrity.Hash
  | fingerprint:opencannabis.crypto.primitives.integrity.Hash
  | section:section.Section]

{% endnomnoml %}

{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[Metadata
  | scope:string
  | version:uint64
  | status:Status
  | flags:Flag
  | published:opencannabis.temporal.Instant
  | settings:MenuSettings]

[SectionData
  | count:int32
  | section:section.SectionSpec
  | product:MenuProduct]

[SectionedMenu
  | count:int32
  | payload:SectionData]

{% endnomnoml %}

{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[StaticMenu
  | apothecary:StaticMenu.ApothecaryEntry
  | cartridges:StaticMenu.CartridgesEntry
  | edibles:StaticMenu.EdiblesEntry
  | extracts:StaticMenu.ExtractsEntry
  | flowers:StaticMenu.FlowersEntry
  | merchandise:StaticMenu.MerchandiseEntry
  | prerolls:StaticMenu.PrerollsEntry
  | plants:StaticMenu.PlantsEntry]

[StaticMenu.ApothecaryEntry
  | key:string
  | value:opencannabis.products.Apothecary]

{% endnomnoml %}

{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[StaticMenu.CartridgesEntry
  | key:string
  | value:opencannabis.products.Cartridge]

[StaticMenu.EdiblesEntry
  | key:string
  | value:opencannabis.products.Edible]

{% endnomnoml %}
{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[StaticMenu.ExtractsEntry
  | key:string
  | value:opencannabis.products.Extract]

[StaticMenu.FlowersEntry
  | key:string
  | value:opencannabis.products.Flower]

{% endnomnoml %}
{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[StaticMenu.MerchandiseEntry
  | key:string
  | value:opencannabis.products.Merchandise]

[StaticMenu.PrerollsEntry
  | key:string
  | value:opencannabis.products.Preroll]
{% endnomnoml %}
{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[StaticMenu.PlantsEntry
  | key:string
  | value:opencannabis.products.Plant]

[Flag
  | DRAFT:0
  | PRIVATE:1
  | OUT_OF_DATE:2]

[Status
  | UNPUBLISHED:0
  | LIVE:1]

{% endnomnoml %}

<a name="products/menu/Menu.proto"></a>

### Menu
Holds a full specification for a revision of menu data, segmented into sections, by the categories member products
are filed in. Categories are enumerated in `menu.Section`.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| metadata | [Metadata](#opencannabis.products.menu.Metadata) |  | Metadata for the menu. |
| payload | [SectionedMenu](#opencannabis.products.menu.SectionedMenu) |  | Data payloads attached to this menu. |
| menu | [StaticMenu](#opencannabis.products.menu.StaticMenu) |  | Specifies a static menu, where each section is specified as a typed map, with keys mapped to products. |


<a name="opencannabis.products.menu.MenuSettings"></a>

### MenuSettings
Specifies settings used to generate a menu, or used as input when generating menus.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| full | [bool](#bool) |  | Flag indicating a full menu, including hidden/out-of-stock items. |
| keys_only | [bool](#bool) |  | Only include menu keys, no detail data. |
| snapshot | [opencannabis.crypto.primitives.integrity.Hash](#opencannabis.crypto.primitives.integrity.Hash) |  | Don&#39;t return the menu if it&#39;s identical to this fingerprint. |
| fingerprint | [opencannabis.crypto.primitives.integrity.Hash](#opencannabis.crypto.primitives.integrity.Hash) |  | Bloom filter to consider when returning or processing menu items. |
| section | [section.Section](#opencannabis.products.menu.section.Section) | repeated | Sections to include in the menu. If unspecified, include all sections. |


<a name="opencannabis.products.menu.Metadata"></a>

### Metadata
Specifies metadata for a package of menu data.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| scope | [string](#string) |  | Partner location that owns this menu data. |
| version | [uint64](#uint64) |  | Version number, or publish timestamp, of this data. |
| status | [Status](#opencannabis.products.menu.Status) |  | Status of this menu data. |
| flags | [Flag](#opencannabis.products.menu.Flag) | repeated | Flags attached to this menu data. |
| published | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | When this menu data was published. |
| settings | [MenuSettings](#opencannabis.products.menu.MenuSettings) |  | Settings that produced this menu data. |


<a name="opencannabis.products.menu.SectionData"></a>

### SectionData
Specifies an inner menu payload which contains menu data for a given menu section.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| count | [int32](#int32) |  | Count of products included in this menu section data. |
| section | [section.SectionSpec](#opencannabis.products.menu.section.SectionSpec) |  | Section that this data is attached to. |
| product | [MenuProduct](#opencannabis.products.menu.MenuProduct) | repeated | Menu products attached to this section. |


<a name="opencannabis.products.menu.SectionedMenu"></a>

### SectionedMenu
Specifies a menu split into section-level chunks.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| count | [int32](#int32) |  | Count of all products included in this menu, all sections considered. |
| payload | [SectionData](#opencannabis.products.menu.SectionData) | repeated | Specifies a payload of sectioned menu data. |


<a name="opencannabis.products.menu.StaticMenu"></a>

### StaticMenu
Specifies an inner menu payload which contains mapped data, where each map key is a section name, lowercased, and
each map value is itself a product, and each map is addressed at a typed property name.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| apothecary | [StaticMenu.ApothecaryEntry](#opencannabis.products.menu.StaticMenu.ApothecaryEntry) | repeated | Specifies APOTHECARY products attached to this menu. |
| cartridges | [StaticMenu.CartridgesEntry](#opencannabis.products.menu.StaticMenu.CartridgesEntry) | repeated | Specifies CARTRIDGE products attached to this menu. |
| edibles | [StaticMenu.EdiblesEntry](#opencannabis.products.menu.StaticMenu.EdiblesEntry) | repeated | Specifies EDIBLE products attached to this menu. |
| extracts | [StaticMenu.ExtractsEntry](#opencannabis.products.menu.StaticMenu.ExtractsEntry) | repeated | Specifies EXTRACT products attached to this menu. |
| flowers | [StaticMenu.FlowersEntry](#opencannabis.products.menu.StaticMenu.FlowersEntry) | repeated | Specifies FLOWER products attached to this menu. |
| merchandise | [StaticMenu.MerchandiseEntry](#opencannabis.products.menu.StaticMenu.MerchandiseEntry) | repeated | Specifies MERCHANDISE products attached to this menu. |
| plants | [StaticMenu.PlantsEntry](#opencannabis.products.menu.StaticMenu.PlantsEntry) | repeated | Specifies PLANT products attached to this menu. |
| prerolls | [StaticMenu.PrerollsEntry](#opencannabis.products.menu.StaticMenu.PrerollsEntry) | repeated | Specifies PREROLL products attached to this menu. |


<a name="opencannabis.products.menu.StaticMenu.ApothecaryEntry"></a>

### StaticMenu.ApothecaryEntry


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [opencannabis.products.Apothecary](#opencannabis.products.Apothecary) |  |  |


<a name="opencannabis.products.menu.StaticMenu.CartridgesEntry"></a>

### StaticMenu.CartridgesEntry


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [opencannabis.products.Cartridge](#opencannabis.products.Cartridge) |  |  |


<a name="opencannabis.products.menu.StaticMenu.EdiblesEntry"></a>

### StaticMenu.EdiblesEntry


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [opencannabis.products.Edible](#opencannabis.products.Edible) |  |  |


<a name="opencannabis.products.menu.StaticMenu.ExtractsEntry"></a>

### StaticMenu.ExtractsEntry

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [opencannabis.products.Extract](#opencannabis.products.Extract) |  |  |


<a name="opencannabis.products.menu.StaticMenu.FlowersEntry"></a>

### StaticMenu.FlowersEntry


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [opencannabis.products.Flower](#opencannabis.products.Flower) |  |  |


<a name="opencannabis.products.menu.StaticMenu.MerchandiseEntry"></a>

### StaticMenu.MerchandiseEntry

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [opencannabis.products.Merchandise](#opencannabis.products.Merchandise) |  |  |


<a name="opencannabis.products.menu.StaticMenu.PlantsEntry"></a>

### StaticMenu.PlantsEntry

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [opencannabis.products.Plant](#opencannabis.products.Plant) |  |  |


<a name="opencannabis.products.menu.StaticMenu.PrerollsEntry"></a>

### StaticMenu.PrerollsEntry

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [opencannabis.products.Preroll](#opencannabis.products.Preroll) |  |  |


<a name="opencannabis.products.menu.Flag"></a>

### Flag
Enumerates flags that can be set on a menu.

| Name | Number | Description |
| ---- | ------ | ----------- |
| DRAFT | 0 | Indicates that this entire menu is considered a draft. |
| PRIVATE | 1 | Indicates that the underlying menu data is currently private and should not be exposed publicly. |
| OUT_OF_DATE | 2 | Indicates that the underlying menu data is known to be out-of-date. |

<a name="opencannabis.products.menu.Status"></a>

### Status
Enumerates statuses a menu may assume.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNPUBLISHED | 0 | Indicates that a menu revision is not yet published. |
| LIVE | 1 | Indicates that a menu revision has been published and is considered live. |
