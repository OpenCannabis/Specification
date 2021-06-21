---
domain: rfc.opencannabis.info
shortname: 9/OCS-O
name: OpenCannabis Oauth Extension
status: raw
editor: Randal Stevens <randy@bloombox.io>
contributors:
- Sam Gammon <sam@bloombox.io>
---

<a name="top"></a>

# OpenCannabis: Oauth Extension
- Version `1.0`
- Status: `RAW`

### Status of this Memo

This specification's current status is considered `RAW`, i.e. pre-`DRAFT`. Distribution of this memo is unlimited.

### Abstract

This document describes an extension to the _OpenCannabis Specification, version 1_, that introduces oauth-related
definitions structures, and services that compose, create and reference oath.

_"Oauth"_ in this context, refers to:
- The client who is authorizing the request I.E. Google
- The scope of the authorization



### Table of Contents
- [Protocol Definition](#Protocol-Definition): `oauth`: OAuth2 implementation structures.
    - [AuthorizationScope](#opencannabis.oauth.AuthorizationScope)
    - [Client](#opencannabis.oauth.Client)
    - [ClientID](#opencannabis.oauth.ClientID)
    - [ClientSecret](#opencannabis.oauth.ClientSecret)
      
----
## Protocol Definition
### `opencannabis.oauth`

{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[Client
  | client_id:string
  | client_secret:string]

[ClientID
  | id:string]

[ClientService
  | secret:string]

{% endnomnoml %}


<a name="oauth/Client.proto"></a>

### Client
Specifies an OAuth2-client that can perform authorization operations in certain circumstances.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| client_id | [string](#string) |  | ID for this OAuth2 client. |
| client_secret | [string](#string) |  | Secret (password) for this OAuth2 client. |


### ClientID
Independent ID structure for an OAuth2 client.

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | ID for the OAuth2 client. |


### ClientSecret
Independent secret value structure for an OAuth2 client.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| secret | [string](#string) |  | Secret value for the the OAuth2 client. |
