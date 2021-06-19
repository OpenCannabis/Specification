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

<li><code>opencannabis/temporal/Date.proto</code></li>

<ul>
    <li><a href="#opencannabis.temporal.Date"><code>Date</code></a></li>
</ul><br />


<li><code>opencannabis/temporal/Duration.proto</code></li>

<ul>
    <li><a href="#opencannabis.temporal.Duration"><code>Duration</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.temporal.TimeUnit"><code>TimeUnit</code></a></li>
</ul><br />


<li><code>opencannabis/temporal/Instant.proto</code></li>

<ul>
    <li><a href="#opencannabis.temporal.Instant"><code>Instant</code></a></li>
</ul><br />


<li><code>opencannabis/temporal/Interval.proto</code></li>

<ul>
    <li><a href="#opencannabis.temporal.TimeInterval"><code>TimeInterval</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.temporal.Interval"><code>Interval</code></a></li>
</ul><br />


<li><code>opencannabis/temporal/Time.proto</code></li>

<ul>
    <li><a href="#opencannabis.temporal.Time"><code>Time</code></a></li>
</ul><br />


<li><code>opencannabis/temporal/Schedule.proto</code></li>

<ul>
    <li><a href="#opencannabis.temporal.Schedule"><code>Schedule</code></a></li>
</ul><br />


<li><code>opencannabis/temporal/Timehash.proto</code></li>

<ul>
    <li><a href="#opencannabis.temporal.Timehash"><code>Timehash</code></a></li>
</ul><br />


</ul>




_________________



<a name="opencannabis/temporal/Date.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/temporal/Date.proto`

Provides calendar and date related definitions and structures.

To import this module:

```proto
import "opencannabis/temporal/Date.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.temporal`     |
| **Bazel Target** | `//opencannabis.temporal`   |
|                  |                    |



<a name="opencannabis.temporal.Date"></a>

### Message: <code>Date</code> (`opencannabis.temporal.Date`)

Specifies a particular calendar date.

```proto
import "opencannabis/temporal/Date.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.temporal.Date field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `iso8601` | [`string`](#string) | *None.* | ISO8601-formatted calendar date value, like YYYY-MM-DD. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/temporal/Duration.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/temporal/Duration.proto`



To import this module:

```proto
import "opencannabis/temporal/Duration.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.temporal`     |
| **Bazel Target** | `//opencannabis.temporal`   |
|                  |                    |



<a name="opencannabis.temporal.Duration"></a>

### Message: <code>Duration</code> (`opencannabis.temporal.Duration`)

Specifies a duration, or, a distance between two points in temporal space.

```proto
import "opencannabis/temporal/Duration.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.temporal.Duration field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `unit` | [`TimeUnit`](#opencannabis.temporal.TimeUnit) | *None.* | Specifies the unit this duration operates on. |
| `amount` | [`uint32`](#uint32) | *None.* | Specifies the amount expressed of the above duration. |






<!-- end messages -->


<a name="opencannabis.temporal.TimeUnit"></a>

### Enumeration: <code>TimeUnit</code> (`opencannabis.temporal.TimeUnit`)

Specifies time units that may be used to express durations.

```proto
import "opencannabis/temporal/Duration.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.temporal.TimeUnit enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `MILLISECONDS` | `0` | Millisecond-level resolution. |
| `MICROSECONDS` | `1` | Microsecond-level resolution. |
| `SECONDS` | `2` | Second-level resolution. |
| `MINUTES` | `3` | Minute-level resolution. |
| `HOURS` | `4` | Hour-level resolution. |
| `DAYS` | `5` | Day-level resolution. |
| `WEEKS` | `6` | Week-level resolution. |
| `MONTHS` | `7` | Month-level resolution. |
| `YEARS` | `8` | Year-level resolution. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/temporal/Instant.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/temporal/Instant.proto`

Provides timestamp-related definitions and structures.

To import this module:

```proto
import "opencannabis/temporal/Instant.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.temporal`     |
| **Bazel Target** | `//opencannabis.temporal`   |
|                  |                    |



