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

<li><code>opencannabis/device/Device.proto</code></li>

<ul>
    <li><a href="#opencannabis.device.Device"><code>Device</code></a></li><li><a href="#opencannabis.device.DeviceCredentials"><code>DeviceCredentials</code></a></li><li><a href="#opencannabis.device.DeviceFlags"><code>DeviceFlags</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.device.DeviceType"><code>DeviceType</code></a></li>
</ul><br />


</ul>




_________________



<a name="opencannabis/device/Device.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/device/Device.proto`

Provides a structure for device types and credentials and enumerates device types.

To import this module:

```proto
import "opencannabis/device/Device.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.device`     |
| **Bazel Target** | `//opencannabis.device`   |
|                  |                    |



<a name="opencannabis.device.Device"></a>

### Message: <code>Device</code> (`opencannabis.device.Device`)

Specifies a structure that describes a known device.

```proto
import "opencannabis/device/Device.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.device.Device field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `uuid` | [`string`](#string) | *None.* | Universally unique identifier for this device. |
| `type` | [`DeviceType`](#opencannabis.device.DeviceType) | *None.* | Type of this device. |
| `flags` | [`DeviceFlags`](#opencannabis.device.DeviceFlags) | *None.* | Flags for this device. |
| `key` | [`DeviceCredentials`](#opencannabis.device.DeviceCredentials) | *None.* | Credentials for this device. |







<a name="opencannabis.device.DeviceCredentials"></a>

### Message: <code>DeviceCredentials</code> (`opencannabis.device.DeviceCredentials`)

Credentials that assert a device's identity or authorization.

```proto
import "opencannabis/device/Device.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.device.DeviceCredentials field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `public_key` | [`bytes`](#bytes) | *None.* | Raw bytes for a device's public key. |
| `private_key` | [`bytes`](#bytes) | *None.* | Raw bytes for the device's private key. |
| `sha256` | [`string`](#string) | *None.* | SHA256 hash of this device's public key. |
| `identity` | [`string`](#string) | *None.* | A device's raw identity payload. |
| `authorities` | [`bytes`](#bytes) | repeated | Repeated PEM authority payloads, asserted as trusted by the server. |







<a name="opencannabis.device.DeviceFlags"></a>

### Message: <code>DeviceFlags</code> (`opencannabis.device.DeviceFlags`)

Stateful flags that may be set on a device.

```proto
import "opencannabis/device/Device.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.device.DeviceFlags field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `ephemeral` | [`bool`](#bool) | *None.* | Flag to mark a device as ephemeral, i.e. attached to a disposable identity. |
| `managed` | [`bool`](#bool) | *None.* | Flag to mark a device as managed by EMM systems. |






<!-- end messages -->


<a name="opencannabis.device.DeviceType"></a>

### Enumeration: <code>DeviceType</code> (`opencannabis.device.DeviceType`)

Enumerates major types of devices that might be encountered, including desktops, phones, tablets, TVs, and browsers.

```proto
import "opencannabis/device/Device.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.device.DeviceType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNKNOWN_DEVICE_TYPE` | `0` | The end-device type is not known. |
| `DESKTOP` | `1` | The end-device is a desktop of some kind. |
| `PHONE` | `2` | The end-device is a phone. |
| `TABLET` | `3` | The end-device is a tablet. |
| `TV` | `4` | The end-device is a TV of some kind. |
| `EMBEDDED` | `5` | Small or embedded compute units. |
| `SERVER` | `6` | Server units. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
