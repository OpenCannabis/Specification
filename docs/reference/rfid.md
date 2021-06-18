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

<li><code>opencannabis/rfid/RFID.proto</code></li>

<ul>
    <li><a href="#opencannabis.rfid.Antenna"><code>Antenna</code></a></li><li><a href="#opencannabis.rfid.Reader"><code>Reader</code></a></li><li><a href="#opencannabis.rfid.Tag"><code>Tag</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.rfid.ReaderModel"><code>ReaderModel</code></a></li><li><a href="#opencannabis.rfid.ReaderVendor"><code>ReaderVendor</code></a></li>
</ul><br />


<li><code>opencannabis/rfid/LLRP.proto</code></li>

<ul>
    <li><a href="#opencannabis.rfid.BoundaryConfig"><code>BoundaryConfig</code></a></li><li><a href="#opencannabis.rfid.BoundaryConfig.StartTrigger"><code>BoundaryConfig.StartTrigger</code></a></li><li><a href="#opencannabis.rfid.BoundaryConfig.StopTrigger"><code>BoundaryConfig.StopTrigger</code></a></li><li><a href="#opencannabis.rfid.ROSpec"><code>ROSpec</code></a></li><li><a href="#opencannabis.rfid.ReportingConfig"><code>ReportingConfig</code></a></li><li><a href="#opencannabis.rfid.TagReport"><code>TagReport</code></a></li><li><a href="#opencannabis.rfid.TagReportOrigin"><code>TagReportOrigin</code></a></li><li><a href="#opencannabis.rfid.TagReportSet"><code>TagReportSet</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.rfid.RegulatoryCapability"><code>RegulatoryCapability</code></a></li><li><a href="#opencannabis.rfid.StartTriggerType"><code>StartTriggerType</code></a></li><li><a href="#opencannabis.rfid.StopTriggerType"><code>StopTriggerType</code></a></li>
</ul><br />


</ul>




_________________



<a name="opencannabis/rfid/RFID.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/rfid/RFID.proto`

Defines the structure of Radio Frequency Identifier (RFID)-related hardware and software. RFID is used in this
context to track and trace individual inventory throughout the supply chain.

To import this module:

```proto
import "opencannabis/rfid/RFID.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.rfid`     |
| **Bazel Target** | `//opencannabis.rfid`   |
|                  |                    |



<a name="opencannabis.rfid.Antenna"></a>

### Message: <code>Antenna</code> (`opencannabis.rfid.Antenna`)

Describes the concept of an RFID antenna, which is attached to an RFID reader device. Antennas are essentially
passive hardware, so they must be operated by a reader, which is the "controller" device clients communicate with.

