---
domain: rfc.ocpx.info
shortname: 7/OCS-L
parent: 3/OCS
name: Lab Testing
version: 2.0
status: RAW
package: opencannabis.labtesting
editor: Jordan Tyler <jordan.t@cookies.co>
sponsors:
- Cookies
contributors:
- Sam Arabian <sam.arabian@cookies.co>
- Sam Gammon <sam.g@cookies.co>
- Luis Madrigal <luis@cookies.co>
- Tim Samartino <tim@bloombox.io>
- Randy Stevens <randy@bloombox.io>
- Jordan Tyler <jordan.t@cookies.co>
---
<a name="top"></a>

# Data Specification: Lab Testing

![Status: Raw](https://img.shields.io/badge/Status%20%20-Raw-blueviolet)
![Domain: `rfc.ocpx.info`](https://img.shields.io/badge/Domain%20%20-rfc.ocpx.info-gray)
![Code: `7/OCS-L`](https://img.shields.io/badge/Code%20%20-7/OCS_L-gray)
![Version: `2.0`](https://img.shields.io/badge/Version%20%20-2.0-gray)
![Package: `opencannabis.labtesting`](https://img.shields.io/badge/Package%20%20-opencannabis.labtesting-gray)

### Status of this Memo

This specification's current status is considered `RAW`, i.e. pre-`DRAFT`. Distribution of this memo is unlimited.

### Table of Contents
- [Section 1: Abstract](#section-1-abstract)
  - [1.1: Structure of this specification](#11-structure-of-this-specification)
  - [1.2: Process and licensing](#12-process-and-licensing)
  - [1.3: Language](#13-language)
- [Section 2: Architecture](#section-2-architecture)
  - [2.1: Intended Audience](#21-intended-audience)
  - [2.2: Goals and anti-goals](#22-goals--anti-goals)
  - [2.3: Object structure](#23-object-structure)
  - [2.4: Flattened expression](#24-flattened-expression)
  - [2.5: Integrity guarantees](#25-integrity-guarantees)
  - [2.6: Data exchange](#26-data-exchange)
- [Section 3: Dialect definition](#section-3-dialect-definition)
  - [3.1: Flattened CSV and JSON-ND](#31-flattened-csv-and-json-nd)
  - [3.2: Proto-JSON](#32-proto-json)
  - [3.3: Encoded Protocol-Buffers](#33-encoded-protocol-buffers)
- [Section 4: Service Interfaces](#section-4-service-interfaces)
  - [4.1: `LabResultsFetchService`](#41-labresultsfetchservice):
    Lab-operated service, typically for use by brands or manufacturers, which enables pull-style delivery of lab test
    results.
  - [4.2: `LabResultsIngestService`](#42-labresultsingestservice):
    Brand-operated service, typically for use by labs, which enables push-style delivery of lab test results.
- [Section 5: Protocol Definition](#section-5-protocol-definition): `opencannabis.labtesting`


### Section 1: Abstract

This document describes an extension to the _OpenCannabis Specification_, which introduces lab-testing-related
definitions and structures, and services that facilitate easy transit of lab test results between trading partners
within the same supply chain.

_"Lab Testing"_ in this context, refers to the regulated laboratory testing of final cannabis goods, which are destined
for purchase by a consumer, to include:

- The chemical components that make up a cannabis product, and their measurements of concentration or presence, as
  applicable, particularly including both **cannabinoids** and **terpenes**.
- Product conditions or contaminants, including (but not limited to) moisture, mold, pesticides, heavy metals, and other
  materials or substances, as applicable.
- The methods and processes by which laboratory testing is performed, including error or variance rates, timestamps,
  chemical analysis techniques, and so forth.

#### 1.1: Structure of this specification

This specification makes reference to [3/OCS][../3/README.md], the main _OpenCannabis Specification_, and, by extension,
[1/C4][../1/README.md] and [2/COSS][../2/README.md] which define consensus-driven process for data specifications. It is
segmented into four portions:

- **Architecture.** Intended audience, goals, and anti-goals, rationale, and solution design.
- **Dialect definition.** Serialization and de-serialization for CSV, JSON-ND, and text or binary protocol buffers.
- **Protocol definition.** Object structures, referencing [3/OCS][3], which compose into higher-order services.
- **Service interfaces.** Data transit protocol over SFTP, gRPC, or REST.

#### 1.2: Process and licensing

This document is governed by the [2/COSS](../2/README.md) (*Consensus-Oriented Specification System*), and is published
via, and inspired by, the [Unprotocols RFC](https://github.com/unprotocols/rfc) structure, as part of the
_[OpenCannabis Specification](https://github.com/OpenCannabis)_. Changes may be proposed through
[GitHub](https://github.com/OpenCannabis), by filing an _Issue_ for bugs, enhancement requests, or ideas, and/or a
_Pull Request_, for a full change proposal. Please refer to `2/COSS` for more information about specification change
proposal, review, and ratification processes.

##### 1.2.1: Spec licensing as GNU GPLv3

The _OpenCannabis Specification_ itself - i.e., this document and any accompanying specification materials, including,
but not limited to, graphics, additional spec revisions or extensions, and so on, is licensed under the [GNU General
Public License](./LICENSE.md), version 3. This means additional work on this spec, or forks of this spec, **MUST** also
be kept open source and shared-alike with the community.

##### 1.2.2: Code licensing as Apache 2.0

Software written _to comply with_ or _make use of_ this spec does not have to be open source. For this reason, the
_actual code_ for the OpenCannabis specification is licensed under the
[Apache License](https://www.apache.org/licenses/LICENSE-2.0), version 2.0.


### 1.3: Language

The key words "**MUST**", "**MUST NOT**", "**REQUIRED**", "**SHALL**", "**SHALL NOT**", "**SHOULD**", "**SHOULD NOT**",
"**RECOMMENDED**", "**NOT RECOMMENDED**", "**MAY**", and "**OPTIONAL**" in this document are to be interpreted as
described in [BCP 14](https://tools.ietf.org/html/bcp14), [RFC 2119](http://tools.ietf.org/html/rfc2119), and
[RFC 8174](http://tools.ietf.org/html/rfc8174), when, and only when, they appear in all capitals, as shown here.

----
## Section 2: Architecture

This section is non-normative, and describes the intended audience, goals & anti-goals, and rationale that led to the
solution design presented herein. Defined key words are expressed in **BOLDED ALL CAPS** as defined in
[_§1.3 Language_](#13-language).


### 2.1: Intended Audience

The intended audiences for this document include:

- **Producer tech architects and implementors.**
  This includes individuals and teams working on behalf of **brands**, **manufacturers**, and **cultivators**, to
  facilitate the seamless transfer of test results with downstream supply chain partners. While cannabis testing usually
  occurs at the point of distribution, producers are the primary _stakeholder_ who may change course or take action
  based on the contents of the test result data.


- **Distributor tech architects and implementors.**
  This includes individuals and teams working on behalf of **distributors** to facilitate the seamless transfer of test
  results with both upstream (_producers_) and side-channel (_labs_) trading partners. Distributors are often
  responsible for product quarantine, and for facilitation of lab sample delivery. For producers without integrated
  digital systems, distributors often provide user interfaces to view or manage product inventory, including the
  consumption of COAs.


- **Laboratory directors, tech architects, and implementors.**
  This includes individuals charged with innovating in the cannabis lab testing space, and individuals and teams working
  for or on behalf of labs to deliver in-house systems such as LIMS (_Lab Information Management Software_), IaaS
  (_Integration as a Service_), or compliance reporting mechanisms.


- **LIMS (_Lab Information Management Software_) vendors and platforms.**
  This includes companies which produce LIMS offerings which are sold to labs. LIMS providers want to lower the total
  cost of integration with other platforms, appeal to customers on an integration/ecosystem basis, and supply migration
  tools to/from other LIMS software.


### 2.2: Goals & Anti-Goals

This specification is designed to offer a flexible, but standardized, structure and format for the expression of
cannabis laboratory test data. See below for the full set of defined **goals**, which are the desired outcomes of the
specification work, and **anti-goals**, which are specific items left out-of-scope, either to focus solutioning on
market painpoints or reduce consensus burden.


#### 2.2.1: Specification Goals

The following goals are proposed for this specification:

- **2.3.1.1: Data objects** for the expression of cannabis lab test data.

- **2.3.1.2: Service interfaces** for the exchange of cannabis lab test data.

- **2.3.1.3: Implementation advice** and best bractices for data exchange between labs and trading partners.

- **2.3.1.4: Key identifier resolution** and underlying registry services to facilitate open exchange, as applicable.

- **2.3.1.5: Test expression flexibility** to allow for the evolution and maturation of testing practices.


#### 2.2.2: Specification Anti-Goals

The following anti-goals are proposed for this specification:

- **2.3.2.1: Exhaustive enumeration** of all cannabinoids, terpenes, or contaminant compounds.

- **2.3.2.2: Identifier schemes** for COAs, samples, test results, and so forth.

- **2.3.2.3: End-user catalog** or data services.


### 2.3: Object structure

With regard to the object structure expressed in COA transfer payloads, the following specification provisions apply:

- **2.3.2.1: Objects MUST follow schemata** defined for use in lab transfer payloads, defined herein.

- **2.3.2.2: Object structure changes MUST be approved** for use via the OpenCannabis Project and related change
  management processes as defined herein via [_§1.2: Process and licensing_](#12-process-and-licensing).


### 2.4: Flattened expression

When expressed in flattened form, object records defined herein use dotted-path addressing to assign fields for each
successive record. Hierarchical objects are thus normalized into rows which can be rendered as CSV, JSON, or other
flat columnar formats.

_"Flattened expression"_ in the context of this specification refers to this process of flattening objects. We define a
protocol herein which enables arbitrary flattening of records, and further extends that flattened form into formatted
payloads in [_§3.1.4: Flattened CSV_](#314-flattened-csv) and [_§3.1.5: Flattened JSON-ND](#314-flattened-json-nd),
which augment structural formats such as binary protocol buffers and standard JSON.


### 2.5: Integrity guarantees

_Coming soon._


### 2.6: Data exchange

_Coming soon._


----
## Section 3: Dialect Definition

This section is non-normative, and describes dialects specifically tuned for the exchange of COAs representing certified
cannabis laboratory testing results. Defined key words are expressed in **BOLDED ALL CAPS** as defined in
[_§1.3 Language_](#13-language).


### 3.1: Flattened CSV and JSON-ND

For flattened object expressions which use columnar / tabular formats, this specification defines two formats:
_Flattened CSV_ and _Newline-Delimited JSON_.

The _Flattened CSV_ dialect expresses OpenCannabis lab testing data in regular _Comma-Separated Values_ form, with
columns carrying designated field key paths. Each key path is a dot-separated recursive concatenation, with encoding
beginning at a row-level entity (defined here as `LabCertificate`).

Similar to _Flattened CSV_, _JSON-ND_ uses the same property expression, with one flat object expressed per record, and
each object placed on a dedicated line. See below for a detailed description of the object flattening algorithm and
further encoding/decoding procedures.


#### 3.1.1: Model key paths

Introduced as part of this specification are _model key paths_, implemented by a new annotation packaged in `core`.


#### 3.1.2: Column names

To calculate column names for the _Flattened CSV_ dialect, start with a `LabCertificate` object schema, and then
implementors **SHOULD** perform the following algorithm for each filled in property on the object, recursively:

1) If the property is on the **root entity**, and is not itself a `Message` descendant, the `key_path` **MUST** become
   the column name without modification.

2) If the property is *not* on the root entity, and is therefore packaged under one or more `Message` descendants, the
   `key_path` **MUST** be set to the recursive concatenation of each `key_path` in the field's ancestry hierarchy, with
   each portion separated by a dot (`.`).

2) If the property expresses test results for cannabinoids or terpenes, corresponding data **MUST** be expressed
   pursuant to [_§3.1.3 Map-based expressions_](#313-map-based-expressions), with each compound mapping to a test
   result value.

3) Otherwise, as a general rule of thumb:
    - All primitive fields with values **MUST** be filled with the highest possible data resolution.
    - All sub-objects **MUST** be affixed as normal, but only if a value is present within the tree established by that
      field. Implementors **SHOULD NOT** set empty placeholder values.


##### Example column name calculation

This section is non-normative and shows an example calculation for flattened column or field names. Consider the
following protocol buffer message:
```protobuf
package sample;
//...

import "opencannabis/core/ocp.proto";


message SubRecordSample {
  // Sub primitive value sample.
  string name = 1 [(core.ocp).key_path = ".name"];
}

message DataRecordSample {
  // Primitive value sample.
  string id = 1 [(core.ocp).key_path = "id"];

  // Sub record sample.
  SubRecordSample sub = 2 [(core.ocp).key_path = "sub"];
}
```

The developer **MUST** make a choice for a **root entity**, which embodies the top-level record under expression.
`DataRecordSample` serves as the root entity in this example. The algorithm proceeds like so:

1) For each property in `DataRecordSample`
    1) For property `id`:
        1) Property is root-level, with a `key_path`, so it becomes: **`id`**
        2) The list of properties is appended to, to become: **`['id']`**
    2) For property `sub`:
        1) Property is root-level, with a `key_path`, so it becomes: **`sub`**
        2) Property is a sub-message type, so the algorithm recurses
        3) For each property in `SubRecordSample`:
            1) For property `name`:
                1) Property is non-root, with a `key_path`, so it becomes: **`sub.name`**
                2) The list of properties is appended to, to become: **`['id', 'sub.name']`**


Based on the above algorithm, given the following data object of type `DataRecordSample`:

```prototext
id: "ABC123"
sub {
  name: "Some name"
}
```

Corresponding flattened CSV output would look like the following:


| `id`     | `sub.name`     |
| :------- | :------------- |
| ABC123   | Some name      |


Corresponding flattened JSON-ND output would look like the following:

```json
{"id": "ABC123", "sub.name": "Some name"}
```

See the [JSON-ND](https://github.com/ndjson/ndjson-spec) specification for more information about newline-delimited JSON
data.


#### 3.1.3: Primitive scalar types

This specification leverages the standard scalar types included as part of Protocol Buffers, and therefore makes use of
native types in each language corresponding to the standard set.

The following principles were kept in mind while designing this model:

- All known compounds and states are defined via **enumerations** to support strong referential integrity
- All test measurement values are expressed as floating-point numbers, backed by `double` fields
- Where appropriate, flexibility is provided with `oneof`-based polymorphsim with `string` fields in lieu of
  enumerations

Requirements defined in this section:

- **3.1.3.1:** Test measurement values **MUST** use high resolution floating-point number types native to the language
  where implementation occurs.

- **3.1.3.2:** Lab test data implementation strategies **MUST** prefer enumerated compound identifiers, where available.

- **3.1.3.3:** All types eligible for flattening **MUST** annotate each primitive leaf field with a `key_path`.

- **3.1.3.4:** All types eligible for flattening **MUST** annotate each `Message` sub-record field with a `key_path`.

- **3.1.3.5:** Types eligible for flattening **MAY** omit a `key_path` to implicitly ignore a field for codec use.


#### 3.1.4: Flattened CSV

Flattened CSV is expressed as regular CSV, but with calculable column names and governing logic for types. In preceding
sections, key concepts are defined such as [_§3.1.1 Model key paths_](#311-model-key-paths),
[_§3.1.2 Column names_](#312-column-names), and [_§3.1.3 Primitive scalar types_](#313-primitive-scalar-types),
which are referred to herein.

Requirements defined in this section:

- **3.1.4a:** Lab test data expressed in flattened CSV **MUST** use regular CSV semantics, with a `.csv` file extension
  or `.tsv` file extension.

- **3.1.4b:** Lab test data expressed in flattened CSV **MUST** employ standards-compliant `UTF-8` encoding, in
  accordance with [IETF RFC-3629](https://datatracker.ietf.org/doc/html/rfc3629).

- **3.1.4c:** Lab test data expressed in flattened CSV **MUST** adhere to a maximum file size of `2GB`.

- **3.1.4d:** Lab test data expressed in flattened CSV **SHOULD** follow the general naming convention defined
  below, but implementors **MAY** elect to use any naming convention appropriate:

  File name format:
  ```
    <lab slug>-<batch>-<run id>.<ISO date>.coa-txfer.csv
  ```

  For example:
  ```
    dopelabs-12345-1.2021-01-01.coa-txfer.csv
  ```


##### 3.1.4.1: Encoding flattened CSV

When encoding flattened CSV, implementing code **MUST** use the flattened naming convention defined herein via
[_§3.1.2: Column names](#312-column-names) for field values defined as part of this specification. Implementors **MAY**
elect to include _additional_ fields, even proprietary fields, but any customized or proprietary columns **MUST** be
expressed after any included in the specification. In other words, additional fields are supported, but must be appended
to the expected set of columns, and **MUST NOT** collide with defined columns in this specification.

Requirements defined in this section:

- **3.1.4.1.1:** Lab test data expressed as flattened CSV **MUST** express flattened dot-path column names, as specified
  in [_§3.1.2: Column names](#312-column-names), as the first row of _each_ CSV data file.

- **3.1.4.1.2:** Implementors **MAY** include additional proprietary fields, but non-spec columns **MUST** be placed
  after standard specification columns.


##### 3.1.4.2: Decoding flattened CSV

When decoding flattened CSV, implementing code **MUST** ignore _additional or customized fields_. Upon encountering the
_first_ of any such proprietary entires, _all_ following entries **MUST** be considered proprietary or custom. Decoding
implementors **MUST** enforce the preceding requirement with a fatal error.

Requirements defined in this section:

- **3.1.4.2.1:** Lab test data decoded as flattened CSV **MUST** allow additional fields, and **MUST** enforce that such
  fields be expressed after all standardized specification fields.

- **3.1.4.2.2:** Lab test data decoded as flattened CSV **MUST** enforce that no collissions exist between specified
  columns and proprietary or custom columns.


##### 3.1.5: Flattened JSON-ND

_Newline-Delimited JSON_, or JSON-ND, refers to a specific dialect of _JavaScript Object Notation_ (JSON) which places
one full semantically-valid JSON object on each line in a multi-line file. While JSON-ND specifies unparseable standard
JSON by default, this format enables easy bulk _or_ streaming processing of records without relying on buffered
serialization.

Like _Flattened CSV_, this format leverages the main object flattening protocol defined herein. Flattened property
references map to values in a JSON object for each record, with each record expressed on a new line.

Requirements defined in this section:

- **3.1.5.1:** Lab test data expressed in JSON-ND **MUST** follow [NDJSON v1.0.0](https://github.com/ndjson/ndjson-spec)
  specification guidelines and semantics, and **MUST** use a `.json` extension.

- **3.1.5.2:** Lab test data expressed in flattened JSON-ND **MUST** employ standards-compliant `UTF-8` encoding, in
  accordance with [IETF RFC-3629](https://datatracker.ietf.org/doc/html/rfc3629).

- **3.1.5.3:** Lab test data expressed in flattened JSON-ND **MUST** adhere to a maximum file size of `2GB`.

- **3.1.5.4:** Lab test data expressed in flattened JSON-ND **SHOULD** follow a general naming convention defined
  below, but implementors **MAY** elect to use any naming convention appropriate:

  File name format:
  ```
    <lab slug>-<batch>-<run id>.<ISO date>.coa-txfer.json
  ```

  For example:
  ```
    dopelabs-12345-1.2021-01-01.coa-txfer.json
  ```


##### 3.1.5.1: Encoding JSON-ND

_Coming soon._


##### 3.1.5.2: Decoding JSON-ND

_Coming soon._


#### 3.1.6: Map-based expressions

_Coming soon._


### 3.2: Proto-JSON

_Coming soon._


### 3.3: Encoded Protocol Buffers

_Coming soon._


----
## Section 4: Service Interfaces

This section is normative, and describes the interfaces employed by online and offline services for the purposes of data
exchange between trading partners. In this case, these interfaces describe the exchange of cannabis lab result data,
arranged in either a _push_ or _pull_ methodology. Each exchange methodology facilitates a set of unary connections
between trading partners:

- Push:
  - Lab to distributor
  - Lab to producer
  - Distributor to producer
- Pull:
  - Distributor from lab
  - Producer from distributor
  - Producer from lab


### 4.1: `LabResultsFetchService`

The _Lab Results Fetch Service_ interface offers an implementation route for laboratories that wish to publish their
data in a pull-style interaction model, with data consumers (usually distributors or producers) fetching that data
on-demand or on a regular cadence.

To support these use cases, the following service architecture **MUST** adhere to the following requirements. This
section is normative and adheres to [_§3.1 Language_](#31-language) for all key terms, which are expressed in
**BOLD ALL CAPS**:

- **4.1.1:** Implementing laboratory partners **SHOULD** centrally register for an OID, which enables low-overhead
  expression via [standardized DID references](https://www.w3.org/TR/did-core/). Implementing labs **MAY** express their
  identity on a temporary basis using the `domain` field affixed to [`TestLabKey`](#opencannabis.labtesting.TestLabKey).

- **4.1.2:** Implementing laboratory partners **SHOULD** centrally register compliant API endpoints. When registered,
  API endpoints **MUST** declare support for any mix of JSON-REST, gRPC unary, gRPC streaming, or SFTP-based delivery.


### 4.2: `LabResultsIngestService`

The _Lab Results Ingest Service_ interface

----
## Section 5: Protocol Definition

This section is normative, and describes the object structures which compose into higher-order operations via the
[_§4 Service Interfaces_](#section-4-service-interfaces) section defined herein. Object structures proposed in this
specification are packaged in the `opencannabis.labtesting` package.

### `opencannabis.labtesting`
Specifies testing media, tested attributes, structure of results and so on. 

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

