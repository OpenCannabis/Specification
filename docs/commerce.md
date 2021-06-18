# Protocol Documentation
<a name="top"></a>

---
Module: `module`
Package: `opencannabis.module`
Domain: rfc.opencannabis.info
---


## Reference Documentation

- [opencannabis/commerce/Currency.proto](#opencannabis/commerce/Currency.proto)
  - [CurrencyValue](#opencannabis.commerce.CurrencyValue)

  - [CurrencyType](#opencannabis.commerce.CurrencyType)
  - [FiatCurrency](#opencannabis.commerce.FiatCurrency)

- [opencannabis/commerce/Customer.proto](#opencannabis/commerce/Customer.proto)
  - [Customer](#opencannabis.commerce.Customer)

- [opencannabis/commerce/Delivery.proto](#opencannabis/commerce/Delivery.proto)
  - [DeliveryDestination](#opencannabis.commerce.DeliveryDestination)

- [opencannabis/commerce/Discounts.proto](#opencannabis/commerce/Discounts.proto)
  - [Discount](#opencannabis.commerce.Discount)
  - [DiscountSpec](#opencannabis.commerce.DiscountSpec)

  - [DiscountBasis](#opencannabis.commerce.DiscountBasis)
  - [DiscountType](#opencannabis.commerce.DiscountType)

- [opencannabis/commerce/Item.proto](#opencannabis/commerce/Item.proto)
  - [Item](#opencannabis.commerce.Item)
  - [VariantSpec](#opencannabis.commerce.VariantSpec)

  - [ProductVariant](#opencannabis.commerce.ProductVariant)

- [opencannabis/commerce/Order.proto](#opencannabis/commerce/Order.proto)
  - [Order](#opencannabis.commerce.Order)
  - [OrderFulfillment](#opencannabis.commerce.OrderFulfillment)
  - [OrderKey](#opencannabis.commerce.OrderKey)
  - [OrderPayment](#opencannabis.commerce.OrderPayment)
  - [OrderScheduling](#opencannabis.commerce.OrderScheduling)
  - [OrderSource](#opencannabis.commerce.OrderSource)
  - [OrderStats](#opencannabis.commerce.OrderStats)
  - [StatusCheckin](#opencannabis.commerce.StatusCheckin)

  - [OrderStatus](#opencannabis.commerce.OrderStatus)
  - [OrderType](#opencannabis.commerce.OrderType)
  - [SchedulingType](#opencannabis.commerce.SchedulingType)

- [opencannabis/commerce/Purchase.proto](#opencannabis/commerce/Purchase.proto)
  - [BillOfCharges](#opencannabis.commerce.BillOfCharges)
  - [Payment](#opencannabis.commerce.Payment)
  - [Payment.BankPayment](#opencannabis.commerce.Payment.BankPayment)
  - [Payment.CardPayment](#opencannabis.commerce.Payment.CardPayment)
  - [Payment.CashPayment](#opencannabis.commerce.Payment.CashPayment)
  - [Payment.CheckPayment](#opencannabis.commerce.Payment.CheckPayment)
  - [Payment.DigitalPayment](#opencannabis.commerce.Payment.DigitalPayment)
  - [PaymentKey](#opencannabis.commerce.PaymentKey)
  - [PurchaseCustomer](#opencannabis.commerce.PurchaseCustomer)
  - [PurchaseFacilitator](#opencannabis.commerce.PurchaseFacilitator)
  - [PurchaseKey](#opencannabis.commerce.PurchaseKey)
  - [PurchaseLogEntry](#opencannabis.commerce.PurchaseLogEntry)
  - [PurchaseSignature](#opencannabis.commerce.PurchaseSignature)
  - [PurchaseTimestamps](#opencannabis.commerce.PurchaseTimestamps)
  - [TicketItem](#opencannabis.commerce.TicketItem)

  - [PurchaseAuthority](#opencannabis.commerce.PurchaseAuthority)
  - [PurchaseEvent](#opencannabis.commerce.PurchaseEvent)
  - [PurchaseStatus](#opencannabis.commerce.PurchaseStatus)





<a name="opencannabis/commerce/Currency.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/commerce/Currency.proto
Currency-related enumerations and models that allow easy specification of cash amounts.


<a name="opencannabis.commerce.CurrencyValue"></a>

### CurrencyValue
Specifies a value, with a particular currency specification as the unit.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| value | [float](#float) |  | Numeric amount value to specify. |
| type | [CurrencyType](#opencannabis.commerce.CurrencyType) |  | Categorical or general type for the specified currency. |
| fiat | [FiatCurrency](#opencannabis.commerce.FiatCurrency) |  | Fiat currency selection for a given currency value. |
| custom | [string](#string) |  | Custom currency, by name or symbol, for a given currency value. |





<!-- end messages -->


<a name="opencannabis.commerce.CurrencyType"></a>

### CurrencyType
Specifies known or explicitly supported currency types.

| Name | Number | Description |
| ---- | ------ | ----------- |
| FIAT | 0 | Fiat-based currency, such as the US Dollar. |
| REAL | 1 | Real currency, such as gold or other raw materials. |
| CRYPTO | 2 | Crypto-currency, based on unique cryptographic signatures or proof-of-work. |



<a name="opencannabis.commerce.FiatCurrency"></a>

### FiatCurrency
Specifies known or explicitly supported fiat currencies.

| Name | Number | Description |
| ---- | ------ | ----------- |
| USD | 0 | Specifies 'US Dollar' as a currency. |
| CAD | 1 | Specifies 'Canadian Dollar' as a currency. |
| EUR | 2 | Specifies 'Euro' as a currency. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/commerce/Customer.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/commerce/Customer.proto
Specifies the notion of a 'customer,' which is a person who is completing a purchase transaction, has completed a
purchase transaction in the past, or intends to commit a purchase transaction in the future.


<a name="opencannabis.commerce.Customer"></a>

### Customer
Customer identity.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| person | [opencannabis.person.Person](#opencannabis.person.Person) |  | Person attached to this customer. |
| foreign_id | [string](#string) |  | Partner-scoped foreign system ID. |
| user_key | [string](#string) |  | Resolved subject user key. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/commerce/Delivery.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/commerce/Delivery.proto
Delivery-specific ordering messages and enumerations, where an order is physically brought to a requesting customer's
location, rather than held at a fixed location for pickup.


<a name="opencannabis.commerce.DeliveryDestination"></a>

### DeliveryDestination
Specifies the location to deliver the order.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| address | [opencannabis.geo.Address](#opencannabis.geo.Address) |  | Location/address to send a delivery order. |
| instructions | [string](#string) |  | Special delivery instructions |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/commerce/Discounts.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/commerce/Discounts.proto
Discounts on pricing and products, and enumerations specifying discount types or bases.


<a name="opencannabis.commerce.Discount"></a>

### Discount
Specifies a discount to be applied during a purchase or order.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | ID code for this discount entry. |
| spec | [DiscountSpec](#opencannabis.commerce.DiscountSpec) |  | Specification for how this discount behaves. |
| name | [string](#string) |  | Back-office name for this tax. |
| label | [string](#string) |  | User-visible name for this tax. |
| description | [string](#string) |  | Narrative description for this discount, to be displayed to back-office and end-users in some special circumstances. |
| modified_at | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | Last time this discount was modified. |
| created_at | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | When this discount was created. |






<a name="opencannabis.commerce.DiscountSpec"></a>

### DiscountSpec
Specifies the concept of a discount, and how it is set to behave.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [DiscountType](#opencannabis.commerce.DiscountType) |  | Type of discount to apply. |
| basis | [DiscountBasis](#opencannabis.commerce.DiscountBasis) |  | Basis to form when calculating the discount. |
| percentage | [double](#double) |  | Percentage rate for the discount. |
| static_value | [double](#double) |  | Flat rate for the discount. |





<!-- end messages -->


<a name="opencannabis.commerce.DiscountBasis"></a>

### DiscountBasis
Enumerates operational calculation modes for discounts.

| Name | Number | Description |
| ---- | ------ | ----------- |
| ITEM | 0 | The discount is calculated per-item. |
| ORDER_SUBTOTAL | 1 | The discount is calculated from the order subtotal, before tax. |
| ORDER_TOTAL | 2 | The discount is calculated from the order total, after tax. |



<a name="opencannabis.commerce.DiscountType"></a>

### DiscountType
Enumerates types of discounts that may be applied.

| Name | Number | Description |
| ---- | ------ | ----------- |
| CUSTOM | 0 | Some custom discount applied at the time of purchase. |
| STATUTORY | 1 | Statutorily-mandated discount, for instance, for medical-only patients. |
| COMMERCIAL | 2 | Commercial discount, for instance, for vendors, brand ambassadors, and staff. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/commerce/Item.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/commerce/Item.proto
Specifies the notion of an 'Order Item,' which is a product requested as part of a commercial order. An order item
references a product on a partner's active menu, by key, along with a count representing the number of instances of
that product that are desired for purchase.


<a name="opencannabis.commerce.Item"></a>

### Item
Specifies the Item via the product key as well as weight, and count of product ordered


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [opencannabis.base.ProductKey](#opencannabis.base.ProductKey) |  | Key for the item, which is the type and ID, combined. |
| variant | [VariantSpec](#opencannabis.commerce.VariantSpec) | repeated | Variance specifications for this item. |
| count | [uint32](#uint32) |  | Count of this item requested. |
| uri | [string](#string) |  | Detail/link URL for this item. |
| image_uri | [string](#string) |  | Image URL for this item. |






<a name="opencannabis.commerce.VariantSpec"></a>

### VariantSpec
Specifies if it is a weighted product or a unit priced product and attaches that to item.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| variant | [ProductVariant](#opencannabis.commerce.ProductVariant) |  | Specifies the variance type for this spec. |
| weight | [opencannabis.structs.pricing.PricingWeightTier](#opencannabis.structs.pricing.PricingWeightTier) |  | Specifies a product weight, when varying by weight. |
| size | [string](#string) |  | Specifies a size option for the product. |
| color | [string](#string) |  | Specifies a color option for the product. |





<!-- end messages -->


<a name="opencannabis.commerce.ProductVariant"></a>

### ProductVariant
Specifies weight and price of  ordered product

| Name | Number | Description |
| ---- | ------ | ----------- |
| WEIGHT | 0 | Variance by product weight. |
| COLOR | 1 | Variance by product color. |
| SIZE | 2 | Variance by product size. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/commerce/Order.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/commerce/Order.proto
Specifies the notion of a Commercial Order, which is a request to purchase a set of products, by a customer (which is
defined as a person in a transactional context). Orders are composed of Items which reference menu products.


<a name="opencannabis.commerce.Order"></a>

### Order
Represents a full order submitted to the server for fulfillment, from an end-user, for delivery or express pickup.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | ID assigned to the order by the server, and potentially nominated by the client. |
| type | [OrderType](#opencannabis.commerce.OrderType) |  | Type of order requested: `PICKUP`, `DELIVERY` or `ONSITE`. |
| status | [OrderStatus](#opencannabis.commerce.OrderStatus) |  | Current status of this order. |
| customer | [Customer](#opencannabis.commerce.Customer) |  | Customer that submitted this order. |
| scheduling | [OrderScheduling](#opencannabis.commerce.OrderScheduling) |  | Scheduling spec for this order. |
| destination | [DeliveryDestination](#opencannabis.commerce.DeliveryDestination) |  | Location for delivery, if applicable. |
| notes | [string](#string) |  | User-provided notes or questions, if any. |
| item | [Item](#opencannabis.commerce.Item) | repeated | Items being ordered. |
| action_log | [StatusCheckin](#opencannabis.commerce.StatusCheckin) | repeated | Actions taken on this order. |
| subtotal | [double](#double) |  | Order subtotal. |
| sid | [string](#string) |  | Session ID that was active when this order was submitted. |
| payment | [OrderPayment](#opencannabis.commerce.OrderPayment) |  | Payment information/metadata for this order, if applicable. |
| source | [OrderSource](#opencannabis.commerce.OrderSource) |  | Details about where this order came from. |
| fulfillment | [OrderFulfillment](#opencannabis.commerce.OrderFulfillment) |  | Details about the fulfillment partner assigned to this order, as applicable. |
| stats | [OrderStats](#opencannabis.commerce.OrderStats) |  | General stats and rolled up values associated with this order. Available during analysis. |
| created_at | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | When this order was created. |
| updated_at | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | When this order was last updated. |






<a name="opencannabis.commerce.OrderFulfillment"></a>

### OrderFulfillment
Describes information regarding a retail cannabis order's fulfillment. This may include the fulfillment partner info,
as applicable, or additional coordinative or logistical information.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| partner | [opencannabis.partner.PartnerKey](#opencannabis.partner.PartnerKey) |  | Partner key-level reference for this fulfillment partner. |
| location | [opencannabis.partner.LocationKey](#opencannabis.partner.LocationKey) |  | Location key-level reference for this fulfillment partner. |






<a name="opencannabis.commerce.OrderKey"></a>

### OrderKey
Specifies a unique key for a commercial order.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | Order ID, assigned by the server upon creation. |
| foreign_id | [string](#string) |  | Foreign order ID. Assigned by external systems (as applicable). |
| fulfillment_id | [string](#string) |  | Extra ID for use in fulfillment systems. If delivery or pickup systems have their own ID, it can be filled in here while preserving the `foreign_id` as the point-of-sale order ID. |
| pipeline_id | [string](#string) |  | ID assigned to the order during data processing. This is mainly meant for disambiguation across systems. |






<a name="opencannabis.commerce.OrderPayment"></a>

### OrderPayment
Information about payment status and info for an order.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [PaymentStatus](#opencannabis.commerce.PaymentStatus) |  | Status of payment for this order. |
| method | [PaymentMethod](#opencannabis.commerce.PaymentMethod) |  | Method of payment used on this order. |
| tax | [double](#double) |  | Amount of tax added to the subtotal. |
| paid | [double](#double) |  | Amount the user has paid so far for this order. |






<a name="opencannabis.commerce.OrderScheduling"></a>

### OrderScheduling
Specifies the desired timing of the delivery order.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| scheduling | [SchedulingType](#opencannabis.commerce.SchedulingType) |  | Scheduling type, either 'ASAP' or a target time. |
| desired_time | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | Desired delivery time, if specified. |






<a name="opencannabis.commerce.OrderSource"></a>

### OrderSource
Describes information about the source of an order, including whether it came from a digital or physical property,
and the system the order was pulled from, as applicable.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| system | [string](#string) |  | System from which this order originates, as applicable. |
| location_id | [string](#string) |  | Internal location ID corresponding to the retail store or property that fulfilled or received this order. |
| foreign_id | [string](#string) |  | Foreign ID in 2nd- or 3rd-party systems referring to the location that received this order. |
| partner | [opencannabis.partner.PartnerKey](#opencannabis.partner.PartnerKey) |  | Partner key-level reference for the originating location. |
| location | [opencannabis.partner.LocationKey](#opencannabis.partner.LocationKey) |  | Location key-level reference for the originating location. |






<a name="opencannabis.commerce.OrderStats"></a>

### OrderStats
Holds aggregated values generated to describe an order and its constituent line items.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| order_key | [OrderKey](#opencannabis.commerce.OrderKey) |  | Key corresponding to this order. Enclosed when this stats payload is not affixed to the subject order. |
| total_cash | [double](#double) |  | Order total cash amount. |
| total_tax | [double](#double) |  | Order total tax amount. |
| total_cost | [double](#double) |  | Order total cost amount, when known. This amount is typically just `sum([item_cost * quantity] for item)`. |
| total_profit | [double](#double) |  | Order total profit amount, when known. This amount typically equals `(total_cash - total_tax) - total_cost`. |
| quantity | [uint32](#uint32) |  | Total quantity of items purchased across all order line items. |
| discount | [double](#double) |  | Total discount amount applied to this order, across all line items and order discounts. |
| categories | [opencannabis.base.ProductKind](#opencannabis.base.ProductKind) | repeated | Set of unique categories present in this order, across all line items. |
| unique_categories | [uint32](#uint32) |  | Count of unique categories present in this order, across all line items. |
| unique_products | [uint32](#uint32) |  | Count of unique products present in this order, across all line items. |
| largest_category | [opencannabis.base.ProductKind](#opencannabis.base.ProductKind) |  | Largest category present in the line-items constituting this order, by revenue. |
| largest_sku | [string](#string) |  | Largest individual SKU present in the line-items constituting this order, by revenue. |
| largest_price | [double](#double) |  | Largest individual price paid for an item across the line-items constituting this order. |






<a name="opencannabis.commerce.StatusCheckin"></a>

### StatusCheckin
Specifies a moment at which an order changed status, when it happened, and, optionally, why.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [OrderStatus](#opencannabis.commerce.OrderStatus) |  | Status the order moved to. |
| instant | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | Instant the order was moved to this status. |
| message | [string](#string) |  | Message or reason given for this status change, if any. |





<!-- end messages -->


<a name="opencannabis.commerce.OrderStatus"></a>

### OrderStatus
Enumeration for current status of order

| Name | Number | Description |
| ---- | ------ | ----------- |
| PENDING | 0 | Order has been submitted and is not yet approved. |
| APPROVED | 1 | Order has been approved for fulfillment. |
| REJECTED | 2 | Order could not be fulfilled for some reason. |
| ASSIGNED | 3 | Order has been assigned. |
| EN_ROUTE | 4 | Order is en-route to the user (for delivery). |
| FULFILLED | 5 | Order has been fulfilled and is considered complete. |



<a name="opencannabis.commerce.OrderType"></a>

### OrderType
Specifies the type of order requested.

| Name | Number | Description |
| ---- | ------ | ----------- |
| PICKUP | 0 | Express pickup order. |
| DELIVERY | 1 | Delivery order. |
| ONSITE | 2 | Order submitted on-site at a retail location. |



<a name="opencannabis.commerce.SchedulingType"></a>

### SchedulingType
Specifies the types of delivery timing.

| Name | Number | Description |
| ---- | ------ | ----------- |
| ASAP | 0 | As soon as possible. |
| TIMED | 1 | Desired time. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/commerce/Purchase.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/commerce/Purchase.proto
Specifies the notion of a Commercial Purchase, which is the upgraded version of a
Commercial Order. Purchases always take place in-person.


<a name="opencannabis.commerce.BillOfCharges"></a>

### BillOfCharges
Specifies a bill of charges for a given purchase ticket or line item.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [BillStatus](#opencannabis.commerce.BillStatus) |  | Settlement status for this bill. I.e, whether it has been paid for partially, in full, or not at all. |
| tax | [opencannabis.taxes.Tax](#opencannabis.taxes.Tax) | repeated | Tax entries applied to this item or ticket. |
| discount | [Discount](#opencannabis.commerce.Discount) | repeated | Discount entries applied to this item or ticket. |
| price | [double](#double) |  | Price paid for this item or transaction at the time of purchase. |
| taxes | [double](#double) |  | Computed tax amount for this receipt line-item or purchase ticket. |
| discounts | [double](#double) |  | Computed discount amount for this receipt line-item or purchase ticket. |
| subtotal | [double](#double) |  | Computed item or ticket subtotal amount (equal to count times price less discounts). |
| total | [double](#double) |  | Computed item or ticket total amount (equal to subtotal plus taxes). |






<a name="opencannabis.commerce.Payment"></a>

### Payment
Specifies the style, amount, and parameters regarding how this purchase was paid for.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [PaymentKey](#opencannabis.commerce.PaymentKey) |  | Unique key provisioned to address this payment, if applicable. |
| method | [PaymentMethod](#opencannabis.commerce.PaymentMethod) |  | Method of payment used by the customer. |
| status | [PaymentStatus](#opencannabis.commerce.PaymentStatus) |  | Status for this payment. |
| amount | [double](#double) |  | Amount for this payment. |
| full | [bool](#bool) |  | Whether this fully satisfies the order, or not. |
| cash | [Payment.CashPayment](#opencannabis.commerce.Payment.CashPayment) |  | Payment made with hard cash. |
| check | [Payment.CheckPayment](#opencannabis.commerce.Payment.CheckPayment) |  | Payment made by check. |
| card | [Payment.CardPayment](#opencannabis.commerce.Payment.CardPayment) |  | Payment made by debit or credit card. |
| bank | [Payment.BankPayment](#opencannabis.commerce.Payment.BankPayment) |  | Payment made by bank transfer. |
| digital | [Payment.DigitalPayment](#opencannabis.commerce.Payment.DigitalPayment) |  | Payment made via digital payment networks. |






<a name="opencannabis.commerce.Payment.BankPayment"></a>

### Payment.BankPayment
Bank-based payment made as part of a greater purchase payment set.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| routing_number | [string](#string) |  | Routing number for the bank account to pay with. |
| account_number | [string](#string) |  | Account number for the bank to pay with. |
| reference | [string](#string) |  | Reference code or ID for the transaction. |






<a name="opencannabis.commerce.Payment.CardPayment"></a>

### Payment.CardPayment
Card-based payment made as part of a greater purchase payment set.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| card_type | [PaymentCardType](#opencannabis.commerce.PaymentCardType) |  | Card type used by the customer to pay. |






<a name="opencannabis.commerce.Payment.CashPayment"></a>

### Payment.CashPayment
Specifies details regarding a cash payment.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| tendered | [CurrencyValue](#opencannabis.commerce.CurrencyValue) |  | The amount of cash tendered by the customer for payment. |
| change | [CurrencyValue](#opencannabis.commerce.CurrencyValue) |  | The amount of change given back to the customer after payment. |






<a name="opencannabis.commerce.Payment.CheckPayment"></a>

### Payment.CheckPayment
Check payment made as part of a greater purchase payment set.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| check_number | [string](#string) |  | Sequence number from the check for payment. |
| routing_number | [string](#string) |  | Routing number from the check for payment. Private and encrypted. |
| account_number | [string](#string) |  | Account number from the check for payment. Private and encrypted. |
| institution | [string](#string) |  | Name of the bank or issuing institution. Required if the check is certified. |
| certified | [bool](#bool) |  | Whether the check is certified or not. Certified checks are issued by institutions, usually banks. |






<a name="opencannabis.commerce.Payment.DigitalPayment"></a>

### Payment.DigitalPayment
Digital payment made as part of a greater purchase payment set.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| network | [DigitalPaymentNetwork](#opencannabis.commerce.DigitalPaymentNetwork) |  | Digital payment network used by the customer. |
| username | [string](#string) |  | Username on the digital payment network. |
| reference | [string](#string) |  | Reference code or ID for the transaction. |






<a name="opencannabis.commerce.PaymentKey"></a>

### PaymentKey
Specifies the structure of an individual payment's key.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| uuid | [string](#string) |  | Unique ID provisioned for this payment. |






<a name="opencannabis.commerce.PurchaseCustomer"></a>

### PurchaseCustomer
Specifies combined information regarding the customer who made a particular purchase. This includes their digitally
identifying information, their legal identification, and the authority under which the purchase occurred.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| unique_id | [string](#string) |  | Unique and opaque ID, representing this customer's accounting of interactions. |
| signature | [PurchaseSignature](#opencannabis.commerce.PurchaseSignature) |  | Digital signature provided by the customer, if applicable and supported. |






<a name="opencannabis.commerce.PurchaseFacilitator"></a>

### PurchaseFacilitator
Specifies information about the facilitator of a retail/commercial purchase, i.e., the retailer's side of a retail
transaction with a consumer or patient.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| authority | [PurchaseAuthority](#opencannabis.commerce.PurchaseAuthority) |  | Specifies the authority under which this purchase occurred, if applicable (i.e. medical, vs. adult-use/recreational cannabis purchases, depending on jurisdiction). |
| agent | [string](#string) |  | Specifies the opaque ID for the user that conducted the purchase (i.e. the sales agent or budtender). |
| device | [string](#string) |  | Unique/opaque reference to the partner co-located point-of-sale device that facilitated this transaction. |
| signature | [PurchaseSignature](#opencannabis.commerce.PurchaseSignature) |  | Digital signature provided by the facilitator, if applicable and supported. |






<a name="opencannabis.commerce.PurchaseKey"></a>

### PurchaseKey
Specifies a key that uniquely addresses a purchase made by a consumer.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| uuid | [string](#string) |  | String UUID generated to address this purchase. Generally allocated client-side. |






<a name="opencannabis.commerce.PurchaseLogEntry"></a>

### PurchaseLogEntry
Specifies an event that takes place against a Purchase.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [PurchaseStatus](#opencannabis.commerce.PurchaseStatus) |  | Status the order moved to. |
| event | [PurchaseEvent](#opencannabis.commerce.PurchaseEvent) |  |  |
| instant | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | Instant the order was moved to this status. |
| sku | [string](#string) |  | Stock-Keeping-Unit that was related to this purchase event, if applicable. |
| message | [string](#string) |  | Message or reason given for this status change, if any. |






<a name="opencannabis.commerce.PurchaseSignature"></a>

### PurchaseSignature
Specifies a cryptographic signature attached to a commercial/retail purchase.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| nonce | [string](#string) |  | Verification number allocated for this transaction from a device under the customer's control. |
| facilitator | [opencannabis.crypto.Signature](#opencannabis.crypto.Signature) |  | Cryptographic signature issued by the point-of-sale device for this transaction. |
| customer | [opencannabis.crypto.Signature](#opencannabis.crypto.Signature) |  | Cryptographic signature issued by the customer for this transaction. |






<a name="opencannabis.commerce.PurchaseTimestamps"></a>

### PurchaseTimestamps
Specifies a set of timestamps recorded for each purchase.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| established | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | Timestamp for when a particular purchase was first allocated. |
| created | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | Timestamp for when a particular purchase was first saved. |
| modified | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | Timestamp for when a particular purchase was last modified. |
| executed | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | Timestamp for when a purchase was conducted and paid for. |
| finalized | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | Timestamp for when a purchase was finalized after any post-purchase edits. |






<a name="opencannabis.commerce.TicketItem"></a>

### TicketItem
Specifies an individual item purchased as part of a larger commercial purchase ticket, including any variance values
required to fully specify the item.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [opencannabis.inventory.InventoryKey](#opencannabis.inventory.InventoryKey) |  | Key specifying the address of a specific inventory item. |
| sku | [string](#string) |  | Stock-Keeping-Unit that was scanned as part of this item being onboarded onto a commercial purchase ticket. |
| item | [Item](#opencannabis.commerce.Item) |  | Specifies the commercial item |
| line | [BillOfCharges](#opencannabis.commerce.BillOfCharges) |  | Line-item bill of charges, or purchase sums. Includes taxes and discounts. |





<!-- end messages -->


<a name="opencannabis.commerce.PurchaseAuthority"></a>

### PurchaseAuthority
Specifies the authority under which a particular purchase occurs.

| Name | Number | Description |
| ---- | ------ | ----------- |
| STANDARD | 0 | Standard or unspecified authority. |
| MEDICAL | 1 | Medical cannabis authority. |
| ADULT_USE | 2 | Adult-use, or recreational, cannabis authority. |



<a name="opencannabis.commerce.PurchaseEvent"></a>

### PurchaseEvent
Specifies a purchase event logged as part of a greater purchase transaction.

| Name | Number | Description |
| ---- | ------ | ----------- |
| STATUS | 0 | The status of the ticket changed. |
| SAVE | 1 | The purchase was saved to the cloud for later use. |
| LOAD | 2 | The purchase was loaded from the cloud. |
| ITEM_ADDED | 10 | An item was added to the ticket. |
| ITEM_REMOVED | 11 | An item was entirely removed from the ticket. |
| ITEM_QUANTITY_CHANGED | 12 | An item's desired quantity was changed. |
| ITEM_DISCOUNT_ADDED | 13 | A discount was added to a ticket item. |
| ITEM_DISCOUNT_REMOVED | 14 | A discount was removed from a ticket item. |
| PURCHASE_VOID | 20 | The purchase was voided entirely. |
| PURCHASE_FINALIZE | 21 | The purchase was completed and finalized. |



<a name="opencannabis.commerce.PurchaseStatus"></a>

### PurchaseStatus
Enumerates statuses that a purchase transaction may take.

| Name | Number | Description |
| ---- | ------ | ----------- |
| FRESH | 0 | The purchase has been allocated and has not yet begun filling with data. |
| OPEN | 1 | The purchase is actively being collaborated on. |
| CLOSED | 2 | The purchase is saved and closed for later recall. |
| VOIDED | 3 | The purchase was cancelled. This status is terminal. |
| FINALIZED | 4 | The purchase was completed and is now closed. This status prevents edits. |
| RECONCILED | 5 | The purchase record has been reconciled with accounting systems. This status is terminal. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