```proto
import "opencannabis/rfid/RFID.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.rfid.Antenna field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `index` | [`uint32`](#uint32) | *None.* | Antenna number. This identifies the port which the antenna is connected to on the reader which is controlling this external RFID antenna device. |







<a name="opencannabis.rfid.Reader"></a>

### Message: <code>Reader</code> (`opencannabis.rfid.Reader`)

Describes the notion of an RFID reader device, which manages one or more RFID antennae. RFID readers control the RF
scanning process, and correspond over LLRP with clients to facilitate reading RFID tags.

```proto
import "opencannabis/rfid/RFID.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.rfid.Reader field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `name` | [`string`](#string) | *None.* | Specifies the string name of the reader, if one is assigned and could be detected. |
| `mac` | [`string`](#string) | *None.* | Specifies the MAC address of the reader device, assigned to the Ethernet/PoE port embedded on the device and hooked into the local network. |
| `ip` | [`string`](#string) | *None.* | Specifies the IP address of the reader device, where it can be connected to over LLRP, assuming no firewall or security IDS/IPS interference. |
| `vendor` | [`ReaderVendor`](#opencannabis.rfid.ReaderVendor) | *None.* | Describes the vendor of the RFID reader controller, if one could be detected. |
| `model` | [`ReaderModel`](#opencannabis.rfid.ReaderModel) | *None.* | Describes the model of the RFID reader controller, if one could be detected. |







<a name="opencannabis.rfid.Tag"></a>

### Message: <code>Tag</code> (`opencannabis.rfid.Tag`)

Defines the structure of an individual RFID tag, which is placed on, or attached to, a physical item in order to
facilitate unique tracking of that item throughout the supply chain.

```proto
import "opencannabis/rfid/RFID.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.rfid.Tag field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `tid` | [`string`](#string) | *None.* | Tag ID, assigned to the tag at manufacturing time and never over-written. Uniquely identifies this particular RFID tag in a permanent, hard-to-reproduce manner. |
| `payload` | [`bytes`](#bytes) | *None.* | Raw content encoded onto the tag. This payload is set to complement any decoded content payload which might be available as a result of this scan. |
| `epc` | [`string`](#string) | *None.* | EPC, or Electronic Product Code, which was read from the encoded data section of the subject RFID tag which we are describing in this payload. |






<!-- end messages -->


<a name="opencannabis.rfid.ReaderModel"></a>

### Enumeration: <code>ReaderModel</code> (`opencannabis.rfid.ReaderModel`)

Describes known, or supported, models of RFID reader controller devices.

```proto
import "opencannabis/rfid/RFID.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.rfid.ReaderModel enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNRECOGNIZED_READER` | `0` | The model of the reader could not be recognized. |
| `SPEEDWAY_R120` | `1` | Impinj Speedway Revolution R120 (1-port). |
| `SPEEDWAY_R220` | `2` | Impinj Speedway Revolution R220 (2-port). |
| `SPEEDWAY_R420` | `2001002` | Impinj Speedway Revolution R420 (4-port). |
| `SPEEDWAY_XPORTAL` | `4` | Impinj Speedway xPortal Gateway. |
| `ALIEN_ALRH450` | `5` | Alien ALR-H450 handheld reader. |
| `ALIEN_F800` | `6` | Alien F800 reader. |
| `ALIEN_ALR9680` | `7` | Alien ALR-9680 reader (4-port). |



<a name="opencannabis.rfid.ReaderVendor"></a>

### Enumeration: <code>ReaderVendor</code> (`opencannabis.rfid.ReaderVendor`)

Describes known vendors of RFID reader equipment.

```proto
import "opencannabis/rfid/RFID.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.rfid.ReaderVendor enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNRECOGNIZED_VENDOR` | `0` | The vendor for the reader could not be recognized. |
| `IMPINJ` | `25882` | The vendor for the reader was detected as Impinj. |
| `ALIEN` | `2` | The vendor for the reader was detected as Alien. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/rfid/LLRP.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/rfid/LLRP.proto`

Specifies Low-Level Reader Protocol (LLRP) structures and definitions.

To import this module:

```proto
import "opencannabis/rfid/LLRP.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.rfid`     |
| **Bazel Target** | `//opencannabis.rfid`   |
|                  |                    |



<a name="opencannabis.rfid.BoundaryConfig"></a>

### Message: <code>BoundaryConfig</code> (`opencannabis.rfid.BoundaryConfig`)

Describes a boundary, or triggering, configuration profile for a given RFID reader/controller, or ROSpec,
configuration profile. Boundary configs describe when to start, and stop, scanning for tags.

```proto
import "opencannabis/rfid/LLRP.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.rfid.BoundaryConfig field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `start` | [`BoundaryConfig.StartTrigger`](#opencannabis.rfid.BoundaryConfig.StartTrigger) | *None.* | Specifies the start trigger for an `ROSpec`, which describes how RF operations, or reading events, should begin and be emitted to LLRP clients listening for read events. |
| `stop` | [`BoundaryConfig.StopTrigger`](#opencannabis.rfid.BoundaryConfig.StopTrigger) | *None.* | Specifies the stop trigger for an `ROSpec`, which describes how long to scan for RF tags. Once a stop trigger is met or otherwise satisfied, scanning and event reporting stops. |







<a name="opencannabis.rfid.BoundaryConfig.StartTrigger"></a>

### Message: <code>BoundaryConfig.StartTrigger</code> (`opencannabis.rfid.BoundaryConfig.StartTrigger`)

Describes the start trigger boundary parameters to apply.

```proto
import "opencannabis/rfid/LLRP.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.rfid.BoundaryConfig.StartTrigger field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `type` | [`StartTriggerType`](#opencannabis.rfid.StartTriggerType) | *None.* | Start trigger type to set, which may carry parameters, or not. Describes to the unit when to make a given RFID reader configuration active and begin scanning. |
| `schedule` | [`uint64`](#uint64) | *None.* | Schedule parameter, which is required for periodic triggering. |







<a name="opencannabis.rfid.BoundaryConfig.StopTrigger"></a>

### Message: <code>BoundaryConfig.StopTrigger</code> (`opencannabis.rfid.BoundaryConfig.StopTrigger`)

Describes the stop trigger boundary parameters to apply.

```proto
import "opencannabis/rfid/LLRP.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.rfid.BoundaryConfig.StopTrigger field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `type` | [`StopTriggerType`](#opencannabis.rfid.StopTriggerType) | *None.* | Stop trigger type to set, which may carry parameters, or not, and describes how the unit knows when to stop scanning for RFID tags and emitting events. |
| `schedule` | [`uint64`](#uint64) | *None.* | Schedule parameter, which is required for deadline-based stop triggering. |







<a name="opencannabis.rfid.ROSpec"></a>

### Message: <code>ROSpec</code> (`opencannabis.rfid.ROSpec`)

Describes a configuration profile that applies settings to an RFID reader and set of connected antennae. `ROSpec`
objects correspond with objects in the LLRP spec that control RFID boundary triggers, tag reporting configuration,
and other aspects of the RF scanning process.

```proto
import "opencannabis/rfid/LLRP.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.rfid.ROSpec field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `id` | [`uint32`](#uint32) | *None.* | Unique ID assigned to reference this `ROSpec`. |
| `priority` | [`uint32`](#uint32) | *None.* | Priority value this `ROSpec` should assume. |
| `boundary` | [`BoundaryConfig`](#opencannabis.rfid.BoundaryConfig) | *None.* | Configuration of triggering, and scanning, boundaries. Start and stop boundaries define when to start scanning and for how long, or how to know when to stop. |
| `reporting` | [`ReportingConfig`](#opencannabis.rfid.ReportingConfig) | *None.* | Reporting settings, that describe what should be reported back for each RFID tag detected within the subject reader's RFID range. This may include RSSI, antenna number, and more. |







<a name="opencannabis.rfid.ReportingConfig"></a>

### Message: <code>ReportingConfig</code> (`opencannabis.rfid.ReportingConfig`)

Describes reporting settings that control what is reported back from the antenna when tags are found. This includes
the items that should be reported, frequency, tags to report, and other details.

```proto
import "opencannabis/rfid/LLRP.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.rfid.ReportingConfig field_name = 1;
}

```







<a name="opencannabis.rfid.TagReport"></a>

### Message: <code>TagReport</code> (`opencannabis.rfid.TagReport`)

Reports ths presence of a set of Radio-Frequency Identifier (RFID) tags, in a given zone, which were detected from a
given RFID reader controller device, from a given antenna or antennae under its control.

```proto
import "opencannabis/rfid/LLRP.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.rfid.TagReport field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `antenna` | [`Antenna`](#opencannabis.rfid.Antenna) | *None.* | Describes information about the antenna that reported a set of tags, if information about the antenna was requested and made available by the reader. |
| `tag` | [`Tag`](#opencannabis.rfid.Tag) | *None.* | Specifies information about the tag that was detected in this event. |
| `rssi` | [`double`](#double) | *None.* | Relative Signal Strength indicator value for this tag reading, which describes the relative strength of the signal between the subject tag and the reader/antenna that attenuated with it. |
| `first_seen` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Timestamp describing when this tag was first seen by the RFID apparatus. |
| `last_seen` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Timestamp describing the last moment this tag was seen by the RFID apparatus. |
| `received` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Timestamp describing when the edge engine received this reading event. |
| `peers` | [`uint32`](#uint32) | *None.* | Describes the count of tags read at the same moment, or in the same tag report, as this tag reading. |







<a name="opencannabis.rfid.TagReportOrigin"></a>

### Message: <code>TagReportOrigin</code> (`opencannabis.rfid.TagReportOrigin`)

Specifies where a given tag report came from. This would usually include information about the RFID reader that
emitted the tag report, potentially including an antenna index.

```proto
import "opencannabis/rfid/LLRP.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.rfid.TagReportOrigin field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `reader` | [`Reader`](#opencannabis.rfid.Reader) | *None.* | Describes the RFID reader/controller device which is reporting a tag. Readers control antennae, and emit read events over LLRP to facilitate RF operations. |
| `partner` | [`string`](#string) | *None.* | Describes the partner account to which the reader device is assigned, if applicable, so that it may be reported to telemetry or inventory systems along with the location at which the device is located. |
| `location` | [`string`](#string) | *None.* | Describes the location account, owned by the partner account specified, where the RFID reader device is physically located. Annotates RFID traffic with licensure/physical boundaries. |







<a name="opencannabis.rfid.TagReportSet"></a>

### Message: <code>TagReportSet</code> (`opencannabis.rfid.TagReportSet`)

Describes a set of RFID tag reports, produced by an RFID reader device, through an antenna, which has attenuated with
one or more tags and detected their contents as part of an RF survey or reader operation run.

```proto
import "opencannabis/rfid/LLRP.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.rfid.TagReportSet field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `origin` | [`TagReportOrigin`](#opencannabis.rfid.TagReportOrigin) | *None.* | Specifies the origin of this tag report, including the reader device and partnership scope. |
| `report` | [`TagReport`](#opencannabis.rfid.TagReport) | repeated | Describes the tags seen in a given tag report set, including each tag's relative signal strength and the antenna that detected the tag in question. |






<!-- end messages -->


<a name="opencannabis.rfid.RegulatoryCapability"></a>

### Enumeration: <code>RegulatoryCapability</code> (`opencannabis.rfid.RegulatoryCapability`)

Describes available regulatory capabilities, each of which map to a jurisdiction or region, and relevant regulatory
agency in that region. RFID reader devices support one or more of these region/regulatory configuration profiles and
should apply the relevant profile when operating in that subject region.

```proto
import "opencannabis/rfid/LLRP.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.rfid.RegulatoryCapability enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNSPECIFIED_REGULATORY_REGION` | `0` | Unspecified regulatory region capability. |
| `US_FCC` | `1` | United States: Federal Communications Commission (FCC), Part 15. |
| `ETSI_302_208` | `2` | ETSI standard 302-208. |
| `ETSI_300_220` | `3` | ETSI standard 300-220. |
| `AUSTRALIA_LIPD_1W` | `4` | Australia: LIPD 1W. |
| `AUSTRALIA_LIPD_4W` | `5` | Australia: LIPD 4W. |
| `JAPAN_ARIB_STD_T89` | `6` | Japan: ARIB Standard T89. |
| `HONGKONG_OFTA_1049` | `7` | Hong Kong: OFTA-1049. |
| `TAIWAN_DGT_LP0002` | `8` | Taiwan: DGT-LP0002 |
| `KOREA_MIC_ARTICLE_5_2` | `9` | Korea: MIC Article 5-2 |



<a name="opencannabis.rfid.StartTriggerType"></a>

### Enumeration: <code>StartTriggerType</code> (`opencannabis.rfid.StartTriggerType`)

Describes the types of start triggers that can be applied to an `ROSpec`. These describe the ways an RFID reader may
trigger itself to begin scanning for tags.

```proto
import "opencannabis/rfid/LLRP.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.rfid.StartTriggerType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `NO_START_TRIGGER` | `0` | No trigger condition is specified. The `ROSpec` will be triggered manually over LLRP. |
| `IMMEDIATE` | `1` | Immediately trigger the `ROSpec` after installation. |
| `PERIODIC` | `2` | Trigger the `ROSpec` periodically, on some time-based interval. |
| `GPIO_START` | `3` | Trigger the `ROSpec` via hardware GPIO signals. |



<a name="opencannabis.rfid.StopTriggerType"></a>

### Enumeration: <code>StopTriggerType</code> (`opencannabis.rfid.StopTriggerType`)

Describes the types of stop triggers that may be applied to an RFID reader and set of antennae, via its use in an
`ROSpec` boundary configuration payload. Stop triggers describe how long to scan for, or when to stop scanning.

```proto
import "opencannabis/rfid/LLRP.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.rfid.StopTriggerType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `NO_STOP_TRIGGER` | `0` | No stop trigger condition is specified. Effectively, this means, "scan forever." |
| `DURATION` | `1` | Specifies a deadline-based duration. After the time is up, scanning will stop. |
| `GPIO_STOP` | `2` | Specifies GPIO-signal-based stop. Once a hardware signal is received, scanning will stop. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
