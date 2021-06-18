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

<li><code>opencannabis/proximity/BluetoothBeacon.proto</code></li>

<ul>
    <li><a href="#opencannabis.proximity.BluetoothBeacon"><code>BluetoothBeacon</code></a></li>
</ul><br />


</ul>




_________________



<a name="opencannabis/proximity/BluetoothBeacon.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/proximity/BluetoothBeacon.proto`

Provides structures related to bluetooth beacon and bluetooth proximity sensing.

To import this module:

```proto
import "opencannabis/proximity/BluetoothBeacon.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.proximity`     |
| **Bazel Target** | `//opencannabis.proximity`   |
|                  |                    |



<a name="opencannabis.proximity.BluetoothBeacon"></a>

### Message: <code>BluetoothBeacon</code> (`opencannabis.proximity.BluetoothBeacon`)

Specifies a Bluetooth beacon signal, detected or emitted by a BLE device.

```proto
import "opencannabis/proximity/BluetoothBeacon.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.proximity.BluetoothBeacon field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `uuid` | [`string`](#string) | *None.* | UUID for the device, as observed or emitted. |
| `major` | [`uint32`](#uint32) | *None.* | 'Major' value in the BLE signal. |
| `minor` | [`uint32`](#uint32) | *None.* | 'Minor' value in the BLE signal. |
| `seen` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Timestamp for when this beacon was witnessed. |
| `location` | [`opencannabis.geo.Location`](#opencannabis.geo.Location) | *None.* | Location of the emitting or reporting (receiving) beacon. |
| `accuracy` | [`opencannabis.geo.LocationAccuracy`](#opencannabis.geo.LocationAccuracy) | *None.* | Estimate as to the distance accuracy of this beacon. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
