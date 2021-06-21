---
domain: rfc.opencannabis.info
shortname: 9/OCS-X
name: OpenCannabis Proximity Extension
status: raw
editor: Randal Stevens <randy@bloombox.io>
contributors:
- Sam Gammon <sam@bloombox.io>
---

<a name="top"></a>

# OpenCannabis: Proximity Extension
- Version `1.0`
- Status: `RAW`

### Status of this Memo

This specification's current status is considered `RAW`, i.e. pre-`DRAFT`. Distribution of this memo is unlimited.

### Abstract

This document describes an extension to the _OpenCannabis Specification, version 1_, that introduces proximity-related
definitions structures, and services that compose, create and reference pricing.

_"Proximity"_ in this context, refers to:
- Bluetooth beacons
- Beacon locations
- Accuracy of the location


### Table of Contents
- [Protocol Definition](#Protocol-Definition): `proximity`: Bluetooth and GPS-related structures.
    - [BluetoothBeacon](#opencannabis.proximity.BluetoothBeacon)

----

<a name="proximity/BluetoothBeacon.proto"></a>

## Protocol Definition
### `opencannabis.proximity`

{% nomnoml %}

#fill: #d5e7ee; #8ebff2
[BluetoothBeacon
  | uuid:string
  | major:uint32
  | minor:uint32
  | seen:opencannabis.temporal.Instant
  | location:opencannabis.geo.Location
  | accuracy:opencannabis.geo.LocationAccuracy]

{% endnomnoml %}

### BluetoothBeacon
Specifies a Blutooth beacon signal, detected or emitted by a BLE device.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| uuid | [string](#string) |  | UUID for the device, as observed or broadcasted. |
| major | [uint32](#uint32) |  | &#39;Major&#39; value in the BLE signal. |
| minor | [uint32](#uint32) |  | &#39;Minor&#39; value in the BLE signal. |
| seen | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | Timestamp for when this beacon was witnessed. |
| location | [opencannabis.geo.Location](#opencannabis.geo.Location) |  | Location of the emitting or reporting (receiving) beacon. |
| accuracy | [opencannabis.geo.LocationAccuracy](#opencannabis.geo.LocationAccuracy) |  | Estimate as to the distance accuracy of this beacon. |
