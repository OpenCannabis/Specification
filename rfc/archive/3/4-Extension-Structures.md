
# Extension Structures: Protocol Documentation
<a name="top"></a>

_"Extension structures"_ refer to messages and definitions that are _not_ included in the core _OpenCannabis_ spec, but
are instead proposed via a _Specification Extension_.

Definitions considered core to the main specification are enumerated separately in
[Part 1.1, Core Structures](3-Core-Structures.md).

## Table of Contents
- [4/OCS-M](../4/README.md) / `media`: Images, video, documents, etc.
- [5/OCS-N](../5/README.md) / `menu` : Distribution channels, product labels, product types, etc.
- [6/OCS-C](../6/README.md) / `commerce`: Commercial ordering and fulfillment structures.
- [7/OCS-L](../7/README.md) / `labtesting`: Laboratory testing and QA.
- [8/OCS-X](../8/README.md) / `proximity`: Bluetooth and GPS-related structures.
- [9/OCS-O](../9/README.md) / `oauth`: OAuth2 implementation structures.
- [10/OCS-A](../10/README.md) / `accounting`: Bookkeeping, accounting, taxes, and so on.

----

## `opencannabis.products.menu`

Full menu structures and payloads.

{% nomnoml %}

#fill: #d5e7ee; #8ebff2

[CustomSection
 | id: string
 | filter: FilteredSection]

[SectionMedia
 | tablet_homescreen_media: opencannabis.media.MediaItem]

[SectionSettings
 | name: opencannabis.content.Name
 | media: SectionMedia]

[SectionSpec
 | section: Section
 | custom_section: CustomSection
 | name: string
 | settings: SectionSettings
 | flags: SectionFlag]

[FilteredSection
 | ON_SALE: 0
 | HOUSE: 1
 | CBD: 2]

{% endnomnoml %}


{% nomnoml %}

#fill: #d5e7ee; #8ebff2

[Section
 | UNSPECIFIED: 0
 | FLOWERS: 1
 | EXTRACTS: 2
 | EDIBLES: 3
 | CARTRIDGES: 4
 | APOTHECARY: 5
 | PREROLLS: 6
 | PLANTS: 7
 | MERCHANDISE: 8]

[Menu
 | metadata: Metadata
 | payload: SectionedMenu
 | menu: StaticMenu]

[MenuProduct
 | key: opencannabis.base.ProductKey
 | apothecary: opencannabis.products.Apothecary
 | cartridge: opencannabis.products.Cartridge
 | edible: opencannabis.products.Edible
 | extract: opencannabis.products.Extract
 | flower: opencannabis.products.Flower
 | merchandise: opencannabis.products.Merchandise
 | plant: opencannabis.products.Plant
 | preroll: opencannabis.products.Preroll]

[MenuSettings
 | full: bool
 | keys_only: bool
 | snapshot: opencannabis.crypto.primitives.integrity.Hash
 | fingerprint: opencannabis.crypto.primitives.integrity.Hash
 | section: section.Section]

{% endnomnoml %}


{% nomnoml %}

#fill: #d5e7ee; #8ebff2

[MetaData
 | scope: string
 | version: uint64
 | status: Status
 | flags: Flag
 | published: opencannabis.temporal.Instant
 | settings: MenuSettings]

[SectionData
 | count: int32
 | section: section.SectionSpec
 | product: repeated MenuProduct]

[SectionMenu
 | count: int32
 | payload: repeated SectionData]

[StaticMenu
 | apothecary: repeated StaticMenu.ApothecaryEntry
 | cartridges: repeated StaticMenu.CartridgesEntry
 | edibles: repeated StaticMenu.EdiblesEntry
 | extracts: repeated StaticMenu.ExtractsEntry
 | flowers: repeated StaticMenu.FlowersEntry
 | merchandise: repeated StaticMenu.MerchandiseEntry
 | plants: repeated StaticMenu.PlantsEntry
 | prerolls: repeated StaticMenu.PrerollsEntry]

{% endnomnoml %}

