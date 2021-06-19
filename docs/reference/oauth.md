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

<li><code>opencannabis/oauth/AuthorizationScope.proto</code></li>

<ul>
    <li><a href="#opencannabis.oauth.AuthorizationScope"><code>AuthorizationScope</code></a></li>
</ul><br />


<li><code>opencannabis/oauth/Client.proto</code></li>

<ul>
    <li><a href="#opencannabis.oauth.Client"><code>Client</code></a></li><li><a href="#opencannabis.oauth.Consent"><code>Consent</code></a></li><li><a href="#opencannabis.oauth.ConsentTicket"><code>ConsentTicket</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.oauth.GrantType"><code>GrantType</code></a></li><li><a href="#opencannabis.oauth.ResponseType"><code>ResponseType</code></a></li>
</ul><br />


</ul>




_________________



<a name="opencannabis/oauth/AuthorizationScope.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/oauth/AuthorizationScope.proto`

Provides a structure for the scope of authorization.

To import this module:

```proto
import "opencannabis/oauth/AuthorizationScope.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.oauth`     |
| **Bazel Target** | `//opencannabis.oauth`   |
|                  |                    |



<a name="opencannabis.oauth.AuthorizationScope"></a>

### Message: <code>AuthorizationScope</code> (`opencannabis.oauth.AuthorizationScope`)

Specifies a scope of authorization that may be granted, revoked, or otherwise addressed in some way by the
underlying authorization system during a consent or check transaction.

```proto
import "opencannabis/oauth/AuthorizationScope.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.oauth.AuthorizationScope field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `id` | [`string`](#string) | *None.* | Unique ID for this scope. |
| `label` | [`string`](#string) | *None.* | Human-friendly label for this scope. |
| `uri` | [`string`](#string) | *None.* | URL reference for this scope. |
| `icon` | [`string`](#string) | *None.* | Icon name for this scope. Optional. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/oauth/Client.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/oauth/Client.proto`

Provides a structure for the Oauth Client and tools for creating a permission based identity and enumerates grant
types.

To import this module:

```proto
import "opencannabis/oauth/Client.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.oauth`     |
| **Bazel Target** | `//opencannabis.oauth`   |
|                  |                    |



<a name="opencannabis.oauth.Client"></a>

### Message: <code>Client</code> (`opencannabis.oauth.Client`)

Specifies an OAuth2-client that can perform authorization operations in certain circumstances.

```proto
import "opencannabis/oauth/Client.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.oauth.Client field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `id` | [`string`](#string) | *None.* | ID for this OAuth2 client. |
| `secret` | [`string`](#string) | *None.* | Secret (password) for this OAuth2 client. |
| `name` | [`string`](#string) | *None.* | Name of the client. |
| `contact` | [`string`](#string) | repeated | Contact information for the client. |
| `grant_types` | [`GrantType`](#opencannabis.oauth.GrantType) | repeated | Grant types supported by this client. |
| `branding` | [`opencannabis.media.MediaItem`](#opencannabis.media.MediaItem) | *None.* | Attached media item for branding. |
| `owner` | [`string`](#string) | *None.* | Owner information for this client. |
| `policy` | [`opencannabis.media.MediaItem`](#opencannabis.media.MediaItem) | *None.* | Privacy policy URI. |
| `terms` | [`opencannabis.media.MediaItem`](#opencannabis.media.MediaItem) | *None.* | Terms of Service URI. |
| `public` | [`bool`](#bool) | *None.* | Whether this client is public or not. |
| `redirect_uri` | [`string`](#string) | repeated | Supported/allowed redirect URIs for this client. |
| `response_type` | [`ResponseType`](#opencannabis.oauth.ResponseType) | repeated | Supported OAuth2 response types for this client. |
| `scope` | [`AuthorizationScope`](#opencannabis.oauth.AuthorizationScope) | repeated | Allowed authorization scopes for this client. |







<a name="opencannabis.oauth.Consent"></a>

### Message: <code>Consent</code> (`opencannabis.oauth.Consent`)

Client/auth information regarding the consent application.

```proto
import "opencannabis/oauth/Client.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.oauth.Consent field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `id` | [`string`](#string) | *None.* | ID value of THIS indvidual request. |
| `client_id` | [`string`](#string) | *None.* | Client ID value. |
| `expires_at` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Expires-at value. |
| `redirect_uri` | [`string`](#string) | *None.* | Redirect URI. |
| `requested_scope` | [`string`](#string) | repeated | Requested scopes. |







<a name="opencannabis.oauth.ConsentTicket"></a>

### Message: <code>ConsentTicket</code> (`opencannabis.oauth.ConsentTicket`)

Specifies a ticket responding to a consent flow.

```proto
import "opencannabis/oauth/Client.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.oauth.ConsentTicket field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `client` | [`Client`](#opencannabis.oauth.Client) | *None.* | Specifies client information for this flow. |
| `consent` | [`Consent`](#opencannabis.oauth.Consent) | *None.* | Specifies consent information for this flow. |






<!-- end messages -->


<a name="opencannabis.oauth.GrantType"></a>

### Enumeration: <code>GrantType</code> (`opencannabis.oauth.GrantType`)

Enumerates OAuth2 grant types supportable by clients.

```proto
import "opencannabis/oauth/Client.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.oauth.GrantType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNSPECIFIED_GRANT_TYPE` | `0` | Unspecified, or unresolved, grant type. |
| `AUTHORIZATION_CODE` | `1` | 'authorzation_code' grant type. |
| `REFRESH_TOKEN` | `2` | 'refresh_token' grant type. |
| `CLIENT_CREDENTIALS` | `3` | 'client_credentials' grant type. |



<a name="opencannabis.oauth.ResponseType"></a>

### Enumeration: <code>ResponseType</code> (`opencannabis.oauth.ResponseType`)

Enumerates OAuth2 response types supportable by clients.

```proto
import "opencannabis/oauth/Client.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.oauth.ResponseType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNSPECIFIED_RESPONSE_TYPE` | `0` | Unspecified, or unresolved, response type. |
| `TOKEN` | `1` | 'token' response type. |
| `CODE` | `2` | 'code' response type. |
| `ID_TOKEN` | `3` | 'id_token' response type. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
