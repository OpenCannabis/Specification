# Protocol Documentation
<a name="top"></a>

---
Module: `module`
Package: `opencannabis.module`
Domain: rfc.opencannabis.info
---


## Reference Documentation

- [opencannabis/proximity/BluetoothBeacon.proto](#opencannabis/proximity/BluetoothBeacon.proto)
  - [BluetoothBeacon](#opencannabis.proximity.BluetoothBeacon)





<a name="opencannabis/proximity/BluetoothBeacon.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/proximity/BluetoothBeacon.proto
Provides structures related to bluetooth beacon and bluetooth proximity sensing.


<a name="opencannabis.proximity.BluetoothBeacon"></a>

### BluetoothBeacon
Specifies a Bluetooth beacon signal, detected or emitted by a BLE device.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| uuid | [string](#string) |  | UUID for the device, as observed or emitted. |
| major | [uint32](#uint32) |  | 'Major' value in the BLE signal. |
| minor | [uint32](#uint32) |  | 'Minor' value in the BLE signal. |
| seen | [opencannabis.temporal.Instant](#opencannabis.temporal.Instant) |  | Timestamp for when this beacon was witnessed. |
| location | [opencannabis.geo.Location](#opencannabis.geo.Location) |  | Location of the emitting or reporting (receiving) beacon. |
| accuracy | [opencannabis.geo.LocationAccuracy](#opencannabis.geo.LocationAccuracy) |  | Estimate as to the distance accuracy of this beacon. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
