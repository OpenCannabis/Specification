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

<li><code>opencannabis/commerce/Currency.proto</code></li>

<ul>
    <li><a href="#opencannabis.commerce.CurrencyValue"><code>CurrencyValue</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.commerce.CurrencyType"><code>CurrencyType</code></a></li><li><a href="#opencannabis.commerce.FiatCurrency"><code>FiatCurrency</code></a></li>
</ul><br />


<li><code>opencannabis/commerce/Customer.proto</code></li>

<ul>
    <li><a href="#opencannabis.commerce.Customer"><code>Customer</code></a></li>
</ul><br />


<li><code>opencannabis/commerce/Delivery.proto</code></li>

<ul>
    <li><a href="#opencannabis.commerce.DeliveryDestination"><code>DeliveryDestination</code></a></li>
</ul><br />


<li><code>opencannabis/commerce/Discounts.proto</code></li>

<ul>
    <li><a href="#opencannabis.commerce.Discount"><code>Discount</code></a></li><li><a href="#opencannabis.commerce.DiscountSpec"><code>DiscountSpec</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.commerce.DiscountBasis"><code>DiscountBasis</code></a></li><li><a href="#opencannabis.commerce.DiscountType"><code>DiscountType</code></a></li>
</ul><br />


<li><code>opencannabis/commerce/Item.proto</code></li>

<ul>
    <li><a href="#opencannabis.commerce.Item"><code>Item</code></a></li><li><a href="#opencannabis.commerce.VariantSpec"><code>VariantSpec</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.commerce.ProductVariant"><code>ProductVariant</code></a></li>
</ul><br />


<li><code>opencannabis/commerce/Order.proto</code></li>

<ul>
    <li><a href="#opencannabis.commerce.Order"><code>Order</code></a></li><li><a href="#opencannabis.commerce.OrderFulfillment"><code>OrderFulfillment</code></a></li><li><a href="#opencannabis.commerce.OrderKey"><code>OrderKey</code></a></li><li><a href="#opencannabis.commerce.OrderPayment"><code>OrderPayment</code></a></li><li><a href="#opencannabis.commerce.OrderScheduling"><code>OrderScheduling</code></a></li><li><a href="#opencannabis.commerce.OrderSource"><code>OrderSource</code></a></li><li><a href="#opencannabis.commerce.OrderStats"><code>OrderStats</code></a></li><li><a href="#opencannabis.commerce.StatusCheckin"><code>StatusCheckin</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.commerce.OrderStatus"><code>OrderStatus</code></a></li><li><a href="#opencannabis.commerce.OrderType"><code>OrderType</code></a></li><li><a href="#opencannabis.commerce.SchedulingType"><code>SchedulingType</code></a></li>
</ul><br />


<li><code>opencannabis/commerce/Payment.proto</code></li>

<ul>
    <li><a href="#opencannabis.commerce.BillStatus"><code>BillStatus</code></a></li><li><a href="#opencannabis.commerce.DigitalPaymentNetwork"><code>DigitalPaymentNetwork</code></a></li><li><a href="#opencannabis.commerce.PaymentCardType"><code>PaymentCardType</code></a></li><li><a href="#opencannabis.commerce.PaymentMethod"><code>PaymentMethod</code></a></li><li><a href="#opencannabis.commerce.PaymentStatus"><code>PaymentStatus</code></a></li>
</ul><br />


<li><code>opencannabis/commerce/Purchase.proto</code></li>

<ul>
    <li><a href="#opencannabis.commerce.BillOfCharges"><code>BillOfCharges</code></a></li><li><a href="#opencannabis.commerce.Payment"><code>Payment</code></a></li><li><a href="#opencannabis.commerce.Payment.BankPayment"><code>Payment.BankPayment</code></a></li><li><a href="#opencannabis.commerce.Payment.CardPayment"><code>Payment.CardPayment</code></a></li><li><a href="#opencannabis.commerce.Payment.CashPayment"><code>Payment.CashPayment</code></a></li><li><a href="#opencannabis.commerce.Payment.CheckPayment"><code>Payment.CheckPayment</code></a></li><li><a href="#opencannabis.commerce.Payment.DigitalPayment"><code>Payment.DigitalPayment</code></a></li><li><a href="#opencannabis.commerce.PaymentKey"><code>PaymentKey</code></a></li><li><a href="#opencannabis.commerce.PurchaseCustomer"><code>PurchaseCustomer</code></a></li><li><a href="#opencannabis.commerce.PurchaseFacilitator"><code>PurchaseFacilitator</code></a></li><li><a href="#opencannabis.commerce.PurchaseKey"><code>PurchaseKey</code></a></li><li><a href="#opencannabis.commerce.PurchaseLogEntry"><code>PurchaseLogEntry</code></a></li><li><a href="#opencannabis.commerce.PurchaseSignature"><code>PurchaseSignature</code></a></li><li><a href="#opencannabis.commerce.PurchaseTimestamps"><code>PurchaseTimestamps</code></a></li><li><a href="#opencannabis.commerce.TicketItem"><code>TicketItem</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.commerce.PurchaseAuthority"><code>PurchaseAuthority</code></a></li><li><a href="#opencannabis.commerce.PurchaseEvent"><code>PurchaseEvent</code></a></li><li><a href="#opencannabis.commerce.PurchaseStatus"><code>PurchaseStatus</code></a></li>
</ul><br />


</ul>




_________________



<a name="opencannabis/commerce/Currency.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/commerce/Currency.proto`