{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[Flag
 | DRAFT: 0
 | PRIVATE: 1
 | OUT_OF_DATE: 2]

[Status
 | UNPUBLISHED: 0
 | LIVE: 1]

{% endnomnoml %}


{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[StaticMenu.MerchandiseEntry
 | key: string
 | value: opencannabis.products.Merchandise]

[StaticMenu.PlantsEntry
 | key: string
 | value: opencannabis.products.Plant]

[StaicMenu.PrerollsEntry
 | key: string
 | value: opencannabis.products.Preroll]

{% endnomnoml %}


<a name="products/menu/Section.proto"></a>


### `CustomSection.Type`
Custom configuration-based menu sections, usually via `FilteredSection`.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | String ID for a custom section. |
| filter | [FilteredSection](#opencannabis.products.menu.section.FilteredSection) |  | Filtered section specification. |


<a name="opencannabis.products.menu.section.SectionMedia"></a>

### `SectionMedia.Type`
Specifies media for a section.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| tablet_homescreen_media | [opencannabis.media.MediaItem](#opencannabis.media.MediaItem) |  | Specifies a media item to use as a tablet homescreen tile for this section. |


<a name="opencannabis.products.menu.section.SectionSettings"></a>

### `SectionSettings.Type`
Specifies settings that a menu section may consider.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [opencannabis.content.Name](#opencannabis.content.Name) |  | Presentable name for this section. |
| media | [SectionMedia](#opencannabis.products.menu.section.SectionMedia) |  | Media to use when presenting this section. |


<a name="opencannabis.products.menu.section.SectionSpec"></a>

### `SectionSpec.Type`
Specifies a menu section, along with section configuration (settings and flags).

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| section | [Section](#opencannabis.products.menu.section.Section) |  | Known and enumerated menu section. |
| custom_section | [CustomSection](#opencannabis.products.menu.section.CustomSection) |  | Custom, filter-based menu section. |
| name | [string](#string) |  | Arbitrary name for other types of sections. |
| settings | [SectionSettings](#opencannabis.products.menu.section.SectionSettings) |  | Settings to apply to the subject section. |
| flags | [SectionFlag](#opencannabis.products.menu.section.SectionFlag) | repeated | Current set of flags to apply to the subject section. |


<a name="opencannabis.products.menu.section.FilteredSection"></a>

### `FilteredSection.Number`
Special filtered sections - commonly used sections based on filters builtin to apps/sites.

| Name | Number | Description |
| ---- | ------ | ----------- |
| ON_SALE | 0 | Only presents products that are on sale. |
| HOUSE | 1 | Only presents products that are cultivated, manufactured, or otherwise produced in-house. |
| CBD | 2 | Only presents products containing CBD. |


<a name="opencannabis.products.menu.section.Section"></a>

### `Section.Number`
Known sections, that are expected to be included with nearly every menu.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED | 0 | Unspecified or unknown section. |
| FLOWERS | 1 | Traditional &#34;buds&#34; or &#34;flowers&#34; section. |
| EXTRACTS | 2 | Concentrated cannabis products such as oils, waxes and hashes. |
| EDIBLES | 3 | Edible cannabis products, such as brownies, candy bars, etc. |
| CARTRIDGES | 4 | Cartridge and pen battery products. |
| APOTHECARY | 5 | Tinctures, teas, and other miscellaneous products. |
| PREROLLS | 6 | Pre-rolled flower-based joints, potentially fortified. |
| PLANTS | 7 | Plant clones, seeds, and other cultivation products. |
| MERCHANDISE | 8 | General merchandise. |


<a name="opencannabis.products.menu.section.SectionFlag"></a>

### `SectionFlag.Number'
Flags that may be applied to a section&#39;s configuration.

| Name | Number | Description |
| ---- | ------ | ----------- |
| HIDDEN | 0 | This section should not be displayed. |
| FEATURED | 1 | This section should be promoted and/or presented with high priority. |


<a name="products/menu/Menu.proto"></a>

### `Menu.Type`
Holds a full specification for a revision of menu data, segmented into sections, by the categories member products
are filed in. Categories are enumerated in `menu.Section`.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| metadata | [Metadata](#opencannabis.products.menu.Metadata) |  | Metadata for the menu. |
| payload | [SectionedMenu](#opencannabis.products.menu.SectionedMenu) |  | Data payloads attached to this menu. |
| menu | [StaticMenu](#opencannabis.products.menu.StaticMenu) |  | Specifies a static menu, where each section is specified as a typed map, with keys mapped to products. |


<a name="opencannabis.products.menu.MenuProduct"></a>

### `MenuProduct.Type`
Menu product payload stanza. Specifies a single product as a member of a menu section.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [opencannabis.base.ProductKey](#opencannabis.base.ProductKey) |  | Section that this data is attached to. |
| apothecary | [opencannabis.products.Apothecary](#opencannabis.products.Apothecary) |  | Apothecary product. |
| cartridge | [opencannabis.products.Cartridge](#opencannabis.products.Cartridge) |  | Cartridge product. |
| edible | [opencannabis.products.Edible](#opencannabis.products.Edible) |  | Edible product. |
| extract | [opencannabis.products.Extract](#opencannabis.products.Extract) |  | Extract product. |
| flower | [opencannabis.products.Flower](#opencannabis.products.Flower) |  | Flower product. |
| merchandise | [opencannabis.products.Merchandise](#opencannabis.products.Merchandise) |  | Merchandise product. |
| plant | [opencannabis.products.Plant](#opencannabis.products.Plant) |  | Plant product. |
| preroll | [opencannabis.products.Preroll](#opencannabis.products.Preroll) |  | Preroll product. |


<a name="opencannabis.products.menu.MenuSettings"></a>

### `MenuSettings.Type`
Specifies settings used to generate a menu, or used as input when generating menus.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| full | [bool](#bool) |  | Flag indicating a full menu, including hidden/out-of-stock items. |
| keys_only | [bool](#bool) |  | Only include menu keys, no detail data. |
| snapshot | [opencannabis.crypto.primitives.integrity.Hash](#opencannabis.crypto.primitives.integrity.Hash) |  | Don&#39;t return the menu if it&#39;s identical to this fingerprint. |
| fingerprint | [opencannabis.crypto.primitives.integrity.Hash](#opencannabis.crypto.primitives.integrity.Hash) |  | Bloom filter to consider when returning or processing menu items. |
| section | [section.Section](#opencannabis.products.menu.section.Section) | repeated | Sections to include in the menu. If unspecified, include all sections. |


<a name="opencannabis.products.menu.Metadata"></a>

### `Metadata.Type`
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

### `SectionData.Type`
Specifies an inner menu payload which contains menu data for a given menu section.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| count | [int32](#int32) |  | Count of products included in this menu section data. |
| section | [section.SectionSpec](#opencannabis.products.menu.section.SectionSpec) |  | Section that this data is attached to. |
| product | [MenuProduct](#opencannabis.products.menu.MenuProduct) | repeated | Menu products attached to this section. |


<a name="opencannabis.products.menu.SectionedMenu"></a>

### `SectionedMenu.Type`
Specifies a menu split into section-level chunks.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| count | [int32](#int32) |  | Count of all products included in this menu, all sections considered. |
| payload | [SectionData](#opencannabis.products.menu.SectionData) | repeated | Specifies a payload of sectioned menu data. |


<a name="opencannabis.products.menu.StaticMenu"></a>

### `StaticMenu.Type`
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

### `StaticMenu.ApothecaryEntry.Type`

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [opencannabis.products.Apothecary](#opencannabis.products.Apothecary) |  |  |


<a name="opencannabis.products.menu.StaticMenu.CartridgesEntry"></a>

### `StaticMenu.CartridgesEntry.type`

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [opencannabis.products.Cartridge](#opencannabis.products.Cartridge) |  |  |


<a name="opencannabis.products.menu.StaticMenu.EdiblesEntry"></a>

### `StaticMenu.EdiblesEntry.Type`

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [opencannabis.products.Edible](#opencannabis.products.Edible) |  |  |


<a name="opencannabis.products.menu.StaticMenu.ExtractsEntry"></a>

### `StaticMenu.ExtractsEntry.Type`

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [opencannabis.products.Extract](#opencannabis.products.Extract) |  |  |


<a name="opencannabis.products.menu.StaticMenu.FlowersEntry"></a>

### `StaticMenu.FlowersEntry.Type`

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [opencannabis.products.Flower](#opencannabis.products.Flower) |  |  |


<a name="opencannabis.products.menu.StaticMenu.MerchandiseEntry"></a>

### `StaticMenu.MerchandiseEntry.Type`


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [opencannabis.products.Merchandise](#opencannabis.products.Merchandise) |  |  |


<a name="opencannabis.products.menu.StaticMenu.PlantsEntry"></a>

### `StaticMenu.PlantsEntry.Type`

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [opencannabis.products.Plant](#opencannabis.products.Plant) |  |  |


<a name="opencannabis.products.menu.StaticMenu.PrerollsEntry"></a>

### `StaticMenu.PrerollsEntry.Type`

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [opencannabis.products.Preroll](#opencannabis.products.Preroll) |  |  |


<a name="opencannabis.products.menu.Flag"></a>

### `Flag.Number`
Enumerates flags that can be set on a menu.

| Name | Number | Description |
| ---- | ------ | ----------- |
| DRAFT | 0 | Indicates that this entire menu is considered a draft. |
| PRIVATE | 1 | Indicates that the underlying menu data is currently private and should not be exposed publicly. |
| OUT_OF_DATE | 2 | Indicates that the underlying menu data is known to be out-of-date. |


<a name="opencannabis.products.menu.Status"></a>

### `Status.Number`
Enumerates statuses a menu may assume.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNPUBLISHED | 0 | Indicates that a menu revision is not yet published. |
| LIVE | 1 | Indicates that a menu revision has been published and is considered live. |
