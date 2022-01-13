# `opencannabis.labtesting`: Protocol Reference
<a name="top"></a>

The OpenCannabis `labtesting` module is designed to express cannabis lab test result data in high resolution, with
integrity guarantees built-in.

| Key               | Value                         |
| :---------------- | :---------------------------- |
| **Module**        | `opencannabis.labtesting`     |
| **Bazel Package** | `//opencannabis/labtesting`   |

## Table of Contents

<ul>

<li><code>opencannabis/labtesting/TestValue.proto</code></li>

<ul>
    <li><a href="#opencannabis.labtesting.TestError"><code>TestError</code></a></li><li><a href="#opencannabis.labtesting.TestMedia"><code>TestMedia</code></a></li><li><a href="#opencannabis.labtesting.TestValue"><code>TestValue</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.labtesting.TestErrorType"><code>TestErrorType</code></a></li><li><a href="#opencannabis.labtesting.TestMediaType"><code>TestMediaType</code></a></li><li><a href="#opencannabis.labtesting.TestValueType"><code>TestValueType</code></a></li>
</ul><br />


<li><code>opencannabis/labtesting/TestResults.proto</code></li>

<ul>
    <li><a href="#opencannabis.labtesting.Cannabinoids"><code>Cannabinoids</code></a></li><li><a href="#opencannabis.labtesting.Cannabinoids.MeasurementsEntry"><code>Cannabinoids.MeasurementsEntry</code></a></li><li><a href="#opencannabis.labtesting.Cannabinoids.Result"><code>Cannabinoids.Result</code></a></li><li><a href="#opencannabis.labtesting.Contaminants"><code>Contaminants</code></a></li><li><a href="#opencannabis.labtesting.Metals"><code>Metals</code></a></li><li><a href="#opencannabis.labtesting.Metals.MeasurementsEntry"><code>Metals.MeasurementsEntry</code></a></li><li><a href="#opencannabis.labtesting.Moisture"><code>Moisture</code></a></li><li><a href="#opencannabis.labtesting.MoldMildew"><code>MoldMildew</code></a></li><li><a href="#opencannabis.labtesting.MoldMildew.MeasurementsEntry"><code>MoldMildew.MeasurementsEntry</code></a></li><li><a href="#opencannabis.labtesting.OtherContaminants"><code>OtherContaminants</code></a></li><li><a href="#opencannabis.labtesting.OtherContaminants.MeasurementsEntry"><code>OtherContaminants.MeasurementsEntry</code></a></li><li><a href="#opencannabis.labtesting.Pesticides"><code>Pesticides</code></a></li><li><a href="#opencannabis.labtesting.Pesticides.MeasurementsEntry"><code>Pesticides.MeasurementsEntry</code></a></li><li><a href="#opencannabis.labtesting.Terpenes"><code>Terpenes</code></a></li><li><a href="#opencannabis.labtesting.Terpenes.MeasurementsEntry"><code>Terpenes.MeasurementsEntry</code></a></li><li><a href="#opencannabis.labtesting.Terpenes.Result"><code>Terpenes.Result</code></a></li><li><a href="#opencannabis.labtesting.TestCoordinates"><code>TestCoordinates</code></a></li><li><a href="#opencannabis.labtesting.TestProcess"><code>TestProcess</code></a></li><li><a href="#opencannabis.labtesting.TestResults"><code>TestResults</code></a></li><li><a href="#opencannabis.labtesting.TestSuite"><code>TestSuite</code></a></li><li><a href="#opencannabis.labtesting.TestTimestamps"><code>TestTimestamps</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.labtesting.TestMethod"><code>TestMethod</code></a></li>
</ul><br />


<li><code>opencannabis/labtesting/Terpenes.proto</code></li>

<ul>
    <li><a href="#opencannabis.labtesting.Terpene"><code>Terpene</code></a></li>
</ul><br />


<li><code>opencannabis/labtesting/Cannabinoids.proto</code></li>

<ul>
    <li><a href="#opencannabis.labtesting.Cannabinoid"><code>Cannabinoid</code></a></li><li><a href="#opencannabis.labtesting.CannabinoidRatio"><code>CannabinoidRatio</code></a></li>
</ul><br />


<li><code>opencannabis/labtesting/COA.proto</code></li>

<ul>
    <li><a href="#opencannabis.labtesting.CertificateIdentifiers"><code>CertificateIdentifiers</code></a></li><li><a href="#opencannabis.labtesting.LabCertificate"><code>LabCertificate</code></a></li><li><a href="#opencannabis.labtesting.TestingLab"><code>TestingLab</code></a></li><li><a href="#opencannabis.labtesting.TestingLabKey"><code>TestingLabKey</code></a></li>