Currency-related enumerations and models that allow easy specification of cash amounts.

To import this module:

```proto
import "opencannabis/commerce/Currency.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.commerce`     |
| **Bazel Target** | `//opencannabis.commerce`   |
|                  |                    |



<a name="opencannabis.commerce.CurrencyValue"></a>

### Message: <code>CurrencyValue</code> (`opencannabis.commerce.CurrencyValue`)

Specifies a value, with a particular currency specification as the unit.

```proto
import "opencannabis/commerce/Currency.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.CurrencyValue field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `value` | [`float`](#float) | *None.* | Numeric amount value to specify. |
| `type` | [`CurrencyType`](#opencannabis.commerce.CurrencyType) | *None.* | Categorical or general type for the specified currency. |
| `fiat` | [`FiatCurrency`](#opencannabis.commerce.FiatCurrency) | *None.* | Fiat currency selection for a given currency value. |
| `custom` | [`string`](#string) | *None.* | Custom currency, by name or symbol, for a given currency value. |






<!-- end messages -->


<a name="opencannabis.commerce.CurrencyType"></a>

### Enumeration: <code>CurrencyType</code> (`opencannabis.commerce.CurrencyType`)

Specifies known or explicitly supported currency types.

```proto
import "opencannabis/commerce/Currency.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.commerce.CurrencyType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `FIAT` | `0` | Fiat-based currency, such as the US Dollar. |
| `REAL` | `1` | Real currency, such as gold or other raw materials. |
| `CRYPTO` | `2` | Crypto-currency, based on unique cryptographic signatures or proof-of-work. |



<a name="opencannabis.commerce.FiatCurrency"></a>

### Enumeration: <code>FiatCurrency</code> (`opencannabis.commerce.FiatCurrency`)

Specifies known or explicitly supported fiat currencies.

```proto
import "opencannabis/commerce/Currency.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.commerce.FiatCurrency enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `USD` | `0` | Specifies 'US Dollar' as a currency. |
| `CAD` | `1` | Specifies 'Canadian Dollar' as a currency. |
| `EUR` | `2` | Specifies 'Euro' as a currency. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/commerce/Customer.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/commerce/Customer.proto`

Specifies the notion of a 'customer,' which is a person who is completing a purchase transaction, has completed a
purchase transaction in the past, or intends to commit a purchase transaction in the future.

To import this module:

```proto
import "opencannabis/commerce/Customer.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.commerce`     |
| **Bazel Target** | `//opencannabis.commerce`   |
|                  |                    |



<a name="opencannabis.commerce.Customer"></a>

### Message: <code>Customer</code> (`opencannabis.commerce.Customer`)

Customer identity.

```proto
import "opencannabis/commerce/Customer.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.Customer field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `person` | [`opencannabis.person.Person`](#opencannabis.person.Person) | *None.* | Person attached to this customer. |
| `foreign_id` | [`string`](#string) | *None.* | Partner-scoped foreign system ID. |
| `user_key` | [`string`](#string) | *None.* | Resolved subject user key. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/commerce/Delivery.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/commerce/Delivery.proto`

Delivery-specific ordering messages and enumerations, where an order is physically brought to a requesting customer's
location, rather than held at a fixed location for pickup.

To import this module:

```proto
import "opencannabis/commerce/Delivery.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.commerce`     |
| **Bazel Target** | `//opencannabis.commerce`   |
|                  |                    |



<a name="opencannabis.commerce.DeliveryDestination"></a>

### Message: <code>DeliveryDestination</code> (`opencannabis.commerce.DeliveryDestination`)

Specifies the location to deliver the order.

```proto
import "opencannabis/commerce/Delivery.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.DeliveryDestination field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `address` | [`opencannabis.geo.Address`](#opencannabis.geo.Address) | *None.* | Location/address to send a delivery order. |
| `instructions` | [`string`](#string) | *None.* | Special delivery instructions |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/commerce/Discounts.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/commerce/Discounts.proto`

Discounts on pricing and products, and enumerations specifying discount types or bases.

To import this module:

```proto
import "opencannabis/commerce/Discounts.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.commerce`     |
| **Bazel Target** | `//opencannabis.commerce`   |
|                  |                    |



<a name="opencannabis.commerce.Discount"></a>

### Message: <code>Discount</code> (`opencannabis.commerce.Discount`)

Specifies a discount to be applied during a purchase or order.

