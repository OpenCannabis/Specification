# Protocol Documentation
<a name="top"></a>

---
Module: `module`
Package: `opencannabis.module`
Domain: rfc.opencannabis.info
---


## Reference Documentation

- [opencannabis/oauth/AuthorizationScope.proto](#opencannabis/oauth/AuthorizationScope.proto)
  - [AuthorizationScope](#opencannabis.oauth.AuthorizationScope)

- [opencannabis/oauth/Client.proto](#opencannabis/oauth/Client.proto)
  - [Client](#opencannabis.oauth.Client)
  - [Consent](#opencannabis.oauth.Consent)
  - [ConsentTicket](#opencannabis.oauth.ConsentTicket)

  - [GrantType](#opencannabis.oauth.GrantType)
  - [ResponseType](#opencannabis.oauth.ResponseType)





<a name="opencannabis/oauth/AuthorizationScope.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/oauth/AuthorizationScope.proto
Provides a structure for the scope of authorization.


<a name="opencannabis.oauth.AuthorizationScope"></a>

### AuthorizationScope
Specifies a scope of authorization that may be granted, revoked, or otherwise addressed in some way by the
underlying authorization system during a consent or check transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | Unique ID for this scope. |
| label | [string](#string) |  | Human-friendly label for this scope. |
| uri | [string](#string) |  | URL reference for this scope. |
| icon | [string](#string) |  | Icon name for this scope. Optional. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/oauth/Client.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/oauth/Client.proto
Provides a structure for the Oauth Client and tools for creating a permission based identity and enumerates grant
types.


<a name="opencannabis.oauth.Client"></a>

### Client
Specifies an OAuth2-client that can perform authorization operations in certain circumstances.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | ID for this OAuth2 client. |
| secret | [string](#string) |  | Secret (password) for this OAuth2 client. |
| name | [string](#string) |  | Name of the client. |
| contact | [string](#string) | repeated | Contact information for the client. |
| grant_types | [GrantType](#opencannabis.oauth.GrantType) | repeated | Grant types supported by this client. |
| branding | [opencannabis.media.MediaItem](#opencannabis.media.MediaItem) |  | Attached media item for branding. |
| owner | [string](#string) |  | Owner information for this client. |
| policy | [opencannabis.media.MediaItem](#opencannabis.media.MediaItem) |  | Privacy policy URI. |
| terms | [opencannabis.media.MediaItem](#opencannabis.media.MediaItem) |  | Terms of Service URI. |
| public | [bool](#bool) |  | Whether this client is public or not. |
| redirect_uri | [string](#string) | repeated | Supported/allowed redirect URIs for this client. |
| response_type | [ResponseType](#opencannabis.oauth.ResponseType) | repeated | Supported OAuth2 response types for this client. |
| scope | [AuthorizationScope](#opencannabis.oauth.AuthorizationScope) | repeated | Allowed authorization scopes for this client. |






<a name="opencannabis.oauth.Consent"></a>

### Consent
Client/auth information regarding the consent application.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | ID value of THIS indvidual request. |
| client_id | [string](#string) |  | Client ID value. |
| expires_at | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | Expires-at value. |
| redirect_uri | [string](#string) |  | Redirect URI. |
| requested_scope | [string](#string) | repeated | Requested scopes. |






<a name="opencannabis.oauth.ConsentTicket"></a>

### ConsentTicket
Specifies a ticket responding to a consent flow.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| client | [Client](#opencannabis.oauth.Client) |  | Specifies client information for this flow. |
| consent | [Consent](#opencannabis.oauth.Consent) |  | Specifies consent information for this flow. |





<!-- end messages -->


<a name="opencannabis.oauth.GrantType"></a>

### GrantType
Enumerates OAuth2 grant types supportable by clients.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED_GRANT_TYPE | 0 | Unspecified, or unresolved, grant type. |
| AUTHORIZATION_CODE | 1 | 'authorzation_code' grant type. |
| REFRESH_TOKEN | 2 | 'refresh_token' grant type. |
| CLIENT_CREDENTIALS | 3 | 'client_credentials' grant type. |



<a name="opencannabis.oauth.ResponseType"></a>

### ResponseType
Enumerates OAuth2 response types supportable by clients.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED_RESPONSE_TYPE | 0 | Unspecified, or unresolved, response type. |
| TOKEN | 1 | 'token' response type. |
| CODE | 2 | 'code' response type. |
| ID_TOKEN | 3 | 'id_token' response type. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
