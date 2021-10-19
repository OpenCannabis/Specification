---
domain: rfc.ocpx.info
shortname: OCP-12
parent: OCP-03
name: Lab Testing
version: 2.0
status: RAW
package: opencannabis.commerce
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

# Data Specification: Retail Order Push

![Status: Raw](https://img.shields.io/badge/Status%20%20-Raw-blueviolet)
![Domain: `rfc.ocpx.info`](https://img.shields.io/badge/Domain%20%20-rfc.ocpx.info-gray)
![Code: `OCS-13`](https://img.shields.io/badge/Code%20%20-OCP13-gray)
![Version: `1.0`](https://img.shields.io/badge/Version%20%20-1.0-gray)
![Package: `opencannabis.commerce.v1`](https://img.shields.io/badge/Package%20%20-opencannabis.commerce.v1-gray)


### Status of this Memo

This specification's current status is considered `RAW`, i.e. pre-`DRAFT`. Distribution of this memo is unlimited.


## Background

This note is a draft. It is intended to document anticipated specs related to delivery of online cannabis orders between brands and fulfillment partners for pickup or delivery of THC products.

### Problem Statement

Business that engages in legal cannabis activity must generally be _licensed_. Licensure in the cannabis space is typically drawn along supply chain roles; in other words, the activities of the business, as they relate to cannabis, are governed by the license(s) it holds.

Distribution, retail (storefront/non-storefront), and production of cannabis products are common supply chain roles that state legislators use for regulatory boundaries. Thus, when a retail order is received for pickup or delivery by a _brand_, it must traverse organization boundaries to be fulfilled by a licensed _retailer_.

This path for ordering could be visualized like this:
```
customer --submits order--> brand --sends order--> fulfillment partner
```

The service proposed herein would enable communication from the _brand_ to the _fulfillment partner_, and back again with status information, to facilitate fulfillment of the order.

### Proposed Solution

We (Cookies) propose a minimum-viable-interface which satisfies key needs in two areas: (1) delivery of the order to the fulfillment partner with enough resolution to adjust and fulfill the order, as applicable, and (2) reporting of relevant status events back to the invoking producer or brand:

#### Step 1: _Pushing the order_
```
brand --sends order--> fulfillment partner
```

This step facilitates the initialization of fulfillment processes at the fulfillment partner's end.

Order push payload **MUST**:
- Enclose IDs universal to the sending partner, made available at an earlier time through a centralized PIM, _or_

- Enclose line-item product IDs known to exist on the fulfillment partner's end via other means (i.e. manual dashboards, imports, data entry, and so forth)

Order push payload **SHOULD**:
- Enclose sufficient customer information to communicate with the customer for the purpose of adjusting or cancelling the order, should inventory be out of stock or otherwise unavailable, _or_

Order push payload **MAY**:
- Enclose a customer ID reference known to exist on the fulfillment partner's end via other means (i.e. manual dashboards, imports, data entry, and so forth)


#### Step 2: _Reporting order status_
```
fulfillment partner --sends updates--> brand
```

This step facilitates communicable order status, order acknowledgement/confirmation, and order cancellation.

Order status reporting **MUST**:
- Make an initial report to the originating organization to _acknowledge_ receipt of the order
- Report cancellation of orders
- Report events for each major status change relevant to the customer (order pending, order in progress, order out for delivery, order complete)

Order status reporting **SHOULD**:
- Return the customer ID created or allocated for the order, if applicable
- Report adjustments of orders

Order status reporting **MAY**:
- Report stale orders

### Adopters

Cookies is adopting this specification (once finalized), with Amuse, Sweed, and Cova.