```proto
import "opencannabis/commerce/Discounts.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.Discount field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `id` | [`string`](#string) | *None.* | ID code for this discount entry. |
| `spec` | [`DiscountSpec`](#opencannabis.commerce.DiscountSpec) | *None.* | Specification for how this discount behaves. |
| `name` | [`string`](#string) | *None.* | Back-office name for this tax. |
| `label` | [`string`](#string) | *None.* | User-visible name for this tax. |
| `description` | [`string`](#string) | *None.* | Narrative description for this discount, to be displayed to back-office and end-users in some special circumstances. |
| `modified_at` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Last time this discount was modified. |
| `created_at` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | When this discount was created. |







<a name="opencannabis.commerce.DiscountSpec"></a>

### Message: <code>DiscountSpec</code> (`opencannabis.commerce.DiscountSpec`)

Specifies the concept of a discount, and how it is set to behave.

```proto
import "opencannabis/commerce/Discounts.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.DiscountSpec field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `type` | [`DiscountType`](#opencannabis.commerce.DiscountType) | *None.* | Type of discount to apply. |
| `basis` | [`DiscountBasis`](#opencannabis.commerce.DiscountBasis) | *None.* | Basis to form when calculating the discount. |
| `percentage` | [`double`](#double) | *None.* | Percentage rate for the discount. |
| `static_value` | [`double`](#double) | *None.* | Flat rate for the discount. |






<!-- end messages -->


<a name="opencannabis.commerce.DiscountBasis"></a>

### Enumeration: <code>DiscountBasis</code> (`opencannabis.commerce.DiscountBasis`)

Enumerates operational calculation modes for discounts.

```proto
import "opencannabis/commerce/Discounts.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.commerce.DiscountBasis enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `ITEM` | `0` | The discount is calculated per-item. |
| `ORDER_SUBTOTAL` | `1` | The discount is calculated from the order subtotal, before tax. |
| `ORDER_TOTAL` | `2` | The discount is calculated from the order total, after tax. |



<a name="opencannabis.commerce.DiscountType"></a>

### Enumeration: <code>DiscountType</code> (`opencannabis.commerce.DiscountType`)

Enumerates types of discounts that may be applied.

```proto
import "opencannabis/commerce/Discounts.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.commerce.DiscountType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `CUSTOM` | `0` | Some custom discount applied at the time of purchase. |
| `STATUTORY` | `1` | Statutorily-mandated discount, for instance, for medical-only patients. |
| `COMMERCIAL` | `2` | Commercial discount, for instance, for vendors, brand ambassadors, and staff. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/commerce/Item.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/commerce/Item.proto`

Specifies the notion of an 'Order Item,' which is a product requested as part of a commercial order. An order item
references a product on a partner's active menu, by key, along with a count representing the number of instances of
that product that are desired for purchase.

To import this module:

```proto
import "opencannabis/commerce/Item.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.commerce`     |
| **Bazel Target** | `//opencannabis.commerce`   |
|                  |                    |



<a name="opencannabis.commerce.Item"></a>

### Message: <code>Item</code> (`opencannabis.commerce.Item`)

Specifies the Item via the product key as well as weight, and count of product ordered

```proto
import "opencannabis/commerce/Item.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.Item field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `key` | [`opencannabis.base.ProductKey`](#opencannabis.base.ProductKey) | *None.* | Key for the item, which is the type and ID, combined. |
| `variant` | [`VariantSpec`](#opencannabis.commerce.VariantSpec) | repeated | Variance specifications for this item. |
| `count` | [`uint32`](#uint32) | *None.* | Count of this item requested. |
| `uri` | [`string`](#string) | *None.* | Detail/link URL for this item. |
| `image_uri` | [`string`](#string) | *None.* | Image URL for this item. |







<a name="opencannabis.commerce.VariantSpec"></a>

### Message: <code>VariantSpec</code> (`opencannabis.commerce.VariantSpec`)

Specifies if it is a weighted product or a unit priced product and attaches that to item.

```proto
import "opencannabis/commerce/Item.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.VariantSpec field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `variant` | [`ProductVariant`](#opencannabis.commerce.ProductVariant) | *None.* | Specifies the variance type for this spec. |
| `weight` | [`opencannabis.structs.pricing.PricingWeightTier`](#opencannabis.structs.pricing.PricingWeightTier) | *None.* | Specifies a product weight, when varying by weight. |
| `size` | [`string`](#string) | *None.* | Specifies a size option for the product. |
| `color` | [`string`](#string) | *None.* | Specifies a color option for the product. |






<!-- end messages -->


<a name="opencannabis.commerce.ProductVariant"></a>

### Enumeration: <code>ProductVariant</code> (`opencannabis.commerce.ProductVariant`)

Specifies weight and price of  ordered product

```proto
import "opencannabis/commerce/Item.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.commerce.ProductVariant enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `WEIGHT` | `0` | Variance by product weight. |
| `COLOR` | `1` | Variance by product color. |
| `SIZE` | `2` | Variance by product size. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/commerce/Order.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/commerce/Order.proto`

Specifies the notion of a Commercial Order, which is a request to purchase a set of products, by a customer (which is
defined as a person in a transactional context). Orders are composed of Items which reference menu products.

To import this module:

```proto
import "opencannabis/commerce/Order.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.commerce`     |
| **Bazel Target** | `//opencannabis.commerce`   |
|                  |                    |



<a name="opencannabis.commerce.Order"></a>

### Message: <code>Order</code> (`opencannabis.commerce.Order`)

Represents a full order submitted to the server for fulfillment, from an end-user, for delivery or express pickup.

```proto
import "opencannabis/commerce/Order.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.Order field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `id` | [`string`](#string) | *None.* | ID assigned to the order by the server, and potentially nominated by the client. |
| `type` | [`OrderType`](#opencannabis.commerce.OrderType) | *None.* | Type of order requested: `PICKUP`, `DELIVERY` or `ONSITE`. |
| `status` | [`OrderStatus`](#opencannabis.commerce.OrderStatus) | *None.* | Current status of this order. |
| `customer` | [`Customer`](#opencannabis.commerce.Customer) | *None.* | Customer that submitted this order. |
| `scheduling` | [`OrderScheduling`](#opencannabis.commerce.OrderScheduling) | *None.* | Scheduling spec for this order. |
| `destination` | [`DeliveryDestination`](#opencannabis.commerce.DeliveryDestination) | *None.* | Location for delivery, if applicable. |
| `notes` | [`string`](#string) | *None.* | User-provided notes or questions, if any. |
| `item` | [`Item`](#opencannabis.commerce.Item) | repeated | Items being ordered. |
| `action_log` | [`StatusCheckin`](#opencannabis.commerce.StatusCheckin) | repeated | Actions taken on this order. |
| `subtotal` | [`double`](#double) | *None.* | Order subtotal. |
| `sid` | [`string`](#string) | *None.* | Session ID that was active when this order was submitted. |
| `payment` | [`OrderPayment`](#opencannabis.commerce.OrderPayment) | *None.* | Payment information/metadata for this order, if applicable. |
| `source` | [`OrderSource`](#opencannabis.commerce.OrderSource) | *None.* | Details about where this order came from. |
| `fulfillment` | [`OrderFulfillment`](#opencannabis.commerce.OrderFulfillment) | *None.* | Details about the fulfillment partner assigned to this order, as applicable. |
| `stats` | [`OrderStats`](#opencannabis.commerce.OrderStats) | *None.* | General stats and rolled up values associated with this order. Available during analysis. |
| `created_at` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | When this order was created. |
| `updated_at` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | When this order was last updated. |







<a name="opencannabis.commerce.OrderFulfillment"></a>

### Message: <code>OrderFulfillment</code> (`opencannabis.commerce.OrderFulfillment`)

Describes information regarding a retail cannabis order's fulfillment. This may include the fulfillment partner info,
as applicable, or additional coordinative or logistical information.

```proto
import "opencannabis/commerce/Order.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.OrderFulfillment field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `partner` | [`opencannabis.partner.PartnerKey`](#opencannabis.partner.PartnerKey) | *None.* | Partner key-level reference for this fulfillment partner. |
| `location` | [`opencannabis.partner.LocationKey`](#opencannabis.partner.LocationKey) | *None.* | Location key-level reference for this fulfillment partner. |







<a name="opencannabis.commerce.OrderKey"></a>

### Message: <code>OrderKey</code> (`opencannabis.commerce.OrderKey`)

Specifies a unique key for a commercial order.

```proto
import "opencannabis/commerce/Order.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.OrderKey field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `id` | [`string`](#string) | *None.* | Order ID, assigned by the server upon creation. |
| `foreign_id` | [`string`](#string) | *None.* | Foreign order ID. Assigned by external systems (as applicable). |
| `fulfillment_id` | [`string`](#string) | *None.* | Extra ID for use in fulfillment systems. If delivery or pickup systems have their own ID, it can be filled in here while preserving the `foreign_id` as the point-of-sale order ID. |
| `pipeline_id` | [`string`](#string) | *None.* | ID assigned to the order during data processing. This is mainly meant for disambiguation across systems. |







<a name="opencannabis.commerce.OrderPayment"></a>

### Message: <code>OrderPayment</code> (`opencannabis.commerce.OrderPayment`)

Information about payment status and info for an order.

```proto
import "opencannabis/commerce/Order.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.OrderPayment field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `status` | [`PaymentStatus`](#opencannabis.commerce.PaymentStatus) | *None.* | Status of payment for this order. |
| `method` | [`PaymentMethod`](#opencannabis.commerce.PaymentMethod) | *None.* | Method of payment used on this order. |
| `tax` | [`double`](#double) | *None.* | Amount of tax added to the subtotal. |
| `paid` | [`double`](#double) | *None.* | Amount the user has paid so far for this order. |







<a name="opencannabis.commerce.OrderScheduling"></a>

### Message: <code>OrderScheduling</code> (`opencannabis.commerce.OrderScheduling`)

Specifies the desired timing of the delivery order.

```proto
import "opencannabis/commerce/Order.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.OrderScheduling field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `scheduling` | [`SchedulingType`](#opencannabis.commerce.SchedulingType) | *None.* | Scheduling type, either 'ASAP' or a target time. |
| `desired_time` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Desired delivery time, if specified. |







<a name="opencannabis.commerce.OrderSource"></a>

### Message: <code>OrderSource</code> (`opencannabis.commerce.OrderSource`)

Describes information about the source of an order, including whether it came from a digital or physical property,
and the system the order was pulled from, as applicable.

```proto
import "opencannabis/commerce/Order.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.OrderSource field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `system` | [`string`](#string) | *None.* | System from which this order originates, as applicable. |
| `location_id` | [`string`](#string) | *None.* | Internal location ID corresponding to the retail store or property that fulfilled or received this order. |
| `foreign_id` | [`string`](#string) | *None.* | Foreign ID in 2nd- or 3rd-party systems referring to the location that received this order. |
| `partner` | [`opencannabis.partner.PartnerKey`](#opencannabis.partner.PartnerKey) | *None.* | Partner key-level reference for the originating location. |
| `location` | [`opencannabis.partner.LocationKey`](#opencannabis.partner.LocationKey) | *None.* | Location key-level reference for the originating location. |







<a name="opencannabis.commerce.OrderStats"></a>

### Message: <code>OrderStats</code> (`opencannabis.commerce.OrderStats`)

Holds aggregated values generated to describe an order and its constituent line items.

```proto
import "opencannabis/commerce/Order.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.OrderStats field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `order_key` | [`OrderKey`](#opencannabis.commerce.OrderKey) | *None.* | Key corresponding to this order. Enclosed when this stats payload is not affixed to the subject order. |
| `total_cash` | [`double`](#double) | *None.* | Order total cash amount. |
| `total_tax` | [`double`](#double) | *None.* | Order total tax amount. |
| `total_cost` | [`double`](#double) | *None.* | Order total cost amount, when known. This amount is typically just `sum([item_cost * quantity] for item)`. |
| `total_profit` | [`double`](#double) | *None.* | Order total profit amount, when known. This amount typically equals `(total_cash - total_tax) - total_cost`. |
| `quantity` | [`uint32`](#uint32) | *None.* | Total quantity of items purchased across all order line items. |
| `discount` | [`double`](#double) | *None.* | Total discount amount applied to this order, across all line items and order discounts. |
| `categories` | [`opencannabis.base.ProductKind`](#opencannabis.base.ProductKind) | repeated | Set of unique categories present in this order, across all line items. |
| `unique_categories` | [`uint32`](#uint32) | *None.* | Count of unique categories present in this order, across all line items. |
| `unique_products` | [`uint32`](#uint32) | *None.* | Count of unique products present in this order, across all line items. |
| `largest_category` | [`opencannabis.base.ProductKind`](#opencannabis.base.ProductKind) | *None.* | Largest category present in the line-items constituting this order, by revenue. |
| `largest_sku` | [`string`](#string) | *None.* | Largest individual SKU present in the line-items constituting this order, by revenue. |
| `largest_price` | [`double`](#double) | *None.* | Largest individual price paid for an item across the line-items constituting this order. |







<a name="opencannabis.commerce.StatusCheckin"></a>

### Message: <code>StatusCheckin</code> (`opencannabis.commerce.StatusCheckin`)

Specifies a moment at which an order changed status, when it happened, and, optionally, why.

```proto
import "opencannabis/commerce/Order.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.StatusCheckin field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `status` | [`OrderStatus`](#opencannabis.commerce.OrderStatus) | *None.* | Status the order moved to. |
| `instant` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Instant the order was moved to this status. |
| `message` | [`string`](#string) | *None.* | Message or reason given for this status change, if any. |






<!-- end messages -->


<a name="opencannabis.commerce.OrderStatus"></a>

### Enumeration: <code>OrderStatus</code> (`opencannabis.commerce.OrderStatus`)

Enumeration for current status of order

```proto
import "opencannabis/commerce/Order.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.commerce.OrderStatus enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `PENDING` | `0` | Order has been submitted and is not yet approved. |
| `APPROVED` | `1` | Order has been approved for fulfillment. |
| `REJECTED` | `2` | Order could not be fulfilled for some reason. |
| `ASSIGNED` | `3` | Order has been assigned. |
| `EN_ROUTE` | `4` | Order is en-route to the user (for delivery). |
| `FULFILLED` | `5` | Order has been fulfilled and is considered complete. |



<a name="opencannabis.commerce.OrderType"></a>

### Enumeration: <code>OrderType</code> (`opencannabis.commerce.OrderType`)

Specifies the type of order requested.

```proto
import "opencannabis/commerce/Order.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.commerce.OrderType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `PICKUP` | `0` | Express pickup order. |
| `DELIVERY` | `1` | Delivery order. |
| `ONSITE` | `2` | Order submitted on-site at a retail location. |



<a name="opencannabis.commerce.SchedulingType"></a>

### Enumeration: <code>SchedulingType</code> (`opencannabis.commerce.SchedulingType`)

Specifies the types of delivery timing.

```proto
import "opencannabis/commerce/Order.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.commerce.SchedulingType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `ASAP` | `0` | As soon as possible. |
| `TIMED` | `1` | Desired time. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/commerce/Payment.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/commerce/Payment.proto`

Specifies structures and enumerates related to payments, payment information, and so on.

To import this module:

```proto
import "opencannabis/commerce/Payment.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.commerce`     |
| **Bazel Target** | `//opencannabis.commerce`   |
|                  |                    |


<!-- end messages -->


<a name="opencannabis.commerce.BillStatus"></a>

### Enumeration: <code>BillStatus</code> (`opencannabis.commerce.BillStatus`)

Enumeration for payment status of an order.

```proto
import "opencannabis/commerce/Payment.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.commerce.BillStatus enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `SUSPENSE` | `0` | The bill has not been paid, partially or in full. |
| `PARTIAL` | `3` | The user has paid partially for this order. |
| `SETTLED` | `4` | The user has settled payment for this order in full. |



<a name="opencannabis.commerce.DigitalPaymentNetwork"></a>

### Enumeration: <code>DigitalPaymentNetwork</code> (`opencannabis.commerce.DigitalPaymentNetwork`)

Enumerates types of digital payment networks.

```proto
import "opencannabis/commerce/Payment.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.commerce.DigitalPaymentNetwork enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNSPECIFIED_NETWORK` | `0` | Unspecified or unrecognized digital payment network. |
| `PAYPAL` | `1` | Paypal. |
| `VENMO` | `2` | Venmo. |
| `SQUARE` | `3` | Square or Square Cash. |



<a name="opencannabis.commerce.PaymentCardType"></a>

### Enumeration: <code>PaymentCardType</code> (`opencannabis.commerce.PaymentCardType`)

Enumerates recognized payment methods.

```proto
import "opencannabis/commerce/Payment.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.commerce.PaymentCardType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `NO_CARD_TYPE` | `0` | Payment card type is not applicable. |
| `VISA` | `1` | Visa. |
| `MASTERCARD` | `2` | Mastercard. |
| `DISCOVER` | `3` | Discover. |
| `AMEX` | `4` | American Express. |
| `DINERS_CLUB` | `5` | Diners' Club. |
| `MAESTRO` | `6` | Maestro. |



<a name="opencannabis.commerce.PaymentMethod"></a>

### Enumeration: <code>PaymentMethod</code> (`opencannabis.commerce.PaymentMethod`)

Enumerates recognized payment methods.

```proto
import "opencannabis/commerce/Payment.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.commerce.PaymentMethod enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `CASH` | `0` | Fiat or real-value cash currency. |
| `CHECK` | `1` | Payment by check. |
| `DEBIT` | `2` | Debit card payment. |
| `CREDIT` | `3` | Credit card payment. |
| `DIGITAL` | `4` | Digital payment via something like Paypal or Venmo. |
| `ACH` | `5` | Bank account-based payment. |
| `WIRE` | `6` | Payment by wire transfer. |
| `BLOCKCHAIN` | `7` | Payment via Bitcoin or some other blockchain. |



<a name="opencannabis.commerce.PaymentStatus"></a>

### Enumeration: <code>PaymentStatus</code> (`opencannabis.commerce.PaymentStatus`)

Enumeration for status of an individual payment portion.

```proto
import "opencannabis/commerce/Payment.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.commerce.PaymentStatus enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `NOT_APPLICABLE` | `0` | Payment information is not applicable to this order. |
| `WAITING` | `1` | Charge is pending fulfillment. |
| `PREAUTHORIZED` | `2` | The user's card has been pre-authorized, pending fulfillment. |
| `BOUNCED` | `3` | Payment for this order did not go through. |
| `RETRIED` | `4` | Payment for this order did not go through, and was retried. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/commerce/Purchase.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/commerce/Purchase.proto`

Specifies the notion of a Commercial Purchase, which is the upgraded version of a
Commercial Order. Purchases always take place in-person.

To import this module:

```proto
import "opencannabis/commerce/Purchase.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.commerce`     |
| **Bazel Target** | `//opencannabis.commerce`   |
|                  |                    |



<a name="opencannabis.commerce.BillOfCharges"></a>

### Message: <code>BillOfCharges</code> (`opencannabis.commerce.BillOfCharges`)

Specifies a bill of charges for a given purchase ticket or line item.

```proto
import "opencannabis/commerce/Purchase.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.BillOfCharges field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `status` | [`BillStatus`](#opencannabis.commerce.BillStatus) | *None.* | Settlement status for this bill. I.e, whether it has been paid for partially, in full, or not at all. |
| `tax` | [`opencannabis.taxes.Tax`](#opencannabis.taxes.Tax) | repeated | Tax entries applied to this item or ticket. |
| `discount` | [`Discount`](#opencannabis.commerce.Discount) | repeated | Discount entries applied to this item or ticket. |
| `price` | [`double`](#double) | *None.* | Price paid for this item or transaction at the time of purchase. |
| `taxes` | [`double`](#double) | *None.* | Computed tax amount for this receipt line-item or purchase ticket. |
| `discounts` | [`double`](#double) | *None.* | Computed discount amount for this receipt line-item or purchase ticket. |
| `subtotal` | [`double`](#double) | *None.* | Computed item or ticket subtotal amount (equal to count times price less discounts). |
| `total` | [`double`](#double) | *None.* | Computed item or ticket total amount (equal to subtotal plus taxes). |







<a name="opencannabis.commerce.Payment"></a>

### Message: <code>Payment</code> (`opencannabis.commerce.Payment`)

Specifies the style, amount, and parameters regarding how this purchase was paid for.

```proto
import "opencannabis/commerce/Purchase.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.Payment field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `key` | [`PaymentKey`](#opencannabis.commerce.PaymentKey) | *None.* | Unique key provisioned to address this payment, if applicable. |
| `method` | [`PaymentMethod`](#opencannabis.commerce.PaymentMethod) | *None.* | Method of payment used by the customer. |
| `status` | [`PaymentStatus`](#opencannabis.commerce.PaymentStatus) | *None.* | Status for this payment. |
| `amount` | [`double`](#double) | *None.* | Amount for this payment. |
| `full` | [`bool`](#bool) | *None.* | Whether this fully satisfies the order, or not. |
| `cash` | [`Payment.CashPayment`](#opencannabis.commerce.Payment.CashPayment) | *None.* | Payment made with hard cash. |
| `check` | [`Payment.CheckPayment`](#opencannabis.commerce.Payment.CheckPayment) | *None.* | Payment made by check. |
| `card` | [`Payment.CardPayment`](#opencannabis.commerce.Payment.CardPayment) | *None.* | Payment made by debit or credit card. |
| `bank` | [`Payment.BankPayment`](#opencannabis.commerce.Payment.BankPayment) | *None.* | Payment made by bank transfer. |
| `digital` | [`Payment.DigitalPayment`](#opencannabis.commerce.Payment.DigitalPayment) | *None.* | Payment made via digital payment networks. |







<a name="opencannabis.commerce.Payment.BankPayment"></a>

### Message: <code>Payment.BankPayment</code> (`opencannabis.commerce.Payment.BankPayment`)

Bank-based payment made as part of a greater purchase payment set.

```proto
import "opencannabis/commerce/Purchase.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.Payment.BankPayment field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `routing_number` | [`string`](#string) | *None.* | Routing number for the bank account to pay with. |
| `account_number` | [`string`](#string) | *None.* | Account number for the bank to pay with. |
| `reference` | [`string`](#string) | *None.* | Reference code or ID for the transaction. |







<a name="opencannabis.commerce.Payment.CardPayment"></a>

### Message: <code>Payment.CardPayment</code> (`opencannabis.commerce.Payment.CardPayment`)

Card-based payment made as part of a greater purchase payment set.

```proto
import "opencannabis/commerce/Purchase.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.Payment.CardPayment field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `card_type` | [`PaymentCardType`](#opencannabis.commerce.PaymentCardType) | *None.* | Card type used by the customer to pay. |







<a name="opencannabis.commerce.Payment.CashPayment"></a>

### Message: <code>Payment.CashPayment</code> (`opencannabis.commerce.Payment.CashPayment`)

Specifies details regarding a cash payment.

```proto
import "opencannabis/commerce/Purchase.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.Payment.CashPayment field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `tendered` | [`CurrencyValue`](#opencannabis.commerce.CurrencyValue) | *None.* | The amount of cash tendered by the customer for payment. |
| `change` | [`CurrencyValue`](#opencannabis.commerce.CurrencyValue) | *None.* | The amount of change given back to the customer after payment. |







<a name="opencannabis.commerce.Payment.CheckPayment"></a>

### Message: <code>Payment.CheckPayment</code> (`opencannabis.commerce.Payment.CheckPayment`)

Check payment made as part of a greater purchase payment set.

```proto
import "opencannabis/commerce/Purchase.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.Payment.CheckPayment field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `check_number` | [`string`](#string) | *None.* | Sequence number from the check for payment. |
| `routing_number` | [`string`](#string) | *None.* | Routing number from the check for payment. Private and encrypted. |
| `account_number` | [`string`](#string) | *None.* | Account number from the check for payment. Private and encrypted. |
| `institution` | [`string`](#string) | *None.* | Name of the bank or issuing institution. Required if the check is certified. |
| `certified` | [`bool`](#bool) | *None.* | Whether the check is certified or not. Certified checks are issued by institutions, usually banks. |







<a name="opencannabis.commerce.Payment.DigitalPayment"></a>

### Message: <code>Payment.DigitalPayment</code> (`opencannabis.commerce.Payment.DigitalPayment`)

Digital payment made as part of a greater purchase payment set.

```proto
import "opencannabis/commerce/Purchase.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.Payment.DigitalPayment field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `network` | [`DigitalPaymentNetwork`](#opencannabis.commerce.DigitalPaymentNetwork) | *None.* | Digital payment network used by the customer. |
| `username` | [`string`](#string) | *None.* | Username on the digital payment network. |
| `reference` | [`string`](#string) | *None.* | Reference code or ID for the transaction. |







<a name="opencannabis.commerce.PaymentKey"></a>

### Message: <code>PaymentKey</code> (`opencannabis.commerce.PaymentKey`)

Specifies the structure of an individual payment's key.

```proto
import "opencannabis/commerce/Purchase.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.PaymentKey field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `uuid` | [`string`](#string) | *None.* | Unique ID provisioned for this payment. |







<a name="opencannabis.commerce.PurchaseCustomer"></a>

### Message: <code>PurchaseCustomer</code> (`opencannabis.commerce.PurchaseCustomer`)

Specifies combined information regarding the customer who made a particular purchase. This includes their digitally
identifying information, their legal identification, and the authority under which the purchase occurred.

```proto
import "opencannabis/commerce/Purchase.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.PurchaseCustomer field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `unique_id` | [`string`](#string) | *None.* | Unique and opaque ID, representing this customer's accounting of interactions. |
| `signature` | [`PurchaseSignature`](#opencannabis.commerce.PurchaseSignature) | *None.* | Digital signature provided by the customer, if applicable and supported. |







<a name="opencannabis.commerce.PurchaseFacilitator"></a>

### Message: <code>PurchaseFacilitator</code> (`opencannabis.commerce.PurchaseFacilitator`)

Specifies information about the facilitator of a retail/commercial purchase, i.e., the retailer's side of a retail
transaction with a consumer or patient.

```proto
import "opencannabis/commerce/Purchase.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.PurchaseFacilitator field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `authority` | [`PurchaseAuthority`](#opencannabis.commerce.PurchaseAuthority) | *None.* | Specifies the authority under which this purchase occurred, if applicable (i.e. medical, vs. adult-use/recreational cannabis purchases, depending on jurisdiction). |
| `agent` | [`string`](#string) | *None.* | Specifies the opaque ID for the user that conducted the purchase (i.e. the sales agent or budtender). |
| `device` | [`string`](#string) | *None.* | Unique/opaque reference to the partner co-located point-of-sale device that facilitated this transaction. |
| `signature` | [`PurchaseSignature`](#opencannabis.commerce.PurchaseSignature) | *None.* | Digital signature provided by the facilitator, if applicable and supported. |







<a name="opencannabis.commerce.PurchaseKey"></a>

### Message: <code>PurchaseKey</code> (`opencannabis.commerce.PurchaseKey`)

Specifies a key that uniquely addresses a purchase made by a consumer.

```proto
import "opencannabis/commerce/Purchase.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.PurchaseKey field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `uuid` | [`string`](#string) | *None.* | String UUID generated to address this purchase. Generally allocated client-side. |







<a name="opencannabis.commerce.PurchaseLogEntry"></a>

### Message: <code>PurchaseLogEntry</code> (`opencannabis.commerce.PurchaseLogEntry`)

Specifies an event that takes place against a Purchase.

```proto
import "opencannabis/commerce/Purchase.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.PurchaseLogEntry field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `status` | [`PurchaseStatus`](#opencannabis.commerce.PurchaseStatus) | *None.* | Status the order moved to. |
| `event` | [`PurchaseEvent`](#opencannabis.commerce.PurchaseEvent) | *None.* |  |
| `instant` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Instant the order was moved to this status. |
| `sku` | [`string`](#string) | *None.* | Stock-Keeping-Unit that was related to this purchase event, if applicable. |
| `message` | [`string`](#string) | *None.* | Message or reason given for this status change, if any. |







<a name="opencannabis.commerce.PurchaseSignature"></a>

### Message: <code>PurchaseSignature</code> (`opencannabis.commerce.PurchaseSignature`)

Specifies a cryptographic signature attached to a commercial/retail purchase.

```proto
import "opencannabis/commerce/Purchase.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.PurchaseSignature field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `nonce` | [`string`](#string) | *None.* | Verification number allocated for this transaction from a device under the customer's control. |
| `facilitator` | [`opencannabis.crypto.Signature`](#opencannabis.crypto.Signature) | *None.* | Cryptographic signature issued by the point-of-sale device for this transaction. |
| `customer` | [`opencannabis.crypto.Signature`](#opencannabis.crypto.Signature) | *None.* | Cryptographic signature issued by the customer for this transaction. |







<a name="opencannabis.commerce.PurchaseTimestamps"></a>

### Message: <code>PurchaseTimestamps</code> (`opencannabis.commerce.PurchaseTimestamps`)

Specifies a set of timestamps recorded for each purchase.

```proto
import "opencannabis/commerce/Purchase.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.PurchaseTimestamps field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `established` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Timestamp for when a particular purchase was first allocated. |
| `created` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Timestamp for when a particular purchase was first saved. |
| `modified` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Timestamp for when a particular purchase was last modified. |
| `executed` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Timestamp for when a purchase was conducted and paid for. |
| `finalized` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Timestamp for when a purchase was finalized after any post-purchase edits. |







<a name="opencannabis.commerce.TicketItem"></a>

### Message: <code>TicketItem</code> (`opencannabis.commerce.TicketItem`)

Specifies an individual item purchased as part of a larger commercial purchase ticket, including any variance values
required to fully specify the item.

```proto
import "opencannabis/commerce/Purchase.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.commerce.TicketItem field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `key` | [`opencannabis.inventory.InventoryKey`](#opencannabis.inventory.InventoryKey) | *None.* | Key specifying the address of a specific inventory item. |
| `sku` | [`string`](#string) | *None.* | Stock-Keeping-Unit that was scanned as part of this item being onboarded onto a commercial purchase ticket. |
| `item` | [`Item`](#opencannabis.commerce.Item) | *None.* | Specifies the commercial item |
| `line` | [`BillOfCharges`](#opencannabis.commerce.BillOfCharges) | *None.* | Line-item bill of charges, or purchase sums. Includes taxes and discounts. |






<!-- end messages -->


<a name="opencannabis.commerce.PurchaseAuthority"></a>

### Enumeration: <code>PurchaseAuthority</code> (`opencannabis.commerce.PurchaseAuthority`)

Specifies the authority under which a particular purchase occurs.

```proto
import "opencannabis/commerce/Purchase.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.commerce.PurchaseAuthority enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `STANDARD` | `0` | Standard or unspecified authority. |
| `MEDICAL` | `1` | Medical cannabis authority. |
| `ADULT_USE` | `2` | Adult-use, or recreational, cannabis authority. |



<a name="opencannabis.commerce.PurchaseEvent"></a>

### Enumeration: <code>PurchaseEvent</code> (`opencannabis.commerce.PurchaseEvent`)

Specifies a purchase event logged as part of a greater purchase transaction.

```proto
import "opencannabis/commerce/Purchase.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.commerce.PurchaseEvent enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `STATUS` | `0` | The status of the ticket changed. |
| `SAVE` | `1` | The purchase was saved to the cloud for later use. |
| `LOAD` | `2` | The purchase was loaded from the cloud. |
| `ITEM_ADDED` | `10` | An item was added to the ticket. |
| `ITEM_REMOVED` | `11` | An item was entirely removed from the ticket. |
| `ITEM_QUANTITY_CHANGED` | `12` | An item's desired quantity was changed. |
| `ITEM_DISCOUNT_ADDED` | `13` | A discount was added to a ticket item. |
| `ITEM_DISCOUNT_REMOVED` | `14` | A discount was removed from a ticket item. |
| `PURCHASE_VOID` | `20` | The purchase was voided entirely. |
| `PURCHASE_FINALIZE` | `21` | The purchase was completed and finalized. |



<a name="opencannabis.commerce.PurchaseStatus"></a>

### Enumeration: <code>PurchaseStatus</code> (`opencannabis.commerce.PurchaseStatus`)

Enumerates statuses that a purchase transaction may take.

```proto
import "opencannabis/commerce/Purchase.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.commerce.PurchaseStatus enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `FRESH` | `0` | The purchase has been allocated and has not yet begun filling with data. |
| `OPEN` | `1` | The purchase is actively being collaborated on. |
| `CLOSED` | `2` | The purchase is saved and closed for later recall. |
| `VOIDED` | `3` | The purchase was cancelled. This status is terminal. |
| `FINALIZED` | `4` | The purchase was completed and is now closed. This status prevents edits. |
| `RECONCILED` | `5` | The purchase record has been reconciled with accounting systems. This status is terminal. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
