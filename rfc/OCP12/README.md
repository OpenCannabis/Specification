---
domain: rfc.ocpx.info
shortname: OCP-12
parent: OCP-03
name: Lab Testing
version: 2.0
status: RAW
package: opencannabis.inventory
editor: Sam Gammon <sg@cookies.co>
sponsors:
- Cookies
- Amuse
- Sweed
- Meadow
- Cova
contributors:
- Sam Gammon <sam.g@cookies.co>
- Luis Madrigal <luis@cookies.co>
---
<a name="top"></a>

# Data Specification: Retail Inventory Pull

![Status: Raw](https://img.shields.io/badge/Status%20%20-Raw-blueviolet)
![Domain: `rfc.ocpx.info`](https://img.shields.io/badge/Domain%20%20-rfc.ocpx.info-gray)
![Code: `OCS-12`](https://img.shields.io/badge/Code%20%20-OCP12-gray)
![Version: `1.0`](https://img.shields.io/badge/Version%20%20-1.0-gray)
![Package: `opencannabis.inventory`](https://img.shields.io/badge/Package%20%20-opencannabis.inventory-gray)


### Status of this Memo

This specification's current status is considered `RAW`, i.e. pre-`DRAFT`. Distribution of this memo is unlimited.


## Background

This note is a draft. It is intended to document anticipated specs for pulling local inventory between a retailer and a brand within the scope of the legal cannabis market.

### Problem Statement

Due to regulatory fragmentation in the cannabis supply chain which is likely to persist for some time, THC-containing inventory must, in most legal cannabis markets, be _transferred_ in terms of both _custody_ and _ownership_ between a distributor and retailer. That is to say, when a _licensed distributor_ hands product to a _licensed retailer_, that product changes ownership hands as well as, well, physical hands. This is a constraint shared by all CPG markets that are said to be regulated as _three-tier markets_.

Because of this ownership change requirement, even when an in-house product is delivered to a _branded_ store, those two organizations are likely communicating through a third which precludes their collaboration toward consistent content and inventory. **This specification attempts to remedy this problem with a simple and capable API between a brand and a retailer which enables the sync of such inventory.**

This "three-tier" path to market can be modeled like this:
```
producer/brand  <-->  distributor  <-->  retailer
```

In that depiction, this service would allow communication like this:
```
producer/brand  <-->  distributor  <-->  retailer
  ^                                        ^
   \------ inventory sync ----------------/
```

### Proposed Solution

```
producer/brand                         retailer POS
  ^                                        |
  |                                        |
   ----------- JSON-REST or gRPC ----------
                         |
          (identifier, on-hand, price)
```

We (Cookies) propose a minimum-viable-interface which satisfies key local product data needs without getting mired in taxonomy differences across POS providers. Specifically, local THC products differ from canonical product content in the following ways:

1) Because ownership changes for a product as it transitions to retail, that new owner may elect to **change the price** of a product (subject to limitations, in some cases), or discount a product in some creative manner

2) Because high-velocity ordering downstream demands inventory allocation, **on-hand inventory counts** are needed, rather than simple up-down inventory state

3) To align with centralized content, a suitable **external identifier** must be exposed back to invoking code, having been inserted at some earlier time, in order to correlate products through the terminal-platform sync

_NOTE:_ Tax rates were considered for this set of values, but many THC cannabis tax rates rely on more than just one line item of visibility, so it is saved for a future note.

This interface is designed as a **pull-style interface** served by the point-of-sale to the producer/brand.

### Mapping tuple values to each POS

Each POS has a different datamodel, from which a lot of complexity arises when trying to implement full sync between cannabis POS systems. However, the following values are _always_ held by the POS, regardless of other content support:

- Number of items you have on hand for a given identifier
- Some external identifier value of _some_ kind, even if it's just a string SKU
- Obviously, a price, and it has to cover tax at some point during the lifecycle of the transaction

These values, for a supporting POS, can be mapped quickly, decoded/validated easily, and remain symbolically meaningful in a technical environment with centralized content.

### Adopters

Cookies is adopting this specification with APIs provided by Meadow, Sweed, and Cova.

