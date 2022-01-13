# Core Structures: Protocol Documentation
<a name="#top"></a>

_"Core structures"_ refer to messages and definitions that are included in the main _OpenCannabis Specification_, rather
than a _Specification Extension_, and are defined herein, as part of _Part 1.1_.

Definitions provided by _Extensions_ to the main specification are enumerated
separately in [Part 1.2, Extension Structures](4-Extension-Structures.md).

## Table of Contents

- `base`: Foundational structures used across the spec.
    - [Compression](#opencannabis.base.Compression)
    - [Compression.Type](#opencannabis.base.Compression.Type)
    - [ProductKind](#opencannabis.base.ProductKind)
    - [Language](#opencannabis.base.Language)
    - [ProductKey](#opencannabis.base.ProductKey)
    - [ProductReference](#opencannabis.base.ProductReference)
- `temporal`: Dates, times, and so on.
    - [Date](#opencannabis.temporal.Date)
    - [Instant](#opencannabis.temporal.Instant)
    - [Time](#opencannabis.temporal.Time)
- `crypto`: Cryptographic primitives and containers.
    - [Hash](#opencannabis.crypto.primitives.integrity.Hash)
    - [HashedData](#opencannabis.crypto.primitives.integrity.HashedData)
    - [HashAlgorithm](#opencannabis.crypto.primitives.integrity.HashAlgorithm)
- `geo`: Structures relating to geography.
    - [Country](#opencannabis.geo.Country)
    - [Point](#opencannabis.geo.Point)
    - [Province](#opencannabis.geo.Province)
    - [Distance](#opencannabis.geo.Distance)
    - [DistanceValue](#opencannabis.geo.DistanceValue)
    - [Location](#opencannabis.geo.Location)
    - [LocationAccuracy](#opencannabis.geo.LocationAccuracy)
    - [DistanceUnit](#opencannabis.geo.DistanceUnit)
    - [Address](#opencannabis.geo.Address)
    - [USState](#opencannabis.geo.usa.USState)
- `device`: Managed and anonymous, operating systems, browsers.
    - [Device](#opencannabis.device.Device)
    - [DeviceCredentials](#opencannabis.device.DeviceCredentials)
    - [DeviceFlags](#opencannabis.device.DeviceFlags)
    - [DeviceType](#opencannabis.device.DeviceType)
- `content`: Narrative and marketing content.
    - [Name](#opencannabis.content.Name)
    - [Content](#opencannabis.content.Content)
    - [Content.Encoding](#opencannabis.content.Content.Encoding)
    - [Content.Type](#opencannabis.content.Content.Type)
    - [MaterialsData](#opencannabis.content.MaterialsData)
    - [Brand](#opencannabis.content.Brand)
    - [ProductContent](#opencannabis.content.ProductContent)
    - [ProductTimestamps](#opencannabis.content.ProductTimestamps)
- `person`: People, names, birth dates, and so on.
    - [Name](#opencannabis.person.Name)
    - [Person](#opencannabis.person.Person)
- `contact`: Email, phone, and postal addresses.
    - [PhoneNumber](#opencannabis.contact.PhoneNumber)
    - [ContactInfo](#opencannabis.contact.ContactInfo)
    - [EmailAddress](#opencannabis.contact.EmailAddress)
    - [Website](#opencannabis.contact.Website)
- `products`: High-level concrete product structures.
    - [Merchandise](#opencannabis.products.Merchandise)
    - [MerchandiseFlag](#opencannabis.products.MerchandiseFlag)
    - [MerchandiseType](#opencannabis.products.MerchandiseType)
    - [Apothecary](#opencannabis.products.Apothecary)
    - [ApothecaryType](#opencannabis.products.ApothecaryType)
    - [Flower](#opencannabis.products.Flower)
    - [Edible](#opencannabis.products.Edible)
    - [EdibleIngredient](#opencannabis.products.EdibleIngredient)
    - [EdibleFlag](#opencannabis.products.EdibleFlag)
    - [EdibleType](#opencannabis.products.EdibleType)
    - [Extract](#opencannabis.products.Extract)
    - [ExtractFlag](#opencannabis.products.ExtractFlag)
    - [ExtractType](#opencannabis.products.ExtractType)
    - [DistributionPolicy](#opencannabis.products.distribution.DistributionPolicy)
    - [Channel](#opencannabis.products.distribution.Channel)
    - [ChannelType](#opencannabis.products.distribution.ChannelType)
    - [Cartridge](#opencannabis.products.Cartridge)
    - [CartridgeType](#opencannabis.products.CartridgeType)
    - [Plant](#opencannabis.products.Plant)
    - [PlantType](#opencannabis.products.PlantType)
    - [Preroll](#opencannabis.products.Preroll)
    - [PrerollFlag](#opencannabis.products.PrerollFlag)


----

## `opencannabis.base`

Foundational structures used across the spec.

{% nomnoml %}

#title: "Base Models: Content"
#font: Lato
#zoom: 1
#direction: down
#fill: #d5e7ee; #8ebff2

[Language
  |ENGLISH: 0|SPANISH: 1|FRENCH: 2]

[Compression|enabled: bool|type: Compression.Type|
  [Type|NONE: 0|GZIP: 1|BROTLI: 2|SNAPPY: 3]]

{% endnomnoml %}

{% nomnoml %}

#title: "Base Models: Product References"
#font: Lato
#zoom: 1
#direction: right
#fill: #d5e7ee; #8ebff2

[ProductKind
  |FLOWERS: 0|EDIBLES: 1|EXTRACTS: 2|PREROLLS: 3|APOTHECARY: 4|CARTRIDGES: 5|PLANTS: 6|MERCHANDISE: 7]
  
[ProductKey
  |id: string|type: ProductKind]->[ProductKind]

[ProductReference
  |name: string|key: ProductKey]->[ProductKey]

{% endnomnoml %}


<a name="opencannabis.base.Compression"></a>

#### `Compression`
Specifies enabled/disabled state and compression type, and is usually attached to arbitrary data or metadata.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| enabled | [bool](./XB-Scalar-Value-Types.md#bool) |  | Enabled/disabled flag for compression. Defaults to not being set, so, falsy. |
| type | [Compression.Type](#opencannabis.base.Compression.Type) |  | Type of compression in use, if any. Enumerated herein via `Compression.Type`. |


<a name="opencannabis.base.Compression.Type"></a>

#### `Compression.Type`
Enumerates available types of compression, or strategies or algorithms for compressing data.

| Name | Number | Description |
| ---- | ------ | ----------- |
| NO_COMPRESSION | 0 | No compression. |
| GZIP | 1 | Gzip-based compression. |
| BROTLI | 2 | Brotli-based compression. |
| SNAPPY | 3 | Snappy-based compression. |


<a name="opencannabis.base.ProductKind"></a>

#### `ProductKind`
Enumerates types of products known to the spec.

| Name | Number | Description |
| ---- | ------ | ----------- |
| FLOWERS | 0 | Traditional buds or &#39;flower&#39;-based products, essentially sold in bags or jars. |
| EDIBLES | 1 | Manufactured products that are edible, like drinks, snacks, candy, and food. |
| EXTRACTS | 2 | Manufactured products that are concentrated from flowers in some manner, such as wax or oil. |
| PREROLLS | 3 | Pre-rolled items, generally made from flowers, like a cigarette - this would cover joints, etc. |
| APOTHECARY | 4 | Tinctures, topicals, capsules, and other forms of manufactured cannabis. |
| CARTRIDGES | 5 | Vaporizor cartridges, batteries, and kits. |
| PLANTS | 6 | Plants sold direct, in various forms such as pre-grown (clones) or raw seeds. |
| MERCHANDISE | 7 | Merchandise, usually branded in-house. Also covers glassware and miscellaneous items. |

<a name="opencannabis.base.Language"></a>

#### `Language`
Specifies languages available for specification, usually used as an attachment to content or media.

| Name | Number | Description |
| ---- | ------ | ----------- |
| ENGLISH | 0 | English. |
| SPANISH | 1 | Spanish. |
| FRENCH | 2 | French. |


<a name="opencannabis.base.ProductKey"></a>

#### `ProductKey`
Specifies a general key for a product, which is the combined specification of a product ID and type, which is
enumerated in `base.ProductType`.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](./XB-Scalar-Value-Types.md#string) |  | Product ID, an opaque string that is usually autogenerated. Within the scope of an implementing system, this may also be a stringified integer such as an auto-incrementing ID, for relational-type systems. The product ID is expected to be globally addressable and unique across all product categories. |
| type | [ProductKind](#opencannabis.base.ProductKind) |  | Type of product the ID is referring to. In most cases this entry can be omitted. |

<a name="opencannabis.base.ProductReference"></a>

#### `ProductReference`
Specifies a reference to a product.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [opencannabis.content.Name](#opencannabis.content.Name) |  | Specifies the name of a product. |
| key | [ProductKey](#opencannabis.base.ProductKey) |  | Specifies the key, if known, of a product. |


----

## `opencannabis.temporal`

Dates, times, and so on.

{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[Date
  |iso8601: string]

[Instant
  |iso8601: string
  |timestamp: uint64]

[Time
  |iso8601: string]

{% endnomnoml %}


<a name="temporal/Date.proto"></a>

### temporal/Date.proto
Provides calendar and date related definitions and structures.


<a name="opencannabis.temporal.Date"></a>

#### Date
Specifies a particular calendar date.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| iso8601 | [string](./XB-Scalar-Value-Types.md#string) |  | ISO8601-formatted calendar date value, like YYYY-MM-DD. |



<a name="temporal/Instant.proto"></a>

### `Instant`
Provides timestamp-related definitions and structures.


<a name="opencannabis.temporal.Instant"></a>

#### `Instant.type`
Specifies a particular moment in time.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| iso8601 | [string](./XB-Scalar-Value-Types.md#string) |  | ISO8601-formatted timestamp. |
| timestamp | [uint64](./XB-Scalar-Value-Types.md#uint64) |  | Unix epoch timestamp, at millisecond resolution. |



<a name="temporal/Time.proto"></a>

### `Time`
Provides time-of-day-related definitions and structures.


<a name="opencannabis.temporal.Time"></a>

#### `Time.type`
Specifies a particular time of day.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| iso8601 | [string](./XB-Scalar-Value-Types.md#string) |  | ISO8601 time format. |


----

## `opencannabis.crypto`

Cryptographic primitives, including hashing tools, encrypted data containers, and so on.

{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[Hash
  |algorithm: HashAlgorithm
  |raw: bytes
  |hex: string
  |b64: string]

[HashedData
  |data: bytes
  |hash: Hash]

[HashAlgorithm
  |SHA1: 0
  |MD5: 1
  |SHA256: 2
  |SHA384: 3
  |SHA512: 4
  |MURMUR: 6]

{% endnomnoml %}


<a name="crypto/primitives/Integrity.proto"></a>

## `crypto.primitives.Integrity.Hash`

<a name="opencannabis.crypto.primitives.integrity.Hash"></a>

### `Hash.type`
Specifies the hash portion of hashed data, along with the algorithm used to calculate the digest enclosed. This
particular container does not specify or otherwise contain the original referenced data.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| algorithm | [HashAlgorithm](#opencannabis.crypto.primitives.integrity.HashAlgorithm) |  | Specifies the algorithm in use. |
| raw | [bytes](./XB-Scalar-Value-Types.md#bytes) |  | Raw binary output of the hash algorithm. |
| hex | [string](./XB-Scalar-Value-Types.md#string) |  | Hex-encoded digest value. |
| b64 | [string](./XB-Scalar-Value-Types.md#string) |  | Base64-encoded digest value. |

<a name="opencannabis.crypto.primitives.integrity.HashedData"></a>

### `HashedData.type`
Specifies a set of raw data, of some kind, and an attached digest/hash value, along with the algorithm used to
calculate the digest.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| data | [bytes](./XB-Scalar-Value-Types.md#bytes) |  | Raw data that we are transmitting. |
| hash | [Hash](#opencannabis.crypto.primitives.integrity.Hash) |  | Hash for the raw data in this payload. |

<a name="opencannabis.crypto.primitives.integrity.HashAlgorithm"></a>

### `HashAlgorithm.number`
Enumerates hash algorithms supported or known by the runtime for shared use.

| Name | Number | Description |
| ---- | ------ | ----------- |
| SHA1 | 0 | Secure Hash Algorithm v2. |
| MD5 | 1 | Message Digest v5. |
| SHA256 | 2 | Secure Hash Algorithm, with 256-bit width. |
| SHA384 | 3 | Secure Hash Algorithm, with 384-bit width. |
| SHA512 | 4 | Secure Hash Algorithm, with 512-bit width. |
| MURMUR | 6 | Specifies hashing with MurmurHash. |

----

## `opencannabis.geo`

Location data, distance, addresses, and so on.

{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[Country
  |code: string]
  
[Point
  |latitude: double
  |longitude: double
  |elevation: double
  |accuracy: double]
  
[Point
  |state: usa.USState
  |province: string]
  
[Distance
  |estimate: bool
  |accuracy: LocationAccuracy
  |unit: DistanceUnit
  |start: Location
  |end: Location]
  
[DistanceValue
  |unit: DistanceUnit
  |value: double]
  
[Location
  |name: opencannabis.content.Name
  |address: Address
  |point: Point
  |accuracy: LocationAccuracy]

{% endnomnoml %}
{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[LocationAccuracy
  |estimate: bool
  |value: DistanceValue]
  
[DistanceUnit
  |METERS: 0
  |INCHES: 1
  |FEET: 2
  |MILLIMETERS:3
  |CENTIMETERS: 4
  |KILOMETERS: 5
  |MILES: 6]
  
[Address
  |first_line: string
  |second_line: string
  |city: string
  |state: string
  |zipcode: string
  |country: string]
  
[USState
  |UNSPECIFIED: 0
  |AL / Alabama: 1
  |AK / Alaska: 2
  |AZ / Arizona: 3
  |AR / Arkansas: 4
  |CA / California: 5
  |...
  |WY / Wyoming: 51]
{% endnomnoml %}

<a name="geo/Country.proto"></a>

### `Country.type`
Specifies an independent nation state.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| code | [string](#string) |  | ISO country code. |


<a name="geo/Point.proto"></a>

### `Point.type`
Specifies a specific point on the earth, via a standard set of latitude/longitude coordinates, an elevation, and
optionally an accuracy rating. Accuracy and elevation are interpreted in &#39;feet&#39; by default.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| latitude | [double](#double) |  | Latitude value of this point. |
| longitude | [double](#double) |  | Longitude value of this point. |
| elevation | [double](#double) |  | Elevation of this point, if any. |
| accuracy | [double](#double) |  | Accuracy rating attached to this point, if any. |


<a name="geo/Province.proto"></a>

### `Province.type`
Specifies a US or non-US province.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| state | [usa.USState](#opencannabis.geo.usa.USState) |  | US state, specified by enumerated ID. |
| province | [string](#string) |  | Generic province reference, by name. |


<a name="geo/Location.proto"></a>

### `Distance.type`
Specifies a distance between two locations.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| estimate | [bool](#bool) |  | Specifies whether this distance is an estimate. |
| accuracy | [LocationAccuracy](#opencannabis.geo.LocationAccuracy) |  | Specifies the accuracy estimate for the distance values, if known. |
| unit | [DistanceUnit](#opencannabis.geo.DistanceUnit) |  | Specifies the unit of measurement for a location accuracy estimate. |
| start | [Location](#opencannabis.geo.Location) |  | Specifies the starting location for a distance span. |
| end | [Location](#opencannabis.geo.Location) |  | Specifies the terminating location for a distance span. |


<a name="opencannabis.geo.DistanceValue"></a>

### `DistanceValue.Type`
Specifies a single distance value.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| unit | [DistanceUnit](#opencannabis.geo.DistanceUnit) |  | Specifies the unit of measurement employed for this distance. |
| value | [double](#double) |  | Actual value. |


<a name="opencannabis.geo.Location"></a>

### `Location.Type`
Represents a physically addressable location in the real world.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [opencannabis.content.Name](#opencannabis.content.Name) |  | Name for this location, if applicable. |
| address | [Address](#opencannabis.geo.Address) |  | Address for this location, if applicable. |
| point | [Point](#opencannabis.geo.Point) |  | Geopoint (latitude/longitude) for this location. |
| accuracy | [LocationAccuracy](#opencannabis.geo.LocationAccuracy) |  | Specifies the accuracy estimate, if known. |


<a name="opencannabis.geo.LocationAccuracy"></a>

### `LocationAccuracy.Type`
Represents an estimate of location accuracy.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| estimate | [bool](#bool) |  | Specifies whether this accuracy rating is an estimate. |
| value | [DistanceValue](#opencannabis.geo.DistanceValue) |  | Distance value for the accuracy specified. |


<a name="opencannabis.geo.DistanceUnit"></a>

### `DistanceUnit.number`
Enumeration of recognized units of distance.

| Name | Number | Description |
| ---- | ------ | ----------- |
| METERS | 0 | Distance in meters. |
| INCHES | 1 | Distance in inches. |
| FEET | 2 | Distance in feet. |
| MILLIMETERS | 3 | Distance in millimeters. |
| CENTIMETERS | 4 | Distance in centimeters. |
| KILOMETERS | 5 | Distance in kilometers. |
| MILES | 6 | Distance in miles. |


<a name="geo/Address.proto"></a>

### `Address.Type`
Specifies a standard postal address, with two address lines, and space for a municipality (&#39;city&#39;), provincial
authority (&#39;state&#39;), and national authority (&#39;country&#39;).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| first_line | [string](#string) |  | First line of the address. |
| second_line | [string](#string) |  | Second line of the address, if applicable. |
| city | [string](#string) |  | City or municipality name for the address. |
| state | [string](#string) |  | State that contains the city or municipality for this address. |
| zipcode | [string](#string) |  | USPS zipcode associated with this address. |
| country | [string](#string) |  | Country code associated with this address (&#39;US&#39; or &#39;USA&#39; for United States, for instance). |


<a name="geo/USState.proto"></a>

### `USState.Number`
Enumerates United States member states and territories by their full name and abbreviation.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED | 0 | Default: Unspecified. |
| AL | 1 | State of Alabama. |
| ALABAMA | 1 |  |
| AK | 2 | State of Alaska. |
| ALASKA | 2 |  |
| AZ | 3 | State of Arizona. |
| ARIZONA | 3 |  |
| AR | 4 | State of Arkansas. |
| ARKANSAS | 4 |  |
| CA | 5 | State of California. |
| CALIFORNIA | 5 |  |
| CO | 6 | State of Colorado. |
| COLORADO | 6 |  |
| CT | 7 | State of Connecticut. |
| CONNECTICUT | 7 |  |
| DE | 8 | State of Delaware. |
| Delaware | 8 |  |
| DC | 9 | Washington, District of Columbia (DC). |
| DISTRICT_OF_COLUMBIA | 9 |  |
| FL | 10 | State of Florida. |
| FLORIDA | 10 |  |
| GA | 11 | State of Georgia. |
| GEORGIA | 11 |  |
| HI | 12 | State of Hawaii. |
| HAWAII | 12 |  |
| ID | 13 | State of Idaho. |
| IDAHO | 13 |  |
| IL | 14 | State of Illinois. |
| ILLINOIS | 14 |  |
| IN | 15 | State of Indiana. |
| INDIANA | 15 |  |
| IA | 16 | State of Iowa. |
| IOWA | 16 |  |
| KS | 17 | State of Kansas. |
| KANSAS | 17 |  |
| KY | 18 | State of Kentucky. |
| KENTUCKY | 18 |  |
| LA | 19 | State of Loisiana. |
| LOISIANA | 19 |  |
| ME | 20 | State of Maine. |
| MAINE | 20 |  |
| MD | 21 | State of Maryland. |
| MARYLAND | 21 |  |
| MA | 22 | State of Massachusetts. |
| MASSACHUSETTS | 22 |  |
| MI | 23 | State of Michigan. |
| MICHIGAN | 23 |  |
| MN | 24 | State of Minnesota. |
| MINNESOTA | 24 |  |
| MS | 25 | State of Mississippi. |
| MISSISSIPPI | 25 |  |
| MO | 26 | State of Missouri. |
| MISSOURI | 26 |  |
| MT | 27 | State of Montana. |
| MONTANA | 27 |  |
| NE | 28 | State of Nebraska. |
| NEBRASKA | 28 |  |
| NV | 29 | State of Nevada. |
| NEVADA | 29 |  |
| NH | 30 | State of New Hampshire. |
| NEW_HAMPSHIRE | 30 |  |
| NJ | 31 | State of New Jersey. |
| NEW_JERSEY | 31 |  |
| NM | 32 | State of New Mexico. |
| NEW_MEXICO | 32 |  |
| NY | 33 | State of New York. |
| NEW_YORK | 33 |  |
| NC | 34 | State of North Carolina. |
| NORTH_CAROLINA | 34 |  |
| ND | 35 | State of North Dakota. |
| NORTH_DAKOTA | 35 |  |
| OH | 36 | State of Ohio. |
| OHIO | 36 |  |
| OK | 37 | State of Oklahoma. |
| OKLAHOMA | 37 |  |
| OR | 38 | State of Oregon. |
| OREGON | 38 |  |
| PA | 39 | State of Pennsylvania. |
| PENNSYLVANIA | 39 |  |
| RI | 40 | State of Rhode Island. |
| RHODE_ISLAND | 40 |  |
| SC | 41 | State of South Carolina. |
| SOUTH_CAROLINA | 41 |  |
| SD | 42 | State of South Dakota. |
| SOUTH_DAKOTA | 42 |  |
| TN | 43 | State of Tennessee. |
| TENNESSEE | 43 |  |
| TX | 44 | State of Texas. |
| TEXAS | 44 |  |
| UT | 45 | State of Utah. |
| UTAH | 45 |  |
| VT | 46 | State of Vermont. |
| VERMONT | 46 |  |
| VA | 47 | State of Virginia. |
| VIRGINIA | 47 |  |
| WA | 48 | State of Washington. |
| WASHINGTON | 48 |  |
| WV | 49 | State of West Virginia. |
| WEST_VIRGINIA | 49 |  |
| WI | 50 | State of Wisconsin. |
| WISCONSIN | 50 |  |
| WYOMING | 51 | State of Wyoming. |
| WY | 51 |  |

----

## `opencannabis.device`

Specifies a variety of devices, device flags, device types, and so on.

{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[Device
 | uuid: string
 | type: DeviceType
 | flags: DeviceFlags
 | key: DeviceCredentials]

[DeviceCredentials
 | public_key: bytes
 | private_key: bytes
 | sha256: string
 | identity: string
 | authorities: repeated bytes]

[DeviceFlags
 | ephemeral: bool
 | managed: bool]
 
[DeviceType
 | UNKNOWN_DEVICE_TYPE:0
 | DESKTOP:1
 | PHONE:2
 | TABLET:3
 | TV:4]

{% endnomnoml %}


<a name="device/Device.proto"></a>

### `Device.Type`
Specifies a structure that describes a known device.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| uuid | [string](#string) |  | Universally unique identifier for this device. |
| type | [DeviceType](#opencannabis.device.DeviceType) |  | Type of this device. |
| flags | [DeviceFlags](#opencannabis.device.DeviceFlags) |  | Flags for this device. |
| key | [DeviceCredentials](#opencannabis.device.DeviceCredentials) |  | Credentials for this device. |


<a name="opencannabis.device.DeviceCredentials"></a>

### `DeviceCredentials.Type`
Credentials that assert a device&#39;s identity or authorization.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| public_key | [bytes](#bytes) |  | Raw bytes for a device&#39;s public key. |
| private_key | [bytes](#bytes) |  | Raw bytes for the device&#39;s private key. |
| sha256 | [string](#string) |  | SHA256 hash of this device&#39;s public key. |
| identity | [string](#string) |  | A device&#39;s raw identity payload. |
| authorities | [bytes](#bytes) | repeated | Repeated PEM authority payloads, asserted as trusted by the server. |


<a name="opencannabis.device.DeviceFlags"></a>

### `DeviceFlags.Type`
Stateful flags that may be set on a device.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| ephemeral | [bool](#bool) |  | Flag to mark a device as ephemeral, i.e. attached to a disposable identity. |
| managed | [bool](#bool) |  | Flag to mark a device as managed by EMM systems. |


<a name="opencannabis.device.DeviceType"></a>

### `DeviceType.Number`
Enumerates major types of devices that might be encountered, including desktops, phones, tablets, TVs, and browsers.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNKNOWN_DEVICE_TYPE | 0 | The end-device type is not known. |
| DESKTOP | 1 | The end-device is a desktop of some kind. |
| PHONE | 2 | The end-device is a phone. |
| TABLET | 3 | The end-device is a tablet. |
| TV | 4 | The end-device is a TV of some kind. |

----

## `opencannabis.content`

Specifies Timestamps, Products, Brands, formats, encoding, and so on

{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[Name
  | primary: string
  | display: string]

[Content
 | type: Content.Type
 | encoding: Content.Encoding
 | content: string
 | language: opencannabis.base.Language
 | compression: opencannabis.base.Compression]

[Encoding
 | UTF8: 0
 | B64: 1
 | B64_ASCII: 2]

[Type
 | TEXT: 0
 | MARKDOWN: 1
 | HTML: 2]

{% endnomnoml %}


{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[MaterialsData
 | species: opencannabis.structs.Species
 | genetics: opencannabis.structs.Genetics
 | grow: opencannabis.structs.Grow
 | shelf: opencannabis.structs.Shelf
 | tests: opencannabis.structs.labtesting.TestResults
 | channel: repeated opencannabis.products.distribution.DistributionPolicy]

[Brand
 | name: Name
 | parent: Brand
 | summary: Content
 | media: repeated opencannabis.media.MediaItem]

[ProductContent
 | name: Name
 | brand: Brand
 | summary: Content
 | usage: Content
 | dosage: Content
 | media: repeated opencannabis.media.MediaItem
 | pricing: opencannabis.structs.pricing.ProductPricing
 | flags: opencannabis.structs.ProductFlag
 | ts: ProductTimestamps]

[ProductTimestamps
 | created: opencannabis.temporal.Instant
 | modified: opencannabis.temporal.Instant
 | published: opencannabis.temporal.Instant]

{% endnomnoml %}


<a name="content/Name.proto"></a>

### `Name.Type`
Displayable content name.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| primary | [string](#string) |  | Primary name. |
| display | [string](#string) |  | Display name, if different from the &#39;primary name&#39;. |


<a name="content/Content.proto"></a>

### `Content.Type`
Specifies a freeform content payload of some kind.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [Content.Type](#opencannabis.content.Content.Type) |  | Format/underlying type of content data. |
| encoding | [Content.Encoding](#opencannabis.content.Content.Encoding) |  | Encoding of underlying content data. |
| content | [string](#string) |  | Raw bytes of underlying content data. |
| language | [opencannabis.base.Language](#opencannabis.base.Language) |  | Language information for underlying content. |
| compression | [opencannabis.base.Compression](#opencannabis.base.Compression) |  | Compression settings for underlying content. |


<a name="opencannabis.content.Content.Encoding"></a>

### `Content.Encoding.Number`
Enumerates supported encodings for content data.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UTF8 | 0 | UTF-8 standard encoding. |
| B64 | 1 | Base-64 encoded UTF-8. |
| B64_ASCII | 2 | Base-64 encoded ASCII. |


<a name="opencannabis.content.Content.Type"></a>

### `Content.Number`
Enumerates supported types/formats for content data.

| Name | Number | Description |
| ---- | ------ | ----------- |
| TEXT | 0 | Plaintext format. |
| MARKDOWN | 1 | Markdown format. |
| HTML | 2 | HTML format. |


<a name="content/MaterialsData.proto"></a>

### `MaterialsData.Type`
Specifies materials-related data about a product that contains cannabis.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| species | [opencannabis.structs.Species](#opencannabis.structs.Species) |  | Species of an item, if known. |
| genetics | [opencannabis.structs.Genetics](#opencannabis.structs.Genetics) |  | Specifies the genetics of an item, if known. |
| grow | [opencannabis.structs.Grow](#opencannabis.structs.Grow) |  | Specifies how this item was grown. |
| shelf | [opencannabis.structs.Shelf](#opencannabis.structs.Shelf) |  | Shelf status of this product. |
| tests | [opencannabis.structs.labtesting.TestResults](#opencannabis.structs.labtesting.TestResults) |  | Laboratory testing results for this particular subject material. |
| channel | [opencannabis.products.distribution.DistributionPolicy](#opencannabis.products.distribution.DistributionPolicy) | repeated | Specifies distribution policy for this particular subject material. |


<a name="content/Brand.proto"></a>

### `Brand.Type`
Information about a particular brand or producer of products or materials.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [Name](#opencannabis.content.Name) |  | Naming information for this brand. |
| parent | [Brand](#opencannabis.content.Brand) |  | Parent/owning brand, if applicable. |
| summary | [Content](#opencannabis.content.Content) |  | Summary information or content about this brand. |
| media | [opencannabis.media.MediaItem](#opencannabis.media.MediaItem) | repeated | Media items attached to this brand. |


<a name="content/ProductContent.proto"></a>

### `ProductContent.Type`
Specifies a common model for product content, mostly user-visible, and shared by all concrete models. Most of the
information you see when a product is displayed or listed comes from this model.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [Name](#opencannabis.content.Name) |  | Main product name. |
| brand | [Brand](#opencannabis.content.Brand) |  | Brand information for this product. |
| summary | [Content](#opencannabis.content.Content) |  | Description or narrative-style content about this product. |
| usage | [Content](#opencannabis.content.Content) |  | Content about how this product is best used, or recommended to be used, either from the manufacturer or retailer. |
| dosage | [Content](#opencannabis.content.Content) |  | Dosage advice about this product, either from the manufacturer or retailer. |
| media | [opencannabis.media.MediaItem](#opencannabis.media.MediaItem) | repeated | Product media, including images, videos, and so on. |
| pricing | [opencannabis.structs.pricing.ProductPricing](#opencannabis.structs.pricing.ProductPricing) |  | Pricing specification for this product, regardless of pricing type (i.e. weighted or unit-style pricing). |
| flags | [opencannabis.structs.ProductFlag](#opencannabis.structs.ProductFlag) | repeated | Product flags attached to this content. |
| ts | [ProductTimestamps](#opencannabis.content.ProductTimestamps) |  | Timestamps for this product. |


<a name="opencannabis.content.ProductTimestamps"></a>

### `ProductTimestamps.Type`
Specifies timestamps applied to a product, so that it may be tracked or sorted according to publish date, creation
date, or last modification date.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| created | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | When the subject product was created. |
| modified | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | When the subject product was last modified. |
| published | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | When the subject product was last or first published. |

----

## `opencannabis.person`

Specifies a person, their name, any middle or alternate name, date of birth, prefix, postfix, and their contact
information

{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[PersonName
 | full_name: string
 | first_name: string
 | last_name: string
 | middle_name: string
 | prefix: string
 | postfix: string]

[Person
 | name: Name
 | legal_name: Name
 | alternate_name: Name
 | contact: opencannabis.contact.ContactInfo
 | date_of_birth: opencannabis.temporal.Date]

{% endnomnoml %}

<a name="person/PersonName.proto"></a>

### `Name.Type`
Represents a human being&#39;s name, in the style of &#34;given&#34; name (first) and &#34;family&#34; name (last) being concatenated to
form a full person&#39;s name. Additional names, like middle names, etc, are also specified here.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| full_name | [string](#string) |  | Person&#39;s full name, if a fulltext value should override. |
| first_name | [string](#string) |  | Person&#39;s given, or first, name. |
| last_name | [string](#string) |  | Person&#39;s family, or last, name. |
| middle_name | [string](#string) |  | Person&#39;s middle name. |
| prefix | [string](#string) |  | Prefix for a person&#39;s name. |
| postfix | [string](#string) |  | Postfix for a person&#39;s name. |


<a name="person/Person.proto"></a>

### `Person.Type`
A person&#39;s and their name, legal name, nickname, etc.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [Name](#opencannabis.person.Name) |  | Person&#39;s primary name information. |
| legal_name | [Name](#opencannabis.person.Name) |  | Person&#39;s legal name, if it differs from their primary name. |
| alternate_name | [Name](#opencannabis.person.Name) |  | Person&#39;s optional alternate name. |
| contact | [opencannabis.contact.ContactInfo](#opencannabis.contact.ContactInfo) |  | Person&#39;s contact information. |
| date_of_birth | [opencannabis.temporal.Date](#opencannabis.temporal.Date) |  | Date of birth. |

----

## `opencannabis.contact`

Specifies a person&#39;s contact information, address, email, phone numbers, website and location

{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[PhoneNumber
 | e164: string
 | validated: bool]

[ContactInfo
 | location: opencannabis.geo.Location
 | phone: PhoneNumber
 | email: EmailAddress
 | website: Website]

[EmailAddress
 | address: string
 | validated: bool]

[Website
 | uri: string
 | title: string
 | icon: bytes]

{% endnomnoml %}


<a name="contact/PhoneNumber.proto"></a>

### `PhoneNumber.Type`
Payload that specifies a phone number, and any additional information to be carried with it (including verification
state, if applicable).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| e164 | [string](#string) |  | E164-formatted telephone number. |
| validated | [bool](#bool) |  | Validation status. Usable by providers to indicate a phone number that has already been validated, or that a phone number remains unvalidated. |


<a name="contact/ContactInfo.proto"></a>

### `ContactInfo.Type`
Contact information for a person, organization, or other entity.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| location | [opencannabis.geo.Location](#opencannabis.geo.Location) |  | Geographic location and physical mail contact information. |
| phone | [PhoneNumber](#opencannabis.contact.PhoneNumber) |  | Telephone contact information. |
| email | [EmailAddress](#opencannabis.contact.EmailAddress) |  | Electronic mail contact information. |
| website | [Website](#opencannabis.contact.Website) |  | Website contact information. |


<a name="contact/EmailAddress.proto"></a>

### `EmailAddress.Type`
Specifies information about an electronic mail (email) address, and optionally, its validation status.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| address | [string](#string) |  | Email address, in standard format (&#39;example@sample.com&#39;). |
| validated | [bool](#bool) |  | Validation status. Usable by providers to indicate an email address that has already been validated, or that an address remains unvalidated. |


<a name="contact/Website.proto"></a>

### `Website.Type`
Specifies a structure that describes a URI/website, and related information.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| uri | [string](#string) |  | URI for the website. |
| title | [string](#string) |  | Title from the HTML page at URI. |
| icon | [bytes](#bytes) |  | Favicon raw bytes from the HTML page at URI. |

----

## `opencannabis.products`

Specifies and enumerates products in the menu; flowers, extracts, edibles, apothecary, merch, plants and pre-rolls

{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[Merchandise
 | key: opencannabis.base.ProductKey
 | type: MerchandiseType
 | flags: MerchandiseFlag
 | product: opencannabis.content.ProductContent]

[MerchandiseFlag
 | NO_MERCHANDISE_FLAGS: 0
 | MEDICAL_ONLY: 1
 | BRAND_SWAG: 2]

[MerchandiseType
 | UNSPECIFIED_MERCHANDISE: 0
 | CLOTHING: 1
 | GLASSWARE: 2
 | CONTAINER: 3
 | LIGHTER: 4]

[Apothecary
 | key: opencannabis.base.ProductKey
 | type: ApothecaryType
 | product: opencannabis.content.ProductContent
 | material: opencannabis.content.MaterialsData]

{% endnomnoml %}


{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[ApothecaryType
 | UNSPECIFIED_APOTHECARY: 0
 | TOPICAL: 1
 | TINCTURE: 2
 | CAPSULE: 3
 | INJECTOR: 4
 | SUBLINGUAL: 5]

[Flower
 | key: opencannabis.base.ProductKey
 | product: opencannabis.content.ProductContent
 | material: opencannabis.content.MaterialsData]

[Edible
 | key: opencannabis.base.ProductKey
 | type: EdibleType
 | flags: repeated EdibleFlag
 | product: opencannabis.content.ProductContent
 | material: opencannabis.content.MaterialsData
 | ingredients: repeated EdibleIngredient]

[EdibleIngredient
 | label: string
 | amount: string]

{% endnomnoml %}




{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[EdibleFlag
 | NO_EDIBLE_FLAG: 0
 | VEGAN: 1
 | GLUTEN_FREE: 2
 | SUGAR_FREE: 3
 | FAIR_TRADE: 4
 | ORGANIC: 5
 | LOCAL: 6]

[EdibleType
 | UNSPECIFIED_EDIBLE: 0
 | CHOCOLATE: 1
 | BAKED_GOOD: 2
 | CANDY: 3
 | DRINK: 4]

[Extract
| key: opencannabis.base.ProductKey
| type: ExtractType
| flag: ExtractFlag
| flower: opencannabis.base.ProductReference
| product: opencannabis.content.ProductContent
| material: opencannabis.content.MaterialsData]

[ExtractFlag
 | NO_EXTRACT_FLAGS:0
 | SOLVENTLESS:1]

{% endnomnoml %}




{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[ExractType
 | UNSPECIFIED_EXTRACT: 0
 | OIL: 1
 | WAX: 2
 | SHATTER: 3
 | KIEF: 4
 | HASH: 5
 | LIVE_RESIN: 6
 | ROSIN: 7]

[DistributionPolicy
 | enabled: bool
 | channel: Channel
 | type: ChannelType
 | suppress: bool]

[Channel
 | UNSPECIFIED_CHANNEL_TYPE: 0
 | DIRECT: 1
 | MARKETPLACE: 2]

[Cartridge
 | key: opencannabis.base.ProductKey
 | type: CartridgeType
 | product: opencannabis.content.ProductContent
 | material: opencannabis.content.MaterialsData]

{% endnomnoml %}


{% nomnoml %}

#fill: #d5e7ee; #8ebff2

[CartridgeType
 | UNSPECIFIED_CARTRIDGE: 0
 | CARTRIDGE: 1
 | BATTERY: 2
 | KIT: 3]

[Plant
 | key: opencannabis.base.ProductKey
 | type: PlantType
 | origin: repeated opencannabis.base.ProductReference
 | product: opencannabis.content.ProductContent
 | material: opencannabis.content.MaterialsData]

[PlantType
 | UNSPECIFIED_PLANT: 0
 | SEED: 1
 | CLONE: 2]

[Preroll
 | key: opencannabis.base.ProductKey
 | flower: opencannabis.base.ProductReference
 | length: double
 | thickness: double
 | flags: repeated PrerollFlag
 | product: opencannabis.content.ProductContent
 | material: opencannabis.content.MaterialsData]

{% endnomnoml %}

{% nomnoml %}


#fill: #d5e7ee; #8ebff2
[MenuProduct
  | key:opencannabis.base.ProductKey
  | apothecary:opencannabis.products.Apothecary
  | cartridge:opencannabis.products.Cartridge
  | edible:opencannabis.products.Edible
  | extract:opencannabis.products.Extract
  | flower:opencannabis.products.Flower
  | merchandise:opencannabis.products.Merchandise
  | plant:opencannabis.products.Plant
  | preroll:opencannabis.products.Preroll]

{% endnomnoml %}

<a name="products/Merchandise.proto"></a>

### `Merchandise.Type`
Specifies an item of merchandise, that does not contain cannabis, but is sold anyway by a dispensary, such as branded
clothing, containers, lighters, and other random stuff.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [opencannabis.base.ProductKey](#opencannabis.base.ProductKey) |  | Product key uniquely identifying this merchandise item. |
| type | [MerchandiseType](#opencannabis.products.MerchandiseType) |  | Sub-category for this merchandise item, if known. |
| flags | [MerchandiseFlag](#opencannabis.products.MerchandiseFlag) | repeated | Flags for this merchandise item. |
| product | [opencannabis.content.ProductContent](#opencannabis.content.ProductContent) |  | Content about this merchandise item. |


<a name="opencannabis.products.MerchandiseFlag"></a>

### `MerchandiseFlag.Number`
Flags that may be applied specifically to merchandise items.

| Name | Number | Description |
| ---- | ------ | ----------- |
| NO_MERCHANDISE_FLAGS | 0 | No flags specified. |
| MEDICAL_ONLY | 1 | This item requires that a user have a valid medical recommendation for cannabis. |
| BRAND_SWAG | 2 | This item is branded for the partner and should be promoted as such. |


<a name="opencannabis.products.MerchandiseType"></a>

### `MerchandiseType.Number`
Specifies types of generic merchandise that may be carried on a dispensary menu.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED_MERCHANDISE | 0 | Unknown, unrecognized, or otherwise unspecified merchandise subcategory. |
| CLOTHING | 1 | Clothing - i.e. shirts, pants, hoodies, and other wearable textiles. |
| GLASSWARE | 2 | Cups, mugs, on up to pipes and bongs. |
| CONTAINER | 3 | Containers for cannabis. |
| LIGHTER | 4 | Tools to produce fire to consume cannabis. |


<a name="products/Apothecary.proto"></a>

### `Apothecary.Type`
Specifies an apothecary item for sale. Apothecary items are described as drugstore-style items, like capsules, oils,
injectors, and other edge-case applications.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [opencannabis.base.ProductKey](#opencannabis.base.ProductKey) |  | Product key uniquely identifying this apothecary item. |
| type | [ApothecaryType](#opencannabis.products.ApothecaryType) |  | Specific type of apothecary item being described. |
| product | [opencannabis.content.ProductContent](#opencannabis.content.ProductContent) |  | Product content about this apothecary item. |
| material | [opencannabis.content.MaterialsData](#opencannabis.content.MaterialsData) |  | Materials and handling information about this apothecary item. |


<a name="opencannabis.products.ApothecaryType"></a>

### `ApothecaryType.Number`
Specifies types of apothecary items that may be expressed.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED_APOTHECARY | 0 | Specifies an unidentified, or unspecified, apothecary item. |
| TOPICAL | 1 | Specifies a topical material, such as an ointment or oil, meant for application to the skin. |
| TINCTURE | 2 | Specifies a liquid that may be added to other liquids or foods. Often used with tea. |
| CAPSULE | 3 | Specifies a capsule containing cannabinoids, similar to a dietary supplement. |
| INJECTOR | 4 | Specifies an injector or injection style system. |
| SUBLINGUAL | 5 | Specifies a sublingual-applied product, i.e., under-the-tongue. |


<a name="products/Flower.proto"></a>

### `Flower.Type`
Specifies the model for a traditional &#39;flower&#39;-style product, which involves the sale or consumption of the flower
or &#39;bud,&#39; of a cannabis plant.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [opencannabis.base.ProductKey](#opencannabis.base.ProductKey) |  | Key that uniquely identifies this flower product. |
| product | [opencannabis.content.ProductContent](#opencannabis.content.ProductContent) |  | Content about this product. |
| material | [opencannabis.content.MaterialsData](#opencannabis.content.MaterialsData) |  | Materials and handling information about this product. |


<a name="opencannabis.products.Edible"></a>

### `Edible.Type`
Specifies an edible product that may be consumed as a food or beverage, that contains cannabis or cannabinoids in
some quantity.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [opencannabis.base.ProductKey](#opencannabis.base.ProductKey) |  | Product key that uniquely identifies this edible item. |
| type | [EdibleType](#opencannabis.products.EdibleType) |  | Specifies the subcategory of this edible product, if known and applicable. |
| flags | [EdibleFlag](#opencannabis.products.EdibleFlag) | repeated | Specifies flags attached to this edible product. |
| product | [opencannabis.content.ProductContent](#opencannabis.content.ProductContent) |  | Product content related to/about this edible item. |
| material | [opencannabis.content.MaterialsData](#opencannabis.content.MaterialsData) |  | Materials and handling information about this cartridge product. |
| ingredients | [EdibleIngredient](#opencannabis.products.EdibleIngredient) | repeated | Specifies the ingredients for a product, when/if it is composed of ingredients (i.e. edibles). |


<a name="opencannabis.products.EdibleIngredient"></a>

### `EdibleIngredient.Type`
Specifies an ingredient included in an edible.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| label | [string](#string) |  | Human-friendly label for the ingredient. |
| amount | [string](#string) |  | Human-friendly label describing the amount for this ingredient. |


<a name="opencannabis.products.EdibleFlag"></a>

### `EdibleFlag.Number`
Flags that may be applied specifically to an edible product.

| Name | Number | Description |
| ---- | ------ | ----------- |
| NO_EDIBLE_FLAG | 0 | Special default flag indicating no flags. |
| VEGAN | 1 | Flag indicating this edible product is vegan. |
| GLUTEN_FREE | 2 | Flag indicating this edible product is gluten free. |
| SUGAR_FREE | 3 | Flag indicating this edible product is sugar free. |
| FAIR_TRADE | 4 | Flag indicating this edible product is compliant with fair trade practices. |
| ORGANIC | 5 | Flag indicating this edible product is considered organic. |
| LOCAL | 6 | Flag indicating this edible product was grown or cultivated or prepared locally. |


<a name="opencannabis.products.EdibleType"></a>

### `EdibleType.Number`
Specifies types of edible products that are known and considered sub-categories of the full &#39;edibles&#39; menu section.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED_EDIBLE | 0 | Unknown, unrecognized, or otherwise unspecified edible type. |
| CHOCOLATE | 1 | Specifies chocolate products, including truffles, chocolate bars, and so on. |
| BAKED_GOOD | 2 | Specifies a baked good, such as a cookie, doughnut, brownie, pie, and so on. |
| CANDY | 3 | Specifies candy items like lollipops, lozenges, gummies, etc. |
| DRINK | 4 | Specifies beverage products. |


<a name="products/Extract.proto"></a>

### `Extract.Type`
Specifies an extracted cannabis product, whereby cannabis plant material has been reduced to a more potent and
concentrated form by some process.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [opencannabis.base.ProductKey](#opencannabis.base.ProductKey) |  | Product key that uniquely identifies this cannabis extract item. |
| type | [ExtractType](#opencannabis.products.ExtractType) |  | Specific type of extract being described. |
| flag | [ExtractFlag](#opencannabis.products.ExtractFlag) | repeated | Specifies flags that may specifically be applied to this extracted cannabis item. |
| flower | [opencannabis.base.ProductReference](#opencannabis.base.ProductReference) |  | Flower that was used to produce this extract. |
| product | [opencannabis.content.ProductContent](#opencannabis.content.ProductContent) |  | Product content about this extracted cannabis item. |
| material | [opencannabis.content.MaterialsData](#opencannabis.content.MaterialsData) |  | Materials and handling data attached to this extracted cannabis item. |


<a name="opencannabis.products.ExtractFlag"></a>

### `ExtractFlag.Number`
Specifies flags that may specifically be applied to an extracted cannabis product.

| Name | Number | Description |
| ---- | ------ | ----------- |
| NO_EXTRACT_FLAGS | 0 | Specifies that no flags are set. |
| SOLVENTLESS | 1 | Specifies that this extract was made with a solventless process. |


<a name="opencannabis.products.ExtractType"></a>

### `ExtractType.Number`
Enumerates types of extracted oleoresin cannabis products that have known/specified subcategories.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED_EXTRACT | 0 | Uknown, unrecognized, or otherwise unspecified extract type. |
| OIL | 1 | Cannabis oil, usually in liquid form. |
| WAX | 2 | Cannabis wax - viscous semisolid forms of cannabis oil. |
| SHATTER | 3 | Clear, amber solid cannabis wax. |
| KIEF | 4 | Particulate discharge from cannabis flowers that contains THC or other cannabinoids. |
| HASH | 5 | Fully extracted and concentrated cannabis resin. |
| LIVE_RESIN | 6 | Extracted cannabis that is kept at freezing temperatures, rather than dried. |
| ROSIN | 7 | Heated and terpene-vaporized live resin. |


<a name="products/distribution/DistributionChannel.proto"></a>

### `DistributionPolicy.Type`
Specifies information required to note a channel and its settings for a given datapoint. Presence of this record
indicates an affirmative setting to distribute it to the specified channel, unless `suppress` is set.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| enabled | [bool](#bool) |  | Whether this policy is enabled. |
| channel | [Channel](#opencannabis.products.distribution.Channel) |  | Channel setting. |
| type | [ChannelType](#opencannabis.products.distribution.ChannelType) |  | Channel distribution type. |
| suppress | [bool](#bool) |  | The mere presence of a DistributionPolicy on a particular datapoint makes it eligible for distribution. This flag may be set to suppress distribution of the datapoint temporarily or explicitly. |


<a name="opencannabis.products.distribution.Channel"></a>

### `Channel.Number`
Specifies kinds of channels that may be used or specified for product distribution policies.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED_CHANNEL | 0 | Unknown, unrecognized, or otherwise unspecified distribution channel. |
| RETAIL | 1 | Retail distribution channel, with direct sales to consumers. |
| WHOLESALE | 2 | Wholesale distribution channel, with sales to entities that re-sell. |
| BULK | 3 | Bulk distribution channel, with large-quantity sales to wholesalers, distributors or manufacturers. |


<a name="opencannabis.products.distribution.ChannelType"></a>

### `ChannelType.Number`
Specifies the supertypes of channels that may be used to categorize channels applied to product distribution
policies.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED_CHANNEL_TYPE | 0 | Unknown, unrecognized, or otherwise unspecified channel type. |
| DIRECT | 1 | Direct consumption of channel data, i.e., &#34;direct retail&#34; would be the standard retail dispensary. |
| MARKETPLACE | 2 | Distribution through a second-party partner marketplace system. &#34;Marketplace retail&#34; would refer to digital or physical aggregators or clearinghouses that work directly with consumers. |


<a name="products/Cartridge.proto"></a>

### `Cartridge.Type`
Specifies a vaporizor or cartridge-style product, for instance, vaporizor pens and table units. Vaporizors are
composed of two elements: a battery, or the bottom power unit, and a cartridge, or the top fuel unit, that contains
cannabinoids and is disposable or refillable.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [opencannabis.base.ProductKey](#opencannabis.base.ProductKey) |  | Product key uniquely identifying this cartridge-style product. |
| type | [CartridgeType](#opencannabis.products.CartridgeType) |  | Type of cartridge product being described. |
| product | [opencannabis.content.ProductContent](#opencannabis.content.ProductContent) |  | Product content about this cartridge item. |
| material | [opencannabis.content.MaterialsData](#opencannabis.content.MaterialsData) |  | Materials and handling information about this cartridge product. |


<a name="opencannabis.products.CartridgeType"></a>

### `CartridgeType.Number`
Specifies types of cartridge products that may be expressed.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED_CARTRIDGE | 0 | Unknown, unrecognized, or otherwise unspecified cartridge type. |
| CARTRIDGE | 1 | Specifies a lone cartridge product with no battery or other accompanying items. |
| BATTERY | 2 | Specifies a battery unit with no cartridge. |
| KIT | 3 | Specifies a full kit with a battery and cartridge unit. |


<a name="products/Plant.proto"></a>

### `Plant.Type`
Specifies a plant product, such as seeds, or clones, that are designed to be cultivated by the end user.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [opencannabis.base.ProductKey](#opencannabis.base.ProductKey) |  | Product key uniquely identifying this cannabis plant item. |
| type | [PlantType](#opencannabis.products.PlantType) |  | Specific subcategory for this plant item. |
| origin | [opencannabis.base.ProductReference](#opencannabis.base.ProductReference) | repeated | Menu products made from this raw plant product. |
| product | [opencannabis.content.ProductContent](#opencannabis.content.ProductContent) |  | Product content attached to this cannabis plant item. |
| material | [opencannabis.content.MaterialsData](#opencannabis.content.MaterialsData) |  | Handling and materials data regarding this cannabis plant item. |


<a name="opencannabis.products.PlantType"></a>

### `PlantType.Number`
Enumerates types or subcategories of plants that may be sold.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED_PLANT | 0 | Unknown, unrecognized, or otherwise unspecified plant type. |
| SEED | 1 | Specifies a pack of seeds, or an individual seed. |
| CLONE | 2 | Specifies a cloned plant that is grown to some point and then sold. |


<a name="products/Preroll.proto"></a>

### `Preroll.Type`
Specifies a pre-rolled cannabis product, where a production process consumes cannabis plant material and produces
end-products that are already rolled into joints, marijuana cigarettes, blunts, and so on.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [opencannabis.base.ProductKey](#opencannabis.base.ProductKey) |  | Product key that uniquely identifies this pre-rolled cannabis product. |
| flower | [opencannabis.base.ProductReference](#opencannabis.base.ProductReference) |  | Specifies the flowers used to produce this product, if known. |
| length | [double](#double) |  | Specifies the measured length of this prerolled item, if known. |
| thickness | [double](#double) |  | Specifies the measured thickness of this prerolled item, if known. |
| flags | [PrerollFlag](#opencannabis.products.PrerollFlag) | repeated | Specifies flags that may be applied specifically to this prerolled item. |
| product | [opencannabis.content.ProductContent](#opencannabis.content.ProductContent) |  | Specifies product content attached to this prerolled item. |
| material | [opencannabis.content.MaterialsData](#opencannabis.content.MaterialsData) |  | Specifies handling and materials data associated with this prerolled item. |


<a name="opencannabis.products.PrerollFlag"></a>

### `PrerollFlag.Number`
Specifies flags that may be specifically applied to pre-rolled cannabis products.

| Name | Number | Description |
| ---- | ------ | ----------- |
| NO_PREROLL_FLAGS | 0 | Specifies that no flags are set. |
| HASH_INFUSED | 1 | Specifies that this pre-rolled item is hash-infused. |
| KIEF_INFUSED | 2 | Specifies that this pre-rolled item is kief-infused. |
| FORTIFIED | 3 | Specifies that this pre-rolled item is fortified with extracted cannabis products in some manner. |
| FULL_FLOWER | 4 | Specifies that this pre-rolled item is rolled with &#34;full flower&#34; buds, rather than trimmings, or other discarded cannabis from other production processes. |
| CONTAINS_TOBACCO | 5 | Specifies that this product contains tobacco. |

<a name="opencannabis.products.menu.MenuProduct"></a>

### MenuProduct
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
