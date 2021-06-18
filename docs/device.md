# Protocol Documentation
<a name="top"></a>

---
Module: `module`
Package: `opencannabis.module`
Domain: rfc.opencannabis.info
---


## Reference Documentation

- [opencannabis/device/Device.proto](#opencannabis/device/Device.proto)
  - [Device](#opencannabis.device.Device)
  - [DeviceCredentials](#opencannabis.device.DeviceCredentials)
  - [DeviceFlags](#opencannabis.device.DeviceFlags)

  - [DeviceType](#opencannabis.device.DeviceType)





<a name="opencannabis/device/Device.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/device/Device.proto
Provides a structure for device types and credentials and enumerates device types.


<a name="opencannabis.device.Device"></a>

### Device
Specifies a structure that describes a known device.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| uuid | [string](#string) |  | Universally unique identifier for this device. |
| type | [DeviceType](#opencannabis.device.DeviceType) |  | Type of this device. |
| flags | [DeviceFlags](#opencannabis.device.DeviceFlags) |  | Flags for this device. |
| key | [DeviceCredentials](#opencannabis.device.DeviceCredentials) |  | Credentials for this device. |






<a name="opencannabis.device.DeviceCredentials"></a>

### DeviceCredentials
Credentials that assert a device's identity or authorization.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| public_key | [bytes](#bytes) |  | Raw bytes for a device's public key. |
| private_key | [bytes](#bytes) |  | Raw bytes for the device's private key. |
| sha256 | [string](#string) |  | SHA256 hash of this device's public key. |
| identity | [string](#string) |  | A device's raw identity payload. |
| authorities | [bytes](#bytes) | repeated | Repeated PEM authority payloads, asserted as trusted by the server. |






<a name="opencannabis.device.DeviceFlags"></a>

### DeviceFlags
Stateful flags that may be set on a device.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| ephemeral | [bool](#bool) |  | Flag to mark a device as ephemeral, i.e. attached to a disposable identity. |
| managed | [bool](#bool) |  | Flag to mark a device as managed by EMM systems. |





<!-- end messages -->


<a name="opencannabis.device.DeviceType"></a>

### DeviceType
Enumerates major types of devices that might be encountered, including desktops, phones, tablets, TVs, and browsers.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNKNOWN_DEVICE_TYPE | 0 | The end-device type is not known. |
| DESKTOP | 1 | The end-device is a desktop of some kind. |
| PHONE | 2 | The end-device is a phone. |
| TABLET | 3 | The end-device is a tablet. |
| TV | 4 | The end-device is a TV of some kind. |
| EMBEDDED | 5 | Small or embedded compute units. |
| SERVER | 6 | Server units. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
