# Protocol Documentation
<a name="top"></a>

---
Module: `module`
Package: `opencannabis.module`
Domain: rfc.opencannabis.info
---


## Reference Documentation

- [opencannabis/contact/EmailAddress.proto](#opencannabis/contact/EmailAddress.proto)
  - [EmailAddress](#opencannabis.contact.EmailAddress)

- [opencannabis/contact/PhoneNumber.proto](#opencannabis/contact/PhoneNumber.proto)
  - [PhoneNumber](#opencannabis.contact.PhoneNumber)

- [opencannabis/contact/Website.proto](#opencannabis/contact/Website.proto)
  - [Website](#opencannabis.contact.Website)

- [opencannabis/contact/ContactInfo.proto](#opencannabis/contact/ContactInfo.proto)
  - [ContactInfo](#opencannabis.contact.ContactInfo)
  - [SocialInfo](#opencannabis.contact.SocialInfo)
  - [SocialInfo.SocialProfile](#opencannabis.contact.SocialInfo.SocialProfile)

  - [SocialInfo.SocialProvider](#opencannabis.contact.SocialInfo.SocialProvider)





<a name="opencannabis/contact/EmailAddress.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/contact/EmailAddress.proto
Provides a structured record to store email addresses.


<a name="opencannabis.contact.EmailAddress"></a>

### EmailAddress
Specifies information about an electronic mail (email) address, and optionally, its validation status.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| address | [string](#string) |  | Email address, in standard format ('example@sample.com'). |
| validated | [bool](#bool) |  | Validation status. Usable by providers to indicate an email address that has already been validated, or that an address remains unvalidated. |
| name | [string](#string) |  | Display name for the email address, if known/specified. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/contact/PhoneNumber.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/contact/PhoneNumber.proto
Provides a structured record that specifies an E164-formatted telephone number.


<a name="opencannabis.contact.PhoneNumber"></a>

### PhoneNumber
Payload that specifies a phone number, and any additional information to be carried with it (including verification
state, if applicable).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| e164 | [string](#string) |  | E164-formatted telephone number. |
| validated | [bool](#bool) |  | Validation status. Usable by providers to indicate a phone number that has already been validated, or that a phone number remains unvalidated. |
| display | [string](#string) |  | Display text for this phone number, if applicable. |
| text_capable | [bool](#bool) |  | Whether the phone number in question is known to be capable of receiving or sending SMS messages. |
| voice_capable | [bool](#bool) |  | Whether the phone number in question is known to be capable of receiving or sending voice calls. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/contact/Website.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/contact/Website.proto
Record to store and express a website link.


<a name="opencannabis.contact.Website"></a>

### Website
Specifies a structure that describes a URI/website, and related information.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| uri | [string](#string) |  | URI for the website. |
| title | [string](#string) |  | Title from the HTML page at URI. |
| icon | [bytes](#bytes) |  | Favicon raw bytes from the HTML page at URI. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/contact/ContactInfo.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/contact/ContactInfo.proto
Specifies combined contact information for a given record.


<a name="opencannabis.contact.ContactInfo"></a>

### ContactInfo
Contact information for a person, organization, or other entity.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| location | [opencannabis.geo.Location](#opencannabis.geo.Location) |  | Geographic location and physical mail contact information. |
| phone | [PhoneNumber](#opencannabis.contact.PhoneNumber) |  | Telephone contact information. |
| email | [EmailAddress](#opencannabis.contact.EmailAddress) |  | Electronic mail contact information. |
| website | [Website](#opencannabis.contact.Website) |  | Website contact information. |






<a name="opencannabis.contact.SocialInfo"></a>

### SocialInfo
Specifies social profile URLs for a given entity, person, or organization.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| profile | [SocialInfo.SocialProfile](#opencannabis.contact.SocialInfo.SocialProfile) | repeated | Profile listings for a given entity or person. |






<a name="opencannabis.contact.SocialInfo.SocialProfile"></a>

### SocialInfo.SocialProfile
Specifies the notion of an individual social profile, for a given provider.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| known | [SocialInfo.SocialProvider](#opencannabis.contact.SocialInfo.SocialProvider) |  | Known social account provider. |
| custom | [string](#string) |  | Custom social account provider. |
| username | [string](#string) |  | Profile ID/username. |
| url | [Website](#opencannabis.contact.Website) |  | Full URL to the profile. |





<!-- end messages -->


<a name="opencannabis.contact.SocialInfo.SocialProvider"></a>

### SocialInfo.SocialProvider
Enumerates known social providers.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED_SOCIAL_PROVIDER | 0 | Indicates an un-enumerated social provider. |
| FACEBOOK | 1 | Social profile on Facebook. |
| TWITTER | 2 | Social profile on Twitter. |
| INSTAGRAM | 3 | Social profile on Instagram. |
| YOUTUBE | 4 | Social profile on YouTube. |
| LEAFLY | 5 | Social profile on Leafly. |
| WEEDMAPS | 6 | Social profile on WeedMaps. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