</ul><br />


</ul>




_________________



<a name="opencannabis/labtesting/TestValue.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/labtesting/TestValue.proto`

Provides structures related to the testing process and results in regards to the cannabis plant. Enumerates value
types and testing types.

To import this module:

```proto
import "opencannabis/labtesting/TestValue.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.labtesting`     |
| **Bazel Target** | `//opencannabis.labtesting`   |
|                  |                    |



<a name="opencannabis.labtesting.TestError"></a>

### Message: <code>TestError</code> (`opencannabis.labtesting.TestError`)

Specifies the degree of uncertainty that arises during testing and consists of the type of error being reported along
with the error value. See more information at:
https://www.nde-ed.org/GeneralResources/ErrorAnalysis/UncertaintyTerms.htm

```proto
import "opencannabis/labtesting/TestValue.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.TestError field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `type` | [`TestErrorType`](#opencannabis.labtesting.TestErrorType) | *None.* | Represents the type of error, if it is measurable. |
| `value` | [`double`](#double) | *None.* | Represents the value of the error, if it is measurable. |







<a name="opencannabis.labtesting.TestMedia"></a>

### Message: <code>TestMedia</code> (`opencannabis.labtesting.TestMedia`)

Specifies media acting as verification for testing.

```proto
import "opencannabis/labtesting/TestValue.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.TestMedia field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `type` | [`TestMediaType`](#opencannabis.labtesting.TestMediaType) | *None.* | Represents the testing media type. |
| `media_item` | [`opencannabis.media.MediaItem`](#opencannabis.media.MediaItem) | *None.* | Represents the location of the test media. |







<a name="opencannabis.labtesting.TestValue"></a>

### Message: <code>TestValue</code> (`opencannabis.labtesting.TestValue`)

Specifies the value of the test, its type of measurement, and the error value and type if applicable.

```proto
import "opencannabis/labtesting/TestValue.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.TestValue field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `type` | [`TestValueType`](#opencannabis.labtesting.TestValueType) | *None.* | Represents the type of value of the test. |
| `error` | [`TestError`](#opencannabis.labtesting.TestError) | *None.* | Represents the error information. |
| `measurement` | [`double`](#double) | *None.* | Represents the value of the test. |
| `present` | [`bool`](#bool) | *None.* | Represents if a value is present in the test or not. |






<!-- end messages -->


<a name="opencannabis.labtesting.TestErrorType"></a>

### Enumeration: <code>TestErrorType</code> (`opencannabis.labtesting.TestErrorType`)

Specifies the different types of testing error that may be reported: percent error, absolute error, and
relative error.

```proto
import "opencannabis/labtesting/TestValue.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.labtesting.TestErrorType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `PERCENT` | `0` | Represents a percent error type. |
| `ABSOLUTE` | `1` | Represents an absolute error type. |
| `RELATIVE` | `2` | Represents a relative error type. |



<a name="opencannabis.labtesting.TestMediaType"></a>

### Enumeration: <code>TestMediaType</code> (`opencannabis.labtesting.TestMediaType`)

Specifies the different types of testing media that may be generated to act as verification of testing.

```proto
import "opencannabis/labtesting/TestValue.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.labtesting.TestMediaType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `CERTIFICATE` | `0` | Represents a Certificate of Authenticity. |
| `RESULTS` | `1` | Represents a set of results from a test. |
| `PRODUCT_IMAGE` | `2` | Represents a product image. |



<a name="opencannabis.labtesting.TestValueType"></a>

### Enumeration: <code>TestValueType</code> (`opencannabis.labtesting.TestValueType`)

-- Testing: Base (Shared) Protocol

```proto
import "opencannabis/labtesting/TestValue.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.labtesting.TestValueType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `MILLIGRAMS` | `0` | Represents a test value in milligrams (mg). |
| `PERCENTAGE` | `1` | Represents a test value in percent of volume (%). |
| `PRESENCE` | `2` | Represents a cannabinoid type is present at all (BOOLEAN). |
| `MILLIGRAMS_PER_GRAM` | `3` | Represents a test value in milligrams-per-gram (mg/g). |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/labtesting/TestResults.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/labtesting/TestResults.proto`

Empirical laboratory product testing structures and definitions. Provides support for cannabinoid testing, terpene
testing, pesticide testing, moisture ratings, and subjective testing.

To import this module:

```proto
import "opencannabis/labtesting/TestResults.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.labtesting`     |
| **Bazel Target** | `//opencannabis.labtesting`   |
|                  |                    |



<a name="opencannabis.labtesting.Cannabinoids"></a>

### Message: <code>Cannabinoids</code> (`opencannabis.labtesting.Cannabinoids`)

Specifies test results with regard to cannabinoid compounds, enumerated in `Cannabinoid`. THC and CBD testing is
elevated to a dedicated spot in test results due to its notability as a consumer decision-making signal.

```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.Cannabinoids field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `thc` | [`TestValue`](#opencannabis.labtesting.TestValue) | *None.* | THC testing value. |
| `cbd` | [`TestValue`](#opencannabis.labtesting.TestValue) | *None.* | CBD testing value. |
| `results` | [`Cannabinoids.Result`](#opencannabis.labtesting.Cannabinoids.Result) | repeated | Individual results payloads for other cannabinoids. |
| `measurements` | [`Cannabinoids.MeasurementsEntry`](#opencannabis.labtesting.Cannabinoids.MeasurementsEntry) | repeated | Mapped measurement values, where each key is a member of the `Cannabinoid` enumeration instance. Each value is an individual test result which relates to the cannabinoid selected as a key. |
| `ratio` | [`CannabinoidRatio`](#opencannabis.labtesting.CannabinoidRatio) | *None.* | Overall THC to CBD ratio, calculated if underlying data is available. |







<a name="opencannabis.labtesting.Cannabinoids.MeasurementsEntry"></a>

### Message: <code>Cannabinoids.MeasurementsEntry</code> (`opencannabis.labtesting.Cannabinoids.MeasurementsEntry`)



```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.Cannabinoids.MeasurementsEntry field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `key` | [`string`](#string) | *None.* |  |
| `value` | [`TestValue`](#opencannabis.labtesting.TestValue) | *None.* |  |







<a name="opencannabis.labtesting.Cannabinoids.Result"></a>

### Message: <code>Cannabinoids.Result</code> (`opencannabis.labtesting.Cannabinoids.Result`)

Individual payload for a cannabinoid test result.

```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.Cannabinoids.Result field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `cannabinoid` | [`Cannabinoid`](#opencannabis.labtesting.Cannabinoid) | *None.* | Cannabinoid this result is expressing results for. |
| `measurement` | [`TestValue`](#opencannabis.labtesting.TestValue) | *None.* | Measurement value for this individual result. |







<a name="opencannabis.labtesting.Contaminants"></a>

### Message: <code>Contaminants</code> (`opencannabis.labtesting.Contaminants`)

Test results for contaminants which indicate presence/absence of a compound along with a value (if available)

```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.Contaminants field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `pesticides` | [`Pesticides`](#opencannabis.labtesting.Pesticides) | *None.* | Pesticide-specific test results. Indicates a pesticide reading, by chemical compound name, and a reading value. |
| `metals` | [`Metals`](#opencannabis.labtesting.Metals) | *None.* | Heavy metal specific test results. Indicates a heavy metal reading, by chemical compound name, along with a reading value. |
| `mold_mildew` | [`MoldMildew`](#opencannabis.labtesting.MoldMildew) | *None.* | Mold and mildew specific test results. Indicates a mold or mildew reading, by species name, along with a reading value. |
| `other_contaminants` | [`OtherContaminants`](#opencannabis.labtesting.OtherContaminants) | *None.* | Place to store other contaminants that may be found in cannabis, including, but not limited to: glass, sand, detergents, etc. |







<a name="opencannabis.labtesting.Metals"></a>

### Message: <code>Metals</code> (`opencannabis.labtesting.Metals`)

Specifies results of heavy metal testing.

```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.Metals field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `metal_free` | [`bool`](#bool) | *None.* | Flag indicating the product is heavy-metal-free. |
| `measurements` | [`Metals.MeasurementsEntry`](#opencannabis.labtesting.Metals.MeasurementsEntry) | repeated | Measurements for specific, named, heavy metal values. |







<a name="opencannabis.labtesting.Metals.MeasurementsEntry"></a>

### Message: <code>Metals.MeasurementsEntry</code> (`opencannabis.labtesting.Metals.MeasurementsEntry`)



```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.Metals.MeasurementsEntry field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `key` | [`string`](#string) | *None.* |  |
| `value` | [`TestValue`](#opencannabis.labtesting.TestValue) | *None.* |  |







<a name="opencannabis.labtesting.Moisture"></a>

### Message: <code>Moisture</code> (`opencannabis.labtesting.Moisture`)

Specifies test result structure for product moisture level testing.

```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.Moisture field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `measurement` | [`TestValue`](#opencannabis.labtesting.TestValue) | *None.* | Measurement for the moisture level of the subject product. |







<a name="opencannabis.labtesting.MoldMildew"></a>

### Message: <code>MoldMildew</code> (`opencannabis.labtesting.MoldMildew`)

Specifies results of mold/mildew testing.

```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.MoldMildew field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `mold_mildew_free` | [`bool`](#bool) | *None.* | Flag indicating the product is mold/mildew free. |
| `measurements` | [`MoldMildew.MeasurementsEntry`](#opencannabis.labtesting.MoldMildew.MeasurementsEntry) | repeated | Measurements for specific, named, mold/mildew values. |







<a name="opencannabis.labtesting.MoldMildew.MeasurementsEntry"></a>

### Message: <code>MoldMildew.MeasurementsEntry</code> (`opencannabis.labtesting.MoldMildew.MeasurementsEntry`)



```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.MoldMildew.MeasurementsEntry field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `key` | [`string`](#string) | *None.* |  |
| `value` | [`TestValue`](#opencannabis.labtesting.TestValue) | *None.* |  |







<a name="opencannabis.labtesting.OtherContaminants"></a>

### Message: <code>OtherContaminants</code> (`opencannabis.labtesting.OtherContaminants`)

Specifies generic results for other types of contaminant testing.

```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.OtherContaminants field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `measurements` | [`OtherContaminants.MeasurementsEntry`](#opencannabis.labtesting.OtherContaminants.MeasurementsEntry) | repeated | Measurements for generic, labeled, contaminant values. |







<a name="opencannabis.labtesting.OtherContaminants.MeasurementsEntry"></a>

### Message: <code>OtherContaminants.MeasurementsEntry</code> (`opencannabis.labtesting.OtherContaminants.MeasurementsEntry`)



```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.OtherContaminants.MeasurementsEntry field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `key` | [`string`](#string) | *None.* |  |
| `value` | [`TestValue`](#opencannabis.labtesting.TestValue) | *None.* |  |







<a name="opencannabis.labtesting.Pesticides"></a>

### Message: <code>Pesticides</code> (`opencannabis.labtesting.Pesticides`)

Specifies results of pesticide testing.

```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.Pesticides field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `pesticide_free` | [`bool`](#bool) | *None.* | Flag indicating the product is pesticide free. |
| `measurements` | [`Pesticides.MeasurementsEntry`](#opencannabis.labtesting.Pesticides.MeasurementsEntry) | repeated | Measurements for specific, named, pesticides. |







<a name="opencannabis.labtesting.Pesticides.MeasurementsEntry"></a>

### Message: <code>Pesticides.MeasurementsEntry</code> (`opencannabis.labtesting.Pesticides.MeasurementsEntry`)



```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.Pesticides.MeasurementsEntry field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `key` | [`string`](#string) | *None.* |  |
| `value` | [`TestValue`](#opencannabis.labtesting.TestValue) | *None.* |  |







<a name="opencannabis.labtesting.Terpenes"></a>

### Message: <code>Terpenes</code> (`opencannabis.labtesting.Terpenes`)

Specifies the structure of terpene testing. Includes space for a full set of terpene test result values, and
corresponding values (computed) for estimated feelings and tasting notes.

```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.Terpenes field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `available` | [`bool`](#bool) | *None.* | Flag indicating whether terpene testing is available yet or not. |
| `terpene` | [`Terpenes.Result`](#opencannabis.labtesting.Terpenes.Result) | repeated | Individual terpene testing results. |
| `measurements` | [`Terpenes.MeasurementsEntry`](#opencannabis.labtesting.Terpenes.MeasurementsEntry) | repeated | Mapped measurement values, where each key is a member of the `Terpene` enumeration instance. Each value is an individual test result which relates to the terpene compound selected as a key. |







<a name="opencannabis.labtesting.Terpenes.MeasurementsEntry"></a>

### Message: <code>Terpenes.MeasurementsEntry</code> (`opencannabis.labtesting.Terpenes.MeasurementsEntry`)



```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.Terpenes.MeasurementsEntry field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `key` | [`string`](#string) | *None.* |  |
| `value` | [`Terpenes.Result`](#opencannabis.labtesting.Terpenes.Result) | *None.* |  |







<a name="opencannabis.labtesting.Terpenes.Result"></a>

### Message: <code>Terpenes.Result</code> (`opencannabis.labtesting.Terpenes.Result`)

Specifies the structure of an individual terpene testing result.

```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.Terpenes.Result field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `terpene` | [`Terpene`](#opencannabis.labtesting.Terpene) | *None.* | Terpene this test result is for. |
| `measurement` | [`TestValue`](#opencannabis.labtesting.TestValue) | *None.* | Measured value of the terpene in question for the subject product. |







<a name="opencannabis.labtesting.TestCoordinates"></a>

### Message: <code>TestCoordinates</code> (`opencannabis.labtesting.TestCoordinates`)

Specifies coordinate values for a given lab testing result. This consists of 'zones' (i.e. floors, greenhouses), 
made up of 'batches' (i.e. rooms, sections), containing 'lots' (i.e. rows, trays) of individual plants or products.

```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.TestCoordinates field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `zone` | [`string`](#string) | *None.* | Specifies the 'zone' value for a set of test results. This is usually used as/by a floor or greenhouse ID. |
| `lot` | [`string`](#string) | *None.* | Specifies the 'lot' value for a set of test results. This is usually used as/by a room or section ID. |
| `batch` | [`string`](#string) | *None.* | Specifies the 'batch' value for a set of test results. This is usually used as/by a row or tray ID for individual plants or test sample products. |
| `region` | [`string`](#string) | *None.* | Assigned region code, as a three-character ISO notation, plus a region enumeration instance. |
| `sample_id` | [`string`](#string) | *None.* | Unique ID given to the sample that was tested. This may represent individual plants or products, grouped lots or batches, or even random selections from entire zones. |
| `sample_name` | [`string`](#string) | *None.* | Assigned name for the sample, which generally includes the strain name. |
| `certificate_id` | [`string`](#string) | *None.* | Assigned ID for the certificate of authenticity which corresponds with this set of results. |







<a name="opencannabis.labtesting.TestProcess"></a>

### Message: <code>TestProcess</code> (`opencannabis.labtesting.TestProcess`)

Describes the process that was performed to arrive at a given test result, including the testing method, default
test type, and default test error or variance. Most use contexts for this record involve setting defaults which may
be overridden by individual tests.

```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.TestProcess field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `method` | [`TestMethod`](#opencannabis.labtesting.TestMethod) | *None.* | Method employed for testing. Establishes a default for all test results, and can be overridden on an individual test level. |
| `type` | [`TestValueType`](#opencannabis.labtesting.TestValueType) | *None.* | Type of value produced by this testing process. Establishes a default for all test results, and can be overridden on an individual test level. |
| `error` | [`TestError`](#opencannabis.labtesting.TestError) | *None.* | Describes the range or breadth of error capable from a given test process or method, as it relates to a specific test result or body of results. Establishes a default for all test results, and can be overridden on an individual test level. |







<a name="opencannabis.labtesting.TestResults"></a>

### Message: <code>TestResults</code> (`opencannabis.labtesting.TestResults`)

Lab testing results for a given product. Includes cannabinoid, terpene, pesticide, moisture, and subjective testing
properties. Only cannabinoid testing is considered required.

```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.TestResults field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `available` | [`bool`](#bool) | *None.* | Boolean flag indicating whether results are available for lab testing at all. |
| `media` | [`TestMedia`](#opencannabis.labtesting.TestMedia) | repeated | Media attached to a set of lab results. This might include images taken during testing, documents (such as PDFs) specifying test results, and so on. |
| `timestamps` | [`TestTimestamps`](#opencannabis.labtesting.TestTimestamps) | *None.* | Describes timestamps which relate to this test run or related set of test results. |
| `coordinates` | [`TestCoordinates`](#opencannabis.labtesting.TestCoordinates) | *None.* | Coordinate, or ID values, for this set of test results. When specified at the top-level of a set of lab tests, indicates the coordinates for the active set of test results. |
| `cannabinoids` | [`Cannabinoids`](#opencannabis.labtesting.Cannabinoids) | *None.* | Standard cannabinoid testing, with reading results at least for THC and CBD, and optionally additional cannabinoid compounds. |
| `terpenes` | [`Terpenes`](#opencannabis.labtesting.Terpenes) | *None.* | Testing for terpene volatiles, which might indicate aroma or flavor notes. |
| `contaminants` | [`Contaminants`](#opencannabis.labtesting.Contaminants) | *None.* | Contaminants that may be present within the sample. |
| `moisture` | [`Moisture`](#opencannabis.labtesting.Moisture) | *None.* | Moisture rating and test results. |
| `data` | [`TestResults`](#opencannabis.labtesting.TestResults) | repeated | Raw test result data, stored under a master set of test results. Only one level of nesting is allowed. |







<a name="opencannabis.labtesting.TestSuite"></a>

### Message: <code>TestSuite</code> (`opencannabis.labtesting.TestSuite`)

Structure for a test suite - which contains the item being tested for, the method used to produce the results,
the value of the results, and any comments.

```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.TestSuite field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `method` | [`TestMethod`](#opencannabis.labtesting.TestMethod) | *None.* | Method used to obtain the test result. |
| `results` | [`TestResults`](#opencannabis.labtesting.TestResults) | *None.* | Result of the test. |
| `comments` | [`string`](#string) | *None.* | String containing any comments about the test. |







<a name="opencannabis.labtesting.TestTimestamps"></a>

### Message: <code>TestTimestamps</code> (`opencannabis.labtesting.TestTimestamps`)

Describes notable timestamps for a given test run and related set of test results.

```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.TestTimestamps field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `last_updated` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Last-updated value for these lab test results. Updated each time the record is updated. |
| `sealed` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Precise moment that these results were considered 'sealed' and returned. Once this timestamp is set, a given set of test results (unique by their coordinates) is considered immutable. |
| `issued` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Describes the timestamp indicating when test results were initially issued. |
| `performed` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Describes the timestamp indicating when the test was actually physically performed. |
| `completed` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Describes the timestamp indicating when the test was actually physically completed. |






<!-- end messages -->


<a name="opencannabis.labtesting.TestMethod"></a>

### Enumeration: <code>TestMethod</code> (`opencannabis.labtesting.TestMethod`)

Specific test methods used to quantify or qualify certain properties or components of cannabis.

```proto
import "opencannabis/labtesting/TestResults.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.labtesting.TestMethod enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNSPECIFIED_METHOD` | `0` | 'Unspecified' test method, indicating that we don't know what method was used to test with, or it was left unspecified. This is the default value. |
| `GCMS` | `1` | Gas Chromatography / Mass Spectrometry is used to identify specific compounds found within a sample. |
| `LCMS` | `2` | Liquid Chromatography / Mass Spectrometry is used to identify specific compounds found within a sample. Recommended for the most volatile compounds. |
| `CLASSIC_PCR` | `3` | Classic PCR is a qualitative and semi-quantitative genetic test that identifies the presence or absence of specific genes. |
| `Q_PCR` | `4` | Quantitative PCR is a genetic test that quantifies the amount of specific genes within a sample. |
| `ELISA` | `5` | ELISA, or enzyme-linked immunosorbent assay, is an antibody based test that is used to detect and quantify specific substances within the sample. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/labtesting/Terpenes.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/labtesting/Terpenes.proto`

Enumerate and define concepts related to *terpenes,* which are volatile chemicals that can affect the aroma (taste or
smell) of a given cannabis product. Each terpene known or supported by the system is enumerated herein, along with
definitions for ancillary data structures, as applicable.

To import this module:

```proto
import "opencannabis/labtesting/Terpenes.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.labtesting`     |
| **Bazel Target** | `//opencannabis.labtesting`   |
|                  |                    |


<!-- end messages -->


<a name="opencannabis.labtesting.Terpene"></a>

### Enumeration: <code>Terpene</code> (`opencannabis.labtesting.Terpene`)

Enumerates known terpene compounds. Terpenes are volatile chemical compounds that define the taste and aroma (flavor,
smell, etc), and in some manners, the psychokinetic experience of cannabis in flower, concentrate, edible, preroll or
cartridge form.

```proto
import "opencannabis/labtesting/Terpenes.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.labtesting.Terpene enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `CAMPHENE` | `0` | Camphene. |
| `CARENE` | `1` | Carene. |
| `BETA_CARYOPHYLLENE` | `2` | Beta-caryophyllene. |
| `CARYOPHYLLENE_OXIDE` | `3` | Caryophyllene-oxide. |
| `EUCALYPTOL` | `4` | Eucalyptol. |
| `FENCHOL` | `5` | Fenchol. |
| `ALPHA_HUMULENE` | `6` | Alpha-humulene. |
| `LIMONENE` | `7` | Limonene. |
| `LINALOOL` | `8` | Linalool. |
| `MYRCENE` | `9` | Myrcene. |
| `ALPHA_OCIMENE` | `10` | Alpha-ocimene. |
| `BETA_OCIMENE` | `11` | Beta-ocimene. |
| `ALPHA_PHELLANDRENE` | `12` | Alpha-phellandrene. |
| `ALPHA_PINENE` | `13` | Alpha-pinene. |
| `BETA_PINENE` | `14` | Beta-pinene. |
| `ALPHA_TERPINEOL` | `15` | Alpha-terpineol. |
| `ALPHA_TERPININE` | `16` | Alpha-terpinine. |
| `GAMMA_TERPININE` | `17` | Gamma-terpinine. |
| `TERPINOLENE` | `18` | Terpinolene. |
| `VALENCENE` | `19` | Valencene. |
| `GERANIOL` | `20` | Geraniol. |
| `PHELLANDRENE` | `21` | Phellandrene. |
| `BORNEOL` | `22` | Borneol. |
| `ISOBORNEOL` | `23` | Isoborneol. |
| `BISABOLOL` | `24` | Bisabolol. |
| `PHYTOL` | `25` | Phytol. |
| `SABINENE` | `26` | Sabinene. |
| `CAMPHOR` | `27` | Camphor. |
| `MENTHOL` | `28` | Menthol. |
| `CEDRENE` | `29` | Cedrene. |
| `NEROL` | `30` | Nerol. |
| `NEROLIDOL` | `31` | Nerolidol. |
| `GUAIOL` | `32` | Guaiol. |
| `ISOPULEGOL` | `33` | Isopulegol. |
| `GERANYL_ACETATE` | `34` | Geranyl-acetate. |
| `CYMENE` | `35` | Cymene. |
| `PULEGONE` | `36` | Pulegone. |
| `CINEOLE` | `37` | Cineole. |
| `FENCHONE` | `38` | Fenchone. |
| `TERPINENE` | `39` | Terpinene. |
| `CITRONELLOL` | `40` | Citronellol. |
| `DELTA_3_CARENE` | `41` | Delta-3-carene. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/labtesting/Cannabinoids.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/labtesting/Cannabinoids.proto`

Provides definitions and enumerations related specifically to compounds classified as cannabinoids. This includes an
enumeration of all cannabinoid compounds known or supported by the system. Cannabinoid ratios and other ancillary
definitions (but still related to cannabinoids) can be found here.

To import this module:

```proto
import "opencannabis/labtesting/Cannabinoids.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.labtesting`     |
| **Bazel Target** | `//opencannabis.labtesting`   |
|                  |                    |


<!-- end messages -->


<a name="opencannabis.labtesting.Cannabinoid"></a>

### Enumeration: <code>Cannabinoid</code> (`opencannabis.labtesting.Cannabinoid`)

Enumerates available cannabinoid compounds, that generally show up in test results related to cannabis.

```proto
import "opencannabis/labtesting/Cannabinoids.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.labtesting.Cannabinoid enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `THC` | `0` | THC. |
| `THC_A` | `1` | THC-a. |
| `THC_V` | `2` | THC-v. |
| `THC_VA` | `3` | THC-va. |
| `THC_8` | `4` | THC-8. |
| `THC_9` | `5` | THC-9. |
| `CBD` | `10` | CBD. |
| `CBD_A` | `11` | CBD-a. |
| `CBD_V` | `12` | CBD-v. |
| `CBD_VA` | `13` | CBD-va. |
| `CBC` | `20` | CBC. |
| `CBC_A` | `21` | CBC-a. |
| `CBG` | `30` | CBG. |
| `CBG_A` | `31` | CBG-a. |
| `CBN` | `40` | CBN. |
| `CBN_A` | `41` | CBN-a. |
| `CBV` | `50` | CBV. |
| `CBV_A` | `51` | CBV-a. |
| `TAC` | `60` | TAC. |
| `CBL` | `70` | CBL. |
| `CBL_A` | `71` | CBL-a. |



<a name="opencannabis.labtesting.CannabinoidRatio"></a>

### Enumeration: <code>CannabinoidRatio</code> (`opencannabis.labtesting.CannabinoidRatio`)

Enumerates available cannabinoid ratio states. This value is computed from the THC and CBD test results, if
available, and expresses the general (low-resolution) ratio between those two values, which are the most important in
cannabis test result data.

```proto
import "opencannabis/labtesting/Cannabinoids.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.labtesting.CannabinoidRatio enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `NO_CANNABINOID_PREFERENCE` | `0` | No cannabinoid dominance. |
| `THC_ONLY` | `1` | Majority THC or only THC. |
| `THC_OVER_CBD` | `2` | THC majority, with a minority of CBD. |
| `EQUAL` | `3` | Equal THC and CBD content. |
| `CBD_OVER_THC` | `4` | CBD majority, with a minority of THC. |
| `CBD_ONLY` | `5` | Majority CBD or only CBD. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/labtesting/COA.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/labtesting/COA.proto`

Laboratory testing documentation records which correspond with Certificates of Authenticity (abbreviated as "COA").
COAs are commonplace and are usually certified by state regulators.

To import this module:

```proto
import "opencannabis/labtesting/COA.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.labtesting`     |
| **Bazel Target** | `//opencannabis.labtesting`   |
|                  |                    |



<a name="opencannabis.labtesting.CertificateIdentifiers"></a>

### Message: <code>CertificateIdentifiers</code> (`opencannabis.labtesting.CertificateIdentifiers`)

Identifiers carried by a Certificate of Authenticity.

```proto
import "opencannabis/labtesting/COA.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.CertificateIdentifiers field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `sample_code` | [`string`](#string) | *None.* | Code or ID assigned to the sample that was tested. |
| `sample_name` | [`string`](#string) | *None.* | Name assigned to the sample that was tested. |
| `batch_id` | [`string`](#string) | *None.* | ID assigned to the batch which produced the material which was tested. |
| `certificate_id` | [`string`](#string) | *None.* | ID assigned to this issuance of a COA. |







<a name="opencannabis.labtesting.LabCertificate"></a>

### Message: <code>LabCertificate</code> (`opencannabis.labtesting.LabCertificate`)

Record which describes the structure of a Certificate of Authenticity from a cannabis testing laboratory. COAs carry
information about the material tested, the testing process, the test results, and the lab that performed the testing.

```proto
import "opencannabis/labtesting/COA.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.LabCertificate field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `lab` | [`TestingLab`](#opencannabis.labtesting.TestingLab) | *None.* | Testing lab which performed the testing, and issued this COA. |
| `identifiers` | [`TestCoordinates`](#opencannabis.labtesting.TestCoordinates) | *None.* | Unique identifiers assigned to this COA. |
| `product` | [`opencannabis.base.ProductKey`](#opencannabis.base.ProductKey) | *None.* | Key uniquely identifying the product which was tested as part of this run. |
| `stamp` | [`TestTimestamps`](#opencannabis.labtesting.TestTimestamps) | *None.* | Describes timestamps relevant to this individual test run and related certificate. |
| `certificate` | [`opencannabis.media.MediaKey`](#opencannabis.media.MediaKey) | *None.* | Media reference to the document issued to certify this set of test results. The COA document is usually in PDF form and sealed from modification after issuance. |
| `method` | [`TestProcess`](#opencannabis.labtesting.TestProcess) | *None.* | Describes the process, method, and default set of type configuration |
| `cannabinoids` | [`Cannabinoids`](#opencannabis.labtesting.Cannabinoids) | *None.* | Cannabinoid test results, describing levels or percentages of THC, CBD, etc., present or not present, and if so, potentially with a value described by the testing type. |
| `terpenes` | [`Terpenes`](#opencannabis.labtesting.Terpenes) | *None.* | Terpene test results, describing levels of aromatic compounds present or not present, and if so, potentially with a value described by the testing type. |







<a name="opencannabis.labtesting.TestingLab"></a>

### Message: <code>TestingLab</code> (`opencannabis.labtesting.TestingLab`)

Record that describes a known/registered and sanctioned cannabis testing laboratory. Each lab is identified by a
unique key which carries their OID and/or domain.

```proto
import "opencannabis/labtesting/COA.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.TestingLab field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `key` | [`TestingLabKey`](#opencannabis.labtesting.TestingLabKey) | *None.* | Key uniquely identifying this testing lab. |
| `name` | [`string`](#string) | *None.* | Human-readable label which uniquely identifies this testing lab. |







<a name="opencannabis.labtesting.TestingLabKey"></a>

### Message: <code>TestingLabKey</code> (`opencannabis.labtesting.TestingLabKey`)

Unique key that identifies a registered and sanctioned cannabis testing laboratory.

```proto
import "opencannabis/labtesting/COA.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.labtesting.TestingLabKey field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `oid` | [`uint32`](#uint32) | *None.* | Assigned OID, if known. |
| `domain` | [`string`](#string) | *None.* | Identifying domain. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
