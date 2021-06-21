---
domain: rfc.opencannabis.info
shortname: 3/OCS
name: OpenCannabis Specification
status: raw
editor: Sam Gammon <sam@bloombox.io>
contributors:
  - Randal Stevens <randy@bloombox.io>
  - Tyler Porras <tyler@bloombox.io>
  - Tim Samartino <tim@bloombox.io>
  - Matt McLean <matt@gocaliva.com>
  - Andrew Martin <andrew.martin@gocaliva.com>
  - Scott Robinson <srobinson@abatinsacramento.com>
---

# OpenCannabis Specification
- Version `1.0`
- Status: `RAW`

### Status of this Memo

This memo defines a protocol and model for the legal cannabis community: _OpenCannabis, version 1.0_. Distribution of
this memo is unlimited.

This specification's current status is considered `RAW`, i.e. pre-`DRAFT`.

### Abstract

This document describes an interoperable technical data specification tailored for the **worldwide legal cannabis
market**. As legal markets to buy, sell, cultivate and manufacture cannabis products come online, a need is emerging for
a universal way of connecting data systems and components that work with cannabis or cannabis-related data.

The primary vision of this specification is to reduce the friction and burden on cannabis technology providers in
connecting disparate systems and datasets.

### Table of Contents
- **[Introduction](1-Introduction.md)**
    1. [Process and licensing](1-Introduction.md#Process-and-licensing)
    1. [Language](1-Introduction.md#Language)
    1. [Vision and Principles](1-Introduction.md#Vision-and-Principles)
        1. [Project Goals](1-Introduction.md#Project-Goals)
        1. [Architecture](1-Introduction.md#Architecture)
        1. [Conventions](1-Introduction.md#Conventions)
- **[Section 1: Datamodel](2-Datamodel.md): Information at rest**
    1. [Toolchain](2-Datamodel.md)
    1. [General Guidelines](2-Datamodel.md)
    1. [Message Categories](2-Datamodel.md)
        - [Part 1.1: Core Structures](3-Core-Structures.md)
        - [Part 1.2: Extension Structures](4-Extension-Structures.md)
- **Section 2: Services: Information in motion**
    1. Toolchain
    1. RPC
    1. REST
    1. Open Services
    1. Vendored Services
    1. Service Verticals
        1. Cultivation
        1. Transport
        1. Manufacturing
        1. Laboratory Testing
        1. Wholesale
        1. Retail
        1. Consumer
- **Section 3: Tables: Insights from information**
    1. Toolchain
    1. Data Concerns
        1. Telemetry
        1. Laboratory Testing
        1. Commercial Ordering

## Copyright Notice

Copyright (©) 2018, the OpenCannabis Editor and Contributors. All rights reserved.

## License  [![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg?longCache=true&style=flat-square)](https://www.gnu.org/licenses/gpl-3.0)

This Specification is free software; you can redistribute it and/or modify it under the terms of the
[GNU General Public License](LICENSE.md) as published by the Free Software Foundation; either version 3 of the License,
or (at your option) any later version.

This Specification is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program; if not, see
http://www.gnu.org/licenses.
