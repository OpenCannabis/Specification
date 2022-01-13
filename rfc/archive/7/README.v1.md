---
domain: rfc.opencannabis.info
shortname: 7/OCS-L
name: OpenCannabis Lab Testing Extension
status: raw
editor: Tim Samartino <tim@bloombox.io>
contributors:
- Sam Gammon <sam@bloombox.io>
- Tim Samartino <tim@bloombox.io>
- Randy Stevens <randy@bloombox.io>
---

<a name="top"></a>

# OpenCannabis: Lab Testing Extension
- Version `1.0`
- Status: `RAW`

### Status of this Memo

This specification's current status is considered `RAW`, i.e. pre-`DRAFT`. Distribution of this memo is unlimited.

### Abstract

This document describes an extension to the _OpenCannabis Specification, version 1_, that introduces lab-testing-related
definitions structures, and services that compose, create and reference lab testing.

_"Lab Testing"_ in this context, refers to:
- The chemical components that make up a cannabis product.
- The chemical components and their respective names.
- The media through which the "Lab Testing" is displayed to customers

### Table of Contents
- [Protocol Definition](#Protocol-Definition): `labtesting`: Laboratory testing and QA.
    - [TestMedia](#opencannabis.structs.labtesting.TestMedia)
    - [TestValue](#opencannabis.structs.labtesting.TestValue)
    - [TestMediaType](#opencannabis.structs.labtesting.TestMediaType)
    - [TestValueType](#opencannabis.structs.labtesting.TestValueType)
    - [Cannabinoids](#opencannabis.structs.labtesting.Cannabinoids)
    - [Cannabinoids.Result](#opencannabis.structs.labtesting.Cannabinoids.Result)
    - [Moisture](#opencannabis.structs.labtesting.Moisture)
    - [Pesticides](#opencannabis.structs.labtesting.Pesticides)
    - [Pesticides.MeasurementsEntry](#opencannabis.structs.labtesting.Pesticides.MeasurementsEntry)
    - [Subjective](#opencannabis.structs.labtesting.Subjective)
    - [Terpenes](#opencannabis.structs.labtesting.Terpenes)
    - [Terpenes.Result](#opencannabis.structs.labtesting.Terpenes.Result)
    - [TestCoordinates](#opencannabis.structs.labtesting.TestCoordinates)
    - [TestResults](#opencannabis.structs.labtesting.TestResults)  
    - [Cannabinoid](#opencannabis.structs.labtesting.Cannabinoid)
    - [CannabinoidRatio](#opencannabis.structs.labtesting.CannabinoidRatio)
    - [Feeling](#opencannabis.structs.labtesting.Feeling)
    - [PotencyEstimate](#opencannabis.structs.labtesting.PotencyEstimate)
    - [TasteNote](#opencannabis.structs.labtesting.TasteNote)
    - [Terpene](#opencannabis.structs.labtesting.Terpene)


----
## Protocol Definition
### `opencannabis.labtesting`
Specifies testing media, tested attributes, structure of results and so on. 

{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[TestMedia
  | type:TestMediaType
  | media_item:opencannabis.media.MediaItem]

[TestValue
  | type:TestValueType
  | measurement:double
  | present:bool]

[TestMediaType
  | CERTIFICATE:0
  | RESULTS:1
  | PRODUCT_IMAGE:2]

[TestValueType
  | MILLIGRAMS:0
  | PERCENTAGE:1
  | PRESENCE:3]

{% endnomnoml %}

{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[Cannabanoids
  | thc:TestValue
  | cbd:TestValue
  | results:Repeated:Cannabinoids.Result]

[Cannabanoids.result
  | cannabinoid:Cannabinoid
  | ratio:CannabinoidRatio
  | measurement:TestValue]

[Moisture
  | measurement:TestValue]

{% endnomnoml %}
{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[Pesticides
  | pesticide_free:bool
  | measurements:repeated:Pesticides.MeasurementsEntry]

[Pesticides.MeasurementsEntry
  | key:string
  | value:TestValue]

{% endnomnoml %}
{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[Subjective
  | description:opencannabis.content.Content
  | taste:opencannabis.content.Content
  | potency:PotencyEstimate
  | feeling_tags:repeated:Feeling
  | tasting_notes:repeated:TasteNote]

[Terpenes
  | available:bool
  | terpenes:repeated:Terpenes.Result]

{% endnomnoml %}
{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[Terpenes.Result
  | terpene:Terpene
  | measurement:TestValue]

[TestCoordinates
  | zone:string
  | group:string]

{% endnomnoml %}
{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[TestResults
  | available:bool
  | media:repeated:TestMedia
  | last_updated:opencannabis.temporal.Instant
  | sealed:opencannabis.temporal.Instant
  | coordinates:TestCoordinates
  | cannabinoids:Cannabinoids
  | terpenes:Terpenes
  | pesticides:Pesticides
  | moisture:Moisture
  | subjective:Subjective
  | aroma:repeated:TasteNote
  | data:repeated:TestResults]

[Cannabanoid
  | THC:0
  | THC_A:1
  | THC_V:2
  | CBD:10
  | ...
  | CBV_A:51]

[CannabanoidRatio
  | NO_CANNABINOID_PREFERENCE:0
  | THC_ONLY:1
  | THC_OVER_CBD:2
  | EQUAL:3
  | CBD_OVER_THC:4
  | CBD_ONLY:5]
{% endnomnoml %}
{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[Feeling
  | NO_FEELING_PREFERENCE:0
  | GROUNDING:1
  | SLEEP:2
  | CALMING:3
  | STIMULATING:4
  | FUNNY:5
  | FOCUS:6
  | PASSION:7]

[PotencyEstimate
  | LIGHT:0
  | MEDIUM:1
  | HEAVY:2
  | SUPER:3]

[TasteNote
  | NO_TASTE_PREFERENCE:0
  | SWEET:1
  | SOUR:2
  | SPICE:3
  | ...
  | EARTH:11]

[Terpene
  | CAMPHENE:0
  | CARENE:1
  | BETA_CARYOPHYLLENE:2
  | CARYOPHYLLENE_OXIDE:3
  | ...
  | TERPINOLENE:18]

{% endnomnoml %}

# Protocol Documentation
<a name="top"></a>
## Table of Contents
- [structs/labtesting/TestValue.proto](#structs/labtesting/TestValue.proto)
    - [TestMedia](#opencannabis.structs.labtesting.TestMedia)
    - [TestValue](#opencannabis.structs.labtesting.TestValue)
    - [TestMediaType](#opencannabis.structs.labtesting.TestMediaType)
    - [TestValueType](#opencannabis.structs.labtesting.TestValueType)
- [structs/labtesting/TestResults.proto](#structs/labtesting/TestResults.proto)
    - [Cannabinoids](#opencannabis.structs.labtesting.Cannabinoids)
    - [Cannabinoids.Result](#opencannabis.structs.labtesting.Cannabinoids.Result)
    - [Contaminants](#opencannabis.structs.labtesting.Contaminants)
    - [Metals](#opencannabis.structs.labtesting.Metals)
    - [Metals.MeasurementsEntry](#opencannabis.structs.labtesting.Metals.MeasurementsEntry)
    - [Mildew](#opencannabis.structs.labtesting.Mildew)
    - [Mildew.MeasurementsEntry](#opencannabis.structs.labtesting.Mildew.MeasurementsEntry)
    - [Moisture](#opencannabis.structs.labtesting.Moisture)
    - [Mold](#opencannabis.structs.labtesting.Mold)
    - [Mold.MeasurementsEntry](#opencannabis.structs.labtesting.Mold.MeasurementsEntry)
    - [Pesticides](#opencannabis.structs.labtesting.Pesticides)
    - [Pesticides.MeasurementsEntry](#opencannabis.structs.labtesting.Pesticides.MeasurementsEntry)
    - [Subjective](#opencannabis.structs.labtesting.Subjective)
    - [Terpenes](#opencannabis.structs.labtesting.Terpenes)
    - [Terpenes.Result](#opencannabis.structs.labtesting.Terpenes.Result)
    - [TestCoordinates](#opencannabis.structs.labtesting.TestCoordinates)
    - [TestResults](#opencannabis.structs.labtesting.TestResults)
    - [TestSuite](#opencannabis.structs.labtesting.TestSuite)
    - [Cannabinoid](#opencannabis.structs.labtesting.Cannabinoid)
    - [CannabinoidRatio](#opencannabis.structs.labtesting.CannabinoidRatio)
    - [Feeling](#opencannabis.structs.labtesting.Feeling)
    - [PotencyEstimate](#opencannabis.structs.labtesting.PotencyEstimate)
    - [TasteNote](#opencannabis.structs.labtesting.TasteNote)
    - [Terpene](#opencannabis.structs.labtesting.Terpene)
    - [TestMethod](#opencannabis.structs.labtesting.TestMethod)


<a name="structs/labtesting/TestValue.proto"></a>

## structs/labtesting/TestValue.proto

<a name="opencannabis.structs.labtesting.TestMedia"></a>

### TestMedia

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [TestMediaType](#opencannabis.structs.labtesting.TestMediaType) |  |  |
| media_item | [opencannabis.media.MediaItem](#opencannabis.media.MediaItem) |  |  |

<a name="opencannabis.structs.labtesting.TestValue"></a>

### TestValue

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [TestValueType](#opencannabis.structs.labtesting.TestValueType) |  |  |
| measurement | [double](#double) |  |  |
| present | [bool](#bool) |  |  |

<a name="opencannabis.structs.labtesting.TestMediaType"></a>

### TestMediaType

| Name | Number | Description |
| ---- | ------ | ----------- |
| CERTIFICATE | 0 |  |
| RESULTS | 1 |  |
| PRODUCT_IMAGE | 2 |  |

<a name="opencannabis.structs.labtesting.TestValueType"></a>

### TestValueType

| Name | Number | Description |
| ---- | ------ | ----------- |
| MILLIGRAMS | 0 |  |
| PERCENTAGE | 1 |  |
| PRESENCE | 3 |  |

<a name="structs/labtesting/TestResults.proto"></a>

## structs/labtesting/TestResults.proto
Empirical laboratory product testing structures and definitions. Provides support for cannabinoid testing, terpene
testing, pesticide testing, moisture ratings, and subjective testing.

<a name="opencannabis.structs.labtesting.Cannabinoids"></a>

### Cannabinoids

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| thc | [TestValue](#opencannabis.structs.labtesting.TestValue) |  |  |
| cbd | [TestValue](#opencannabis.structs.labtesting.TestValue) |  |  |
| results | [Cannabinoids.Result](#opencannabis.structs.labtesting.Cannabinoids.Result) | repeated |  |

<a name="opencannabis.structs.labtesting.Cannabinoids.Result"></a>

### Cannabinoids.Result

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| cannabinoid | [Cannabinoid](#opencannabis.structs.labtesting.Cannabinoid) |  |  |
| ratio | [CannabinoidRatio](#opencannabis.structs.labtesting.CannabinoidRatio) |  |  |
| measurement | [TestValue](#opencannabis.structs.labtesting.TestValue) |  |  |

<a name="opencannabis.structs.labtesting.Contaminants"></a>

### Contaminants

Test results for contaminants which indicate presense/absense of a compound along with a value (if available)

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pesticides | [Pesticides](#opencannabis.structs.labtesting.Pesticides) |  | Pesticide-specific test results. Indicates a pesticide reading, by chemical compound name, and a reading value. |
| metals | [Metals](#opencannabis.structs.labtesting.Metals) |  | Heavy metal specific test results. Indicates a heavy metal reading, by chemical compound name, along with a reading value. |
| mold | [Mold](#opencannabis.structs.labtesting.Mold) |  | Mold specific test results. Indicates a mold reading, by species name, along with a reading value. |
| mildew | [Mildew](#opencannabis.structs.labtesting.Mildew) |  | Mildew specific test results. Indicates a mildew reading, by species name, along with a reading value. |

<a name="opencannabis.structs.labtesting.Metals"></a>

### Metals

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| metal_free | [bool](#bool) |  |  |
| measurements | [Metals.MeasurementsEntry](#opencannabis.structs.labtesting.Metals.MeasurementsEntry) | repeated |  |

<a name="opencannabis.structs.labtesting.Metals.MeasurementsEntry"></a>

### Metals.MeasurementsEntry

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [TestValue](#opencannabis.structs.labtesting.TestValue) |  |  |
<a name="opencannabis.structs.labtesting.Mildew"></a>

### Mildew

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| mildew_free | [bool](#bool) |  |  |
| measurements | [Mildew.MeasurementsEntry](#opencannabis.structs.labtesting.Mildew.MeasurementsEntry) | repeated |  |

<a name="opencannabis.structs.labtesting.Mildew.MeasurementsEntry"></a>

### Mildew.MeasurementsEntry

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [TestValue](#opencannabis.structs.labtesting.TestValue) |  |  |

<a name="opencannabis.structs.labtesting.Moisture"></a>

### Moisture

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| measurement | [TestValue](#opencannabis.structs.labtesting.TestValue) |  |  |

<a name="opencannabis.structs.labtesting.Mold"></a>

### Mold

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| mold_free | [bool](#bool) |  |  |
| measurements | [Mold.MeasurementsEntry](#opencannabis.structs.labtesting.Mold.MeasurementsEntry) | repeated |  |

<a name="opencannabis.structs.labtesting.Mold.MeasurementsEntry"></a>

### Mold.MeasurementsEntry

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [TestValue](#opencannabis.structs.labtesting.TestValue) |  |  |

<a name="opencannabis.structs.labtesting.Pesticides"></a>

### Pesticides

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pesticide_free | [bool](#bool) |  |  |
| measurements | [Pesticides.MeasurementsEntry](#opencannabis.structs.labtesting.Pesticides.MeasurementsEntry) | repeated |  |

<a name="opencannabis.structs.labtesting.Pesticides.MeasurementsEntry"></a>

### Pesticides.MeasurementsEntry

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [TestValue](#opencannabis.structs.labtesting.TestValue) |  |  |

<a name="opencannabis.structs.labtesting.Subjective"></a>

### Subjective

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| description | [opencannabis.content.Content](#opencannabis.content.Content) |  |  |
| taste | [opencannabis.content.Content](#opencannabis.content.Content) |  |  |
| potency | [PotencyEstimate](#opencannabis.structs.labtesting.PotencyEstimate) |  |  |
| feeling_tags | [Feeling](#opencannabis.structs.labtesting.Feeling) | repeated |  |
| tasting_notes | [TasteNote](#opencannabis.structs.labtesting.TasteNote) | repeated |  |

<a name="opencannabis.structs.labtesting.Terpenes"></a>

### Terpenes

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| available | [bool](#bool) |  |  |
| terpene | [Terpenes.Result](#opencannabis.structs.labtesting.Terpenes.Result) | repeated |  |

<a name="opencannabis.structs.labtesting.Terpenes.Result"></a>

### Terpenes.Result

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| terpene | [Terpene](#opencannabis.structs.labtesting.Terpene) |  |  |
| measurement | [TestValue](#opencannabis.structs.labtesting.TestValue) |  |  |
<a name="opencannabis.structs.labtesting.TestCoordinates"></a>

### TestCoordinates
Specifies coordinate values for a given lab testing result. This consists of &#39;zones&#39; (i.e. floors, greenhouses),
made up of &#39;batches&#39; (i.e. rooms, sections), containing &#39;lots&#39; (i.e. rows, trays) of individual plants or products.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| zone | [string](#string) |  | Specifies the &#39;zone&#39; value for a set of test results. This is usually used as/by a floor or greenhouse ID. |
| lot | [string](#string) |  | Specifies the &#39;lot&#39; value for a set of test results. This is usually used as/by a room or section ID. |
| batch | [string](#string) |  | Specifies the &#39;batch&#39; value for a set of test results. This is usually used as/by a row or tray ID for individual plants or test sample products. |
| sample_id | [string](#string) |  | Unique ID given to the sample that was tested. This may represent individual plants or products, grouped lots or batches, or even random selections from entire zones. |
<a name="opencannabis.structs.labtesting.TestResults"></a>

### TestResults

Lab testing results for a given product. Includes cannabinoid, terpene, pesticide, moisture, and subjective testing
properties. Only cannabinoid testing is considered required.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| available | [bool](#bool) |  | Boolean flag indicating whether results are available for lab testing at all. |
| media | [TestMedia](#opencannabis.structs.labtesting.TestMedia) | repeated | Media attached to a set of lab results. This might include images taken during testing, documents (such as PDFs) specifying test results, and so on. |
| last_updated | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | Last-updated value for these lab test results. Updated each time the record is updated. |
| sealed | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | Precise moment that these results were considered &#39;sealed&#39; and returned. Once this timestamp is set, a given set of test results (unique by their coordinates) is considered immutable. |
| coordinates | [TestCoordinates](#opencannabis.structs.labtesting.TestCoordinates) |  | Coordinate, or ID values, for this set of test results. When specified at the top-level of a set of lab tests, indicates the coordinates for the active set of test results. |
| cannabinoids | [Cannabinoids](#opencannabis.structs.labtesting.Cannabinoids) |  | Standard cannabinoid testing, with reading results at least for THC and CBD, and optionally additional cannabinoid compounds. |
| terpenes | [Terpenes](#opencannabis.structs.labtesting.Terpenes) |  | Testing for terpene volatiles, which might indicate aroma or flavor notes. |
| contaminants | [Contaminants](#opencannabis.structs.labtesting.Contaminants) |  |  |
| moisture | [Moisture](#opencannabis.structs.labtesting.Moisture) |  | Moisture rating and test results. |
| subjective | [Subjective](#opencannabis.structs.labtesting.Subjective) |  | Results from subjective testing - i.e, opinionated human evaluation. |
| aroma | [TasteNote](#opencannabis.structs.labtesting.TasteNote) | repeated | Computed taste notes for this product, based on the combination of terpene testing and subjective testing, if available. |
| data | [TestResults](#opencannabis.structs.labtesting.TestResults) | repeated | Raw test result data, stored under a master set of test results. Only one level of nesting is allowed. |

<a name="opencannabis.structs.labtesting.TestSuite"></a>

### TestSuite

Structure for a test suite - which contains the item being tested for, the method used to produce the results,
the value of the results, and any comments.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| method | [TestMethod](#opencannabis.structs.labtesting.TestMethod) |  | Method used to obtain the test result. |
| results | [TestResults](#opencannabis.structs.labtesting.TestResults) |  | Result of the test. |
| comments | [string](#string) |  | String containing any comments about the test. |

<a name="opencannabis.structs.labtesting.Cannabinoid"></a>

### Cannabinoid

| Name | Number | Description |
| ---- | ------ | ----------- |
| THC | 0 |  |
| THC_A | 1 |  |
| THC_V | 2 |  |
| CBD | 10 |  |
| CBD_A | 11 |  |
| CBD_V | 12 |  |
| CBD_VA | 13 |  |
| CBC | 20 |  |
| CBG | 30 |  |
| CBG_A | 31 |  |
| CBN | 40 |  |
| CBV | 50 |  |
| CBV_A | 51 |  |

<a name="opencannabis.structs.labtesting.CannabinoidRatio"></a>

### CannabinoidRatio

| Name | Number | Description |
| ---- | ------ | ----------- |
| NO_CANNABINOID_PREFERENCE | 0 |  |
| THC_ONLY | 1 |  |
| THC_OVER_CBD | 2 |  |
| EQUAL | 3 |  |
| CBD_OVER_THC | 4 |  |
| CBD_ONLY | 5 |  |

<a name="opencannabis.structs.labtesting.Feeling"></a>

### Feeling

| Name | Number | Description |
| ---- | ------ | ----------- |
| NO_FEELING_PREFERENCE | 0 |  |
| GROUNDING | 1 |  |
| SLEEP | 2 |  |
| CALMING | 3 |  |
| STIMULATING | 4 |  |
| FUNNY | 5 |  |
| FOCUS | 6 |  |
| PASSION | 7 |  |

<a name="opencannabis.structs.labtesting.PotencyEstimate"></a>

### PotencyEstimate

| Name | Number | Description |
| ---- | ------ | ----------- |
| LIGHT | 0 |  |
| MEDIUM | 1 |  |
| HEAVY | 2 |  |
| SUPER | 3 |  |

<a name="opencannabis.structs.labtesting.TasteNote"></a>

### TasteNote

| Name | Number | Description |
| ---- | ------ | ----------- |
| NO_TASTE_PREFERENCE | 0 |  |
| SWEET | 1 |  |
| SOUR | 2 |  |
| SPICE | 3 |  |
| SMOOTH | 4 |  |
| CITRUS | 5 |  |
| PINE | 6 |  |
| FRUIT | 7 |  |
| TROPICS | 8 |  |
| FLORAL | 9 |  |
| HERB | 10 |  |
| EARTH | 11 |  |

<a name="opencannabis.structs.labtesting.Terpene"></a>

### Terpene

| Name | Number | Description |
| ---- | ------ | ----------- |
| CAMPHENE | 0 |  |
| CARENE | 1 |  |
| BETA_CARYOPHYLLENE | 2 |  |
| CARYOPHYLLENE_OXIDE | 3 |  |
| EUCALYPTOL | 4 |  |
| FENCHOL | 5 |  |
| ALPHA_HUMULENE | 6 |  |
| LIMONENE | 7 |  |
| LINALOOL | 8 |  |
| MYRCENE | 9 |  |
| ALPHA_OCIMENE | 10 |  |
| BETA_OCIMENE | 11 |  |
| ALPHA_PHELLANDRENE | 12 |  |
| ALPHA_PINENE | 13 |  |
| BETA_PINENE | 14 |  |
| ALPHA_TERPINEOL | 15 |  |
| ALPHA_TERPININE | 16 |  |
| GAMMA_TERPININE | 17 |  |
| TERPINOLENE | 18 |  |

<a name="opencannabis.structs.labtesting.TestMethod"></a>

### TestMethod
Specific test methods used to quantify or qualify certain properties or components of cannabis.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED_METHOD | 0 | &#39;Unspecified&#39; test method, indicating that we don&#39;t know what method was used to test with, or it was left unspecified. This is the default value. |
| GCMS | 1 | Gas Chromatography / Mass Spectrometry is used to identify specific compounds found within a sample. |
| LCMS | 2 | Liquid Chromatography / Mass Spectrometry is used to identify specific compounds found within a sample. Recommended for the most volatile compounds. |
| CLASSIC_PCR | 3 | Classic PCR is a qualitative and semi-quantitative genetic test that identifies the presense or absence of specific genes. |
| qPCR | 4 | Quantitative PCR is a genetic test that quantifies the amount of specific genes within a sample. |
| ELISA | 5 | ELISA, or enzyme-linked immunosorbent assay, is an antibody based test that is used to detect and quantify specific substances within the sample. |