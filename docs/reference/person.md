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

<li><code>opencannabis/person/PersonName.proto</code></li>

<ul>
    <li><a href="#opencannabis.person.PersonName"><code>PersonName</code></a></li>
</ul><br />


<li><code>opencannabis/person/Person.proto</code></li>

<ul>
    <li><a href="#opencannabis.person.CustomPronouns"><code>CustomPronouns</code></a></li><li><a href="#opencannabis.person.Gender"><code>Gender</code></a></li><li><a href="#opencannabis.person.Person"><code>Person</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.person.GenderCategory"><code>GenderCategory</code></a></li><li><a href="#opencannabis.person.KnownPronouns"><code>KnownPronouns</code></a></li>
</ul><br />


</ul>




_________________



<a name="opencannabis/person/PersonName.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/person/PersonName.proto`

Provides structures related to a persons name.

To import this module:

```proto
import "opencannabis/person/PersonName.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.person`     |
| **Bazel Target** | `//opencannabis.person`   |
|                  |                    |



<a name="opencannabis.person.PersonName"></a>

### Message: <code>PersonName</code> (`opencannabis.person.PersonName`)

Represents a human being's name, in the style of "given" name (first) and "family" name (last) being concatenated to
form a full person's name. Additional names, like middle names, etc, are also specified here.

```proto
import "opencannabis/person/PersonName.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.person.PersonName field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `full_name` | [`string`](#string) | *None.* | Person's full name, if a fulltext value should override. |
| `first_name` | [`string`](#string) | *None.* | Person's given, or first, name. |
| `last_name` | [`string`](#string) | *None.* | Person's family, or last, name. |
| `middle_name` | [`string`](#string) | *None.* | Person's middle name. |
| `prefix` | [`string`](#string) | *None.* | Prefix for a person's name. |
| `postfix` | [`string`](#string) | *None.* | Postfix for a person's name. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/person/Person.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/person/Person.proto`

Provides structures related to a person and all their characteristics. As well as enumerating gender.

To import this module:

```proto
import "opencannabis/person/Person.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.person`     |
| **Bazel Target** | `//opencannabis.person`   |
|                  |                    |



<a name="opencannabis.person.CustomPronouns"></a>

### Message: <code>CustomPronouns</code> (`opencannabis.person.CustomPronouns`)

Describes a set of custom pronouns, detailing how to address the user.

```proto
import "opencannabis/person/Person.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.person.CustomPronouns field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `nominative` | [`string`](#string) | *None.* | Describes the 'nominative' (subject) form of this pronoun, in lowercase. |
| `objective` | [`string`](#string) | *None.* | Describes the 'objective' (object) form of this pronoun, in lowercase. |
| `determiner` | [`string`](#string) | *None.* | Describes the 'possessive determiner' form of this pronoun, in lowercase. |
| `pronoun` | [`string`](#string) | *None.* | Describes the 'possessive pronoun' form of this pronoun, in lowercase. |
| `reflexive` | [`string`](#string) | *None.* | Describes the 'reflexive' form of this pronoun. |







<a name="opencannabis.person.Gender"></a>

### Message: <code>Gender</code> (`opencannabis.person.Gender`)

Describes the pronouns that should be used when addressing a person.

```proto
import "opencannabis/person/Person.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.person.Gender field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `gender` | [`GenderCategory`](#opencannabis.person.GenderCategory) | *None.* | Describes the gender this person was assigned at birth, as applicable. |
| `known` | [`KnownPronouns`](#opencannabis.person.KnownPronouns) | *None.* | The user has made a selection from the known list of pronouns. |
| `custom` | [`CustomPronouns`](#opencannabis.person.CustomPronouns) | *None.* | The user has specified custom pronouns. |







<a name="opencannabis.person.Person"></a>

### Message: <code>Person</code> (`opencannabis.person.Person`)

A person/patient and their name, legal name, nickname, etc.

```proto
import "opencannabis/person/Person.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.person.Person field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `name` | [`PersonName`](#opencannabis.person.PersonName) | *None.* | Person's primary name information. |
| `legal_name` | [`PersonName`](#opencannabis.person.PersonName) | *None.* | Person's legal name, if it differs from their primary name. |
| `alternate_name` | [`PersonName`](#opencannabis.person.PersonName) | *None.* | Person's optional alternate name. |
| `contact` | [`opencannabis.contact.ContactInfo`](#opencannabis.contact.ContactInfo) | *None.* | Person's contact information. |
| `date_of_birth` | [`opencannabis.temporal.Date`](#opencannabis.temporal.Date) | *None.* | Date of birth. |
| `gender` | [`Gender`](#opencannabis.person.Gender) | *None.* | User's selected or described gender information. |






<!-- end messages -->


<a name="opencannabis.person.GenderCategory"></a>

### Enumeration: <code>GenderCategory</code> (`opencannabis.person.GenderCategory`)

Genders that a user may be.

```proto
import "opencannabis/person/Person.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.person.GenderCategory enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNSPECIFIED` | `0` | Unspecified gender. |
| `MALE` | `1` | Cis-male (alias for backwards compatibility). |
| `CIS_MALE` | `1` | Cis-male. |
| `FEMALE` | `2` | Cis-female (alias for backwards compatibility). |
| `CIS_FEMALE` | `2` | Cis-female. |
| `TRANS_MALE` | `3` | Trans-gender male. |
| `TRANS_FEMALE` | `4` | Trans-gender female. |
| `NON_BINARY` | `5` | Non-binary. |
| `GENDER_FLUID` | `6` | Gender-fluid. |
| `BI_GENDER` | `7` | Bi-gender. |
| `PAN_GENDER` | `8` | Pan-gender. |
| `DECLINE_TO_STATE` | `99` | Other. |



<a name="opencannabis.person.KnownPronouns"></a>

### Enumeration: <code>KnownPronouns</code> (`opencannabis.person.KnownPronouns`)

Enumerates known pronoun sets to the system.

```proto
import "opencannabis/person/Person.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.person.KnownPronouns enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `NORMATIVE` | `0` | The user does not have a non-normative pronoun selection. |
| `HE` | `1` | The user prefers to be addressed as 'he/him'. |
| `SHE` | `2` | The user prefers to be addressed as 'she/her'. |
| `IT` | `3` | The user prefers to be addressed as 'it'. |
| `THEY` | `4` | The user prefers to be addressed as 'they'. |
| `NE` | `5` | The user prefers to be addressed as 'ne/nir'. |
| `VE` | `6` | The user prefers to be addressed as 've/ver'. |
| `SPIVAK` | `7` | The user prefers to be addressed as 'ey/em'. |
| `ZE` | `8` | The user prefers to be addressed as 'ze/zir'. |
| `XE` | `9` | The user prefers to be addressed as 'xe/xem'. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
