# Protocol Documentation
<a name="top"></a>

---
Module: `module`
Package: `opencannabis.module`
Domain: rfc.opencannabis.info
---


## Reference Documentation

- [opencannabis/person/PersonName.proto](#opencannabis/person/PersonName.proto)
  - [PersonName](#opencannabis.person.PersonName)

- [opencannabis/person/Person.proto](#opencannabis/person/Person.proto)
  - [CustomPronouns](#opencannabis.person.CustomPronouns)
  - [Gender](#opencannabis.person.Gender)
  - [Person](#opencannabis.person.Person)

  - [GenderCategory](#opencannabis.person.GenderCategory)
  - [KnownPronouns](#opencannabis.person.KnownPronouns)





<a name="opencannabis/person/PersonName.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/person/PersonName.proto
Provides structures related to a persons name.


<a name="opencannabis.person.PersonName"></a>

### PersonName
Represents a human being's name, in the style of "given" name (first) and "family" name (last) being concatenated to
form a full person's name. Additional names, like middle names, etc, are also specified here.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| full_name | [string](#string) |  | Person's full name, if a fulltext value should override. |
| first_name | [string](#string) |  | Person's given, or first, name. |
| last_name | [string](#string) |  | Person's family, or last, name. |
| middle_name | [string](#string) |  | Person's middle name. |
| prefix | [string](#string) |  | Prefix for a person's name. |
| postfix | [string](#string) |  | Postfix for a person's name. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/person/Person.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/person/Person.proto
Provides structures related to a person and all their characteristics. As well as enumerating gender.


<a name="opencannabis.person.CustomPronouns"></a>

### CustomPronouns
Describes a set of custom pronouns, detailing how to address the user.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| nominative | [string](#string) |  | Describes the 'nominative' (subject) form of this pronoun, in lowercase. |
| objective | [string](#string) |  | Describes the 'objective' (object) form of this pronoun, in lowercase. |
| determiner | [string](#string) |  | Describes the 'possessive determiner' form of this pronoun, in lowercase. |
| pronoun | [string](#string) |  | Describes the 'possessive pronoun' form of this pronoun, in lowercase. |
| reflexive | [string](#string) |  | Describes the 'reflexive' form of this pronoun. |






<a name="opencannabis.person.Gender"></a>

### Gender
Describes the pronouns that should be used when addressing a person.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| gender | [GenderCategory](#opencannabis.person.GenderCategory) |  | Describes the gender this person was assigned at birth, as applicable. |
| known | [KnownPronouns](#opencannabis.person.KnownPronouns) |  | The user has made a selection from the known list of pronouns. |
| custom | [CustomPronouns](#opencannabis.person.CustomPronouns) |  | The user has specified custom pronouns. |






<a name="opencannabis.person.Person"></a>

### Person
A person/patient and their name, legal name, nickname, etc.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [PersonName](#opencannabis.person.PersonName) |  | Person's primary name information. |
| legal_name | [PersonName](#opencannabis.person.PersonName) |  | Person's legal name, if it differs from their primary name. |
| alternate_name | [PersonName](#opencannabis.person.PersonName) |  | Person's optional alternate name. |
| contact | [opencannabis.contact.ContactInfo](#opencannabis.contact.ContactInfo) |  | Person's contact information. |
| date_of_birth | [opencannabis.temporal.Date](#opencannabis.temporal.Date) |  | Date of birth. |
| gender | [Gender](#opencannabis.person.Gender) |  | User's selected or described gender information. |





<!-- end messages -->


<a name="opencannabis.person.GenderCategory"></a>

### GenderCategory
Genders that a user may be.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED | 0 | Unspecified gender. |
| MALE | 1 | Cis-male (alias for backwards compatibility). |
| CIS_MALE | 1 | Cis-male. |
| FEMALE | 2 | Cis-female (alias for backwards compatibility). |
| CIS_FEMALE | 2 | Cis-female. |
| TRANS_MALE | 3 | Trans-gender male. |
| TRANS_FEMALE | 4 | Trans-gender female. |
| NON_BINARY | 5 | Non-binary. |
| GENDER_FLUID | 6 | Gender-fluid. |
| BI_GENDER | 7 | Bi-gender. |
| PAN_GENDER | 8 | Pan-gender. |
| DECLINE_TO_STATE | 99 | Other. |



<a name="opencannabis.person.KnownPronouns"></a>

### KnownPronouns
Enumerates known pronoun sets to the system.

| Name | Number | Description |
| ---- | ------ | ----------- |
| NORMATIVE | 0 | The user does not have a non-normative pronoun selection. |
| HE | 1 | The user prefers to be addressed as 'he/him'. |
| SHE | 2 | The user prefers to be addressed as 'she/her'. |
| IT | 3 | The user prefers to be addressed as 'it'. |
| THEY | 4 | The user prefers to be addressed as 'they'. |
| NE | 5 | The user prefers to be addressed as 'ne/nir'. |
| VE | 6 | The user prefers to be addressed as 've/ver'. |
| SPIVAK | 7 | The user prefers to be addressed as 'ey/em'. |
| ZE | 8 | The user prefers to be addressed as 'ze/zir'. |
| XE | 9 | The user prefers to be addressed as 'xe/xem'. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