<a name="opencannabis.temporal.Instant"></a>

### Message: <code>Instant</code> (`opencannabis.temporal.Instant`)

Specifies a particular moment in time.

```proto
import "opencannabis/temporal/Instant.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.temporal.Instant field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `iso8601` | [`string`](#string) | *None.* | ISO8601-formatted timestamp. |
| `timestamp` | [`uint64`](#uint64) | *None.* | Unix epoch timestamp, at millisecond resolution. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/temporal/Interval.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/temporal/Interval.proto`

Provides time interval-related models.

To import this module:

```proto
import "opencannabis/temporal/Interval.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.temporal`     |
| **Bazel Target** | `//opencannabis.temporal`   |
|                  |                    |



<a name="opencannabis.temporal.TimeInterval"></a>

### Message: <code>TimeInterval</code> (`opencannabis.temporal.TimeInterval`)

Specifies time interval information.

```proto
import "opencannabis/temporal/Interval.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.temporal.TimeInterval field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `interval` | [`Interval`](#opencannabis.temporal.Interval) | *None.* | Specifies the type of interval. |
| `every` | [`uint32`](#uint32) | *None.* | Optional: specifies the interval border. |






<!-- end messages -->


<a name="opencannabis.temporal.Interval"></a>

### Enumeration: <code>Interval</code> (`opencannabis.temporal.Interval`)

Enumerates supported time interval types.

```proto
import "opencannabis/temporal/Interval.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.temporal.Interval enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `MINUTELY` | `0` | Specifies the default value of a minute-scale window. |
| `HOURLY` | `1` | Specifies an hour-scale window. |
| `DAILY` | `2` | Specifies a day-scale window. |
| `WEEKLY` | `3` | Specifies a week-scale window. |
| `MONTHLY` | `4` | Specifies a calendar month-scale window. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/temporal/Time.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/temporal/Time.proto`

Provides time-of-day-related definitions and structures.

To import this module:

```proto
import "opencannabis/temporal/Time.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.temporal`     |
| **Bazel Target** | `//opencannabis.temporal`   |
|                  |                    |



<a name="opencannabis.temporal.Time"></a>

### Message: <code>Time</code> (`opencannabis.temporal.Time`)

Specifies a particular time of day.

```proto
import "opencannabis/temporal/Time.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.temporal.Time field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `iso8601` | [`string`](#string) | *None.* | ISO8601 time format. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/temporal/Schedule.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/temporal/Schedule.proto`

Provides a structure defining the concept of a variable schedule.

To import this module:

```proto
import "opencannabis/temporal/Schedule.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.temporal`     |
| **Bazel Target** | `//opencannabis.temporal`   |
|                  |                    |



<a name="opencannabis.temporal.Schedule"></a>

### Message: <code>Schedule</code> (`opencannabis.temporal.Schedule`)

Specifies a schedule for something.

```proto
import "opencannabis/temporal/Schedule.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.temporal.Schedule field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `absolute` | [`Instant`](#opencannabis.temporal.Instant) | *None.* | Specifies an absolute instant for the schedule. |
| `time` | [`Time`](#opencannabis.temporal.Time) | *None.* | Specifies a relative time as a schedule. |
| `interval` | [`Interval`](#opencannabis.temporal.Interval) | *None.* | Specifies an interval schedule. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/temporal/Timehash.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/temporal/Timehash.proto`



To import this module:

```proto
import "opencannabis/temporal/Timehash.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.temporal`     |
| **Bazel Target** | `//opencannabis.temporal`   |
|                  |                    |



<a name="opencannabis.temporal.Timehash"></a>

### Message: <code>Timehash</code> (`opencannabis.temporal.Timehash`)

Specifies a point in temporal space, with the ability to zoom out by some amount by operating on substrings.

```proto
import "opencannabis/temporal/Timehash.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.temporal.Timehash field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `component` | [`string`](#string) | repeated | Specifies the entire timehash, and each sub-string. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
