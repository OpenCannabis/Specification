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

<li><code>opencannabis/contact/EmailAddress.proto</code></li>

<ul>
    <li><a href="#opencannabis.contact.EmailAddress"><code>EmailAddress</code></a></li>
</ul><br />


<li><code>opencannabis/contact/PhoneNumber.proto</code></li>

<ul>
    <li><a href="#opencannabis.contact.PhoneNumber"><code>PhoneNumber</code></a></li>
</ul><br />


<li><code>opencannabis/contact/Website.proto</code></li>

<ul>
    <li><a href="#opencannabis.contact.Website"><code>Website</code></a></li>
</ul><br />


<li><code>opencannabis/contact/ContactInfo.proto</code></li>

<ul>
    <li><a href="#opencannabis.contact.ContactInfo"><code>ContactInfo</code></a></li><li><a href="#opencannabis.contact.SocialInfo"><code>SocialInfo</code></a></li><li><a href="#opencannabis.contact.SocialInfo.SocialProfile"><code>SocialInfo.SocialProfile</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.contact.SocialInfo.SocialProvider"><code>SocialInfo.SocialProvider</code></a></li>
</ul><br />


</ul>




_________________



<a name="opencannabis/contact/EmailAddress.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/contact/EmailAddress.proto`

Provides a structured record to store email addresses.

To import this module:

```proto
import "opencannabis/contact/EmailAddress.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.contact`     |
| **Bazel Target** | `//opencannabis.contact`   |
|                  |                    |



<a name="opencannabis.contact.EmailAddress"></a>

### Message: <code>EmailAddress</code> (`opencannabis.contact.EmailAddress`)

Specifies information about an electronic mail (email) address, and optionally, its validation status.

```proto
import "opencannabis/contact/EmailAddress.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.contact.EmailAddress field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `address` | [`string`](#string) | *None.* | Email address, in standard format ('example@sample.com'). |
| `validated` | [`bool`](#bool) | *None.* | Validation status. Usable by providers to indicate an email address that has already been validated, or that an address remains unvalidated. |
| `name` | [`string`](#string) | *None.* | Display name for the email address, if known/specified. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/contact/PhoneNumber.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/contact/PhoneNumber.proto`

Provides a structured record that specifies an E164-formatted telephone number.

To import this module:

```proto
import "opencannabis/contact/PhoneNumber.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.contact`     |
| **Bazel Target** | `//opencannabis.contact`   |
|                  |                    |



<a name="opencannabis.contact.PhoneNumber"></a>

### Message: <code>PhoneNumber</code> (`opencannabis.contact.PhoneNumber`)

Payload that specifies a phone number, and any additional information to be carried with it (including verification
state, if applicable).

```proto
import "opencannabis/contact/PhoneNumber.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.contact.PhoneNumber field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `e164` | [`string`](#string) | *None.* | E164-formatted telephone number. |
| `validated` | [`bool`](#bool) | *None.* | Validation status. Usable by providers to indicate a phone number that has already been validated, or that a phone number remains unvalidated. |
| `display` | [`string`](#string) | *None.* | Display text for this phone number, if applicable. |
| `text_capable` | [`bool`](#bool) | *None.* | Whether the phone number in question is known to be capable of receiving or sending SMS messages. |
| `voice_capable` | [`bool`](#bool) | *None.* | Whether the phone number in question is known to be capable of receiving or sending voice calls. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/contact/Website.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/contact/Website.proto`

Record to store and express a website link.

To import this module:

```proto
import "opencannabis/contact/Website.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.contact`     |
| **Bazel Target** | `//opencannabis.contact`   |
|                  |                    |



<a name="opencannabis.contact.Website"></a>

### Message: <code>Website</code> (`opencannabis.contact.Website`)

Specifies a structure that describes a URI/website, and related information.

```proto
import "opencannabis/contact/Website.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.contact.Website field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `uri` | [`string`](#string) | *None.* | URI for the website. |
| `title` | [`string`](#string) | *None.* | Title from the HTML page at URI. |
| `icon` | [`bytes`](#bytes) | *None.* | Favicon raw bytes from the HTML page at URI. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/contact/ContactInfo.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/contact/ContactInfo.proto`

Specifies combined contact information for a given record.

To import this module:

```proto
import "opencannabis/contact/ContactInfo.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.contact`     |
| **Bazel Target** | `//opencannabis.contact`   |
|                  |                    |



<a name="opencannabis.contact.ContactInfo"></a>

### Message: <code>ContactInfo</code> (`opencannabis.contact.ContactInfo`)

Contact information for a person, organization, or other entity.

```proto
import "opencannabis/contact/ContactInfo.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.contact.ContactInfo field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `location` | [`opencannabis.geo.Location`](#opencannabis.geo.Location) | *None.* | Geographic location and physical mail contact information. |
| `phone` | [`PhoneNumber`](#opencannabis.contact.PhoneNumber) | *None.* | Telephone contact information. |
| `email` | [`EmailAddress`](#opencannabis.contact.EmailAddress) | *None.* | Electronic mail contact information. |
| `website` | [`Website`](#opencannabis.contact.Website) | *None.* | Website contact information. |







<a name="opencannabis.contact.SocialInfo"></a>

### Message: <code>SocialInfo</code> (`opencannabis.contact.SocialInfo`)

Specifies social profile URLs for a given entity, person, or organization.

```proto
import "opencannabis/contact/ContactInfo.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.contact.SocialInfo field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `profile` | [`SocialInfo.SocialProfile`](#opencannabis.contact.SocialInfo.SocialProfile) | repeated | Profile listings for a given entity or person. |







<a name="opencannabis.contact.SocialInfo.SocialProfile"></a>

### Message: <code>SocialInfo.SocialProfile</code> (`opencannabis.contact.SocialInfo.SocialProfile`)

Specifies the notion of an individual social profile, for a given provider.

```proto
import "opencannabis/contact/ContactInfo.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.contact.SocialInfo.SocialProfile field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `known` | [`SocialInfo.SocialProvider`](#opencannabis.contact.SocialInfo.SocialProvider) | *None.* | Known social account provider. |
| `custom` | [`string`](#string) | *None.* | Custom social account provider. |
| `username` | [`string`](#string) | *None.* | Profile ID/username. |
| `url` | [`Website`](#opencannabis.contact.Website) | *None.* | Full URL to the profile. |






<!-- end messages -->


<a name="opencannabis.contact.SocialInfo.SocialProvider"></a>

### Enumeration: <code>SocialInfo.SocialProvider</code> (`opencannabis.contact.SocialInfo.SocialProvider`)

Enumerates known social providers.

```proto
import "opencannabis/contact/ContactInfo.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.contact.SocialInfo.SocialProvider enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNSPECIFIED_SOCIAL_PROVIDER` | `0` | Indicates an un-enumerated social provider. |
| `FACEBOOK` | `1` | Social profile on Facebook. |
| `TWITTER` | `2` | Social profile on Twitter. |
| `INSTAGRAM` | `3` | Social profile on Instagram. |
| `YOUTUBE` | `4` | Social profile on YouTube. |
| `LEAFLY` | `5` | Social profile on Leafly. |
| `WEEDMAPS` | `6` | Social profile on WeedMaps. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
