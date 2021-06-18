# Protocol Documentation
<a name="top"></a>

---
Module: `module`
Package: `opencannabis.module`
Domain: rfc.opencannabis.info
---


## Reference Documentation

- [opencannabis/temporal/Date.proto](#opencannabis/temporal/Date.proto)
  - [Date](#opencannabis.temporal.Date)

- [opencannabis/temporal/Duration.proto](#opencannabis/temporal/Duration.proto)
  - [Duration](#opencannabis.temporal.Duration)

  - [TimeUnit](#opencannabis.temporal.TimeUnit)

- [opencannabis/temporal/Instant.proto](#opencannabis/temporal/Instant.proto)
  - [Instant](#opencannabis.temporal.Instant)

- [opencannabis/temporal/Interval.proto](#opencannabis/temporal/Interval.proto)
  - [TimeInterval](#opencannabis.temporal.TimeInterval)

  - [Interval](#opencannabis.temporal.Interval)

- [opencannabis/temporal/Time.proto](#opencannabis/temporal/Time.proto)
  - [Time](#opencannabis.temporal.Time)

- [opencannabis/temporal/Schedule.proto](#opencannabis/temporal/Schedule.proto)
  - [Schedule](#opencannabis.temporal.Schedule)

- [opencannabis/temporal/Timehash.proto](#opencannabis/temporal/Timehash.proto)
  - [Timehash](#opencannabis.temporal.Timehash)





<a name="opencannabis/temporal/Date.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/temporal/Date.proto
Provides calendar and date related definitions and structures.


<a name="opencannabis.temporal.Date"></a>

### Date
Specifies a particular calendar date.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| iso8601 | [string](#string) |  | ISO8601-formatted calendar date value, like YYYY-MM-DD. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/temporal/Duration.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/temporal/Duration.proto



<a name="opencannabis.temporal.Duration"></a>

### Duration
Specifies a duration, or, a distance between two points in temporal space.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| unit | [TimeUnit](#opencannabis.temporal.TimeUnit) |  | Specifies the unit this duration operates on. |
| amount | [uint32](#uint32) |  | Specifies the amount expressed of the above duration. |





<!-- end messages -->


<a name="opencannabis.temporal.TimeUnit"></a>

### TimeUnit
Specifies time units that may be used to express durations.

| Name | Number | Description |
| ---- | ------ | ----------- |
| MILLISECONDS | 0 | Millisecond-level resolution. |
| MICROSECONDS | 1 | Microsecond-level resolution. |
| SECONDS | 2 | Second-level resolution. |
| MINUTES | 3 | Minute-level resolution. |
| HOURS | 4 | Hour-level resolution. |
| DAYS | 5 | Day-level resolution. |
| WEEKS | 6 | Week-level resolution. |
| MONTHS | 7 | Month-level resolution. |
| YEARS | 8 | Year-level resolution. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/temporal/Instant.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/temporal/Instant.proto
Provides timestamp-related definitions and structures.


<a name="opencannabis.temporal.Instant"></a>

### Instant
Specifies a particular moment in time.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| iso8601 | [string](#string) |  | ISO8601-formatted timestamp. |
| timestamp | [uint64](#uint64) |  | Unix epoch timestamp, at millisecond resolution. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/temporal/Interval.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/temporal/Interval.proto
Provides time interval-related models.


<a name="opencannabis.temporal.TimeInterval"></a>

### TimeInterval
Specifies time interval information.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| interval | [Interval](#opencannabis.temporal.Interval) |  | Specifies the type of interval. |
| every | [uint32](#uint32) |  | Optional: specifies the interval border. |





<!-- end messages -->


<a name="opencannabis.temporal.Interval"></a>

### Interval
Enumerates supported time interval types.

| Name | Number | Description |
| ---- | ------ | ----------- |
| MINUTELY | 0 | Specifies the default value of a minute-scale window. |
| HOURLY | 1 | Specifies an hour-scale window. |
| DAILY | 2 | Specifies a day-scale window. |
| WEEKLY | 3 | Specifies a week-scale window. |
| MONTHLY | 4 | Specifies a calendar month-scale window. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/temporal/Time.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/temporal/Time.proto
Provides time-of-day-related definitions and structures.


<a name="opencannabis.temporal.Time"></a>

### Time
Specifies a particular time of day.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| iso8601 | [string](#string) |  | ISO8601 time format. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/temporal/Schedule.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/temporal/Schedule.proto
Provides a structure defining the concept of a variable schedule.


<a name="opencannabis.temporal.Schedule"></a>

### Schedule
Specifies a schedule for something.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| absolute | [Instant](#opencannabis.temporal.Instant) |  | Specifies an absolute instant for the schedule. |
| time | [Time](#opencannabis.temporal.Time) |  | Specifies a relative time as a schedule. |
| interval | [Interval](#opencannabis.temporal.Interval) |  | Specifies an interval schedule. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/temporal/Timehash.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/temporal/Timehash.proto



<a name="opencannabis.temporal.Timehash"></a>

### Timehash
Specifies a point in temporal space, with the ability to zoom out by some amount by operating on substrings.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| component | [string](#string) | repeated | Specifies the entire timehash, and each sub-string. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
