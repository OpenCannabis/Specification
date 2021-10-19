
# OpenCannabis Specification

### Status of this Memo

This memo defines a protocol and model for the legal cannabis community: _OpenCannabis, version 1.0_. Distribution of
this memo is unlimited.

### Abstract

This document describes an interoperable technical data specification tailored for the **worldwide legal cannabis
market**. As legal markets to buy, sell, cultivate and manufacture cannabis products come online, a need is emerging for
a universal way of connecting data systems and components that work with cannabis or cannabis-related data.

The primary vision of this specification is to reduce the friction and burden on cannabis technology providers in
connecting disparate systems and datasets.

### Table of Contents
- **[Introduction](#Introduction)**
    1. [Process and licensing](#Process-and-licensing)
    1. [Language](#Language)
    1. [Vision and Principles](#Vision-and-Principles)
        1. [Project Goals](#Project-Goals)
        1. [Architecture](#Architecture)
        1. [Conventions](#Conventions)
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

## Introduction

### Process and licensing

This specification is based on the [2/COSS](../2/README.md) (*Consensus-Oriented Specification System*) process, and
before it, the original [Digistan 1/COSS](http://www.digistan.org/spec:1/COSS), which are designed to be a lightweight
editorial process that seeks to engage the widest possible range of interested parties and move rapidly to consensus
through working code.

Extensions to the main specification should be proposed for each market stakeholder (from _seed to smoke_, as it were).
The hope is that this work can begin a conversation amongst cannabis software providers about a universal spec and
integration suite.

##### Change Process

This document is governed by the [2/COSS](../2/README.md) (*Consensus-Oriented Specification System*), and is published
via, and inspired by, the [Unprotocols RFC](https://github.com/unprotocols/rfc) structure.

##### Spec licensing as GNU GPLv3

The _OpenCannabis Specification_ itself - i.e., this document and any accompanying specification materials, including,
but not limited to, graphics, additional spec revisions or extensions, and so on, is licensed under the [GNU General
Public License](./LICENSE.md), version 3. This means additional work on this spec, or forks of this spec, must also be
kept open source and shared-alike with the community.

##### Code licensing as Apache 2.0

Software written _to comply with_ or _make use of_ this spec does not have to be open source. For this reason, the
_actual code_ for the OpenCannabis specification is licensed under the
[Apache License](https://www.apache.org/licenses/LICENSE-2.0), version 2.0.

### Language

The key words "**MUST**", "**MUST NOT**", "**REQUIRED**", "**SHALL**", "**SHALL NOT**", "**SHOULD**", "**SHOULD NOT**",
"**RECOMMENDED**", "**NOT RECOMMENDED**", "**MAY**", and "**OPTIONAL**" in this document are to be interpreted as
described in [BCP 14](https://tools.ietf.org/html/bcp14), [RFC 2119](http://tools.ietf.org/html/rfc2119), and 
[RFC 8174](http://tools.ietf.org/html/rfc8174), when, and only when, they appear in all capitals, as shown here.

## Vision and Principles

The OpenCannabis Data Specification's mission statement is to **facilitate the design and implementation of an open
information structure for legal cannabis operations**, built around industry consensus. The hope is that a point of
agreement such as this one amongst industry practitioners and stakeholders can bring about easier development of
integrations between major systems.

From [2/COSS](../2/README.md):
*A "technical specification" defines a protocol, a process, an API, a use of language, a methodology, or any other
aspect of a technical environment that can usefully be documented for the purposes of technical or social
interoperability.*

**OpenCannabis intends to apply these same principles:**
* We aim for rough consensus and running code.
* Specifications are small pieces, made by small teams.
* Specifications should have a clearly responsible editor.
* The process should be visible, objective, and accessible to anyone.
* The process should clearly separate experiments from solutions.
* The process should allow deprecation of old specifications.

Specifications should take minutes to explain, hours to design, days to write, weeks to prove, months to become mature,
and years to replace. Specifications have no special status except that accorded by the community.

### Project Goals

- **Goal:** Specify a universal information model for cannabis cultivation, manufacturing, distribution, testing, and
  retail operations.
- **Goal:** Construct and release spec implementations in every major programming language.
- **Goal:** Write and release detailed narrative documentation and API reference materials in every supported language.
- **Goal:** Encourage adoption and contribution to the spec through open, transparent, and fair process.
- **Goal:** Cross-functional structures and protocols that reflect accurate science.
- **Anti-goal:** Specific provider-coupled structures, services, or concepts.
- **Anti-goal:** Separate notions or data modelling on stakeholder-defined boundaries.
- **Anti-goal:** Isolated, central control of the cannabis industry's data.
- **Anti-goal:** Regulatory information repository or legal advice. This specification is structural, and compliance
  with the law is up to you and your lawyer.

## Architecture

In accordance with the [2/COSS](../2/README.md) architecture, OpenCannabis (the spec) makes use of modern tools such as
Git, Markdown, and Slack. Code is written in Protobuf to facilitate language agnostic adoption. Primarily, a wiki-style
model is employed for authoring, editing, and publishing specification texts. 

This specification's _domain root_ is `rfc.opencannabis.info`, and, thus, this very document can be accessed at:

```
https://rfc.opencannabis.info/spec:3/OCS
```

Quoth [2/COSS](../2/README.md):
* The *domain* is the conservancy for a set of specifications in a certain area.
* Each domain is implemented as an Internet domain, hosting a wiki and optionally other communications tools.
* Each specification is a set of wiki pages, together with comments, attached files, and other resources.
* Important specifications may also exist as subdomains, i.e. child wikis.

The goal of the OpenCannabis spec is to unify industry stakeholders around one model. It **MAY** be necessary, but
**SHOULD** be avoided, because it is an explicit anti-goal to avoid stakeholder-based coupling (and a goal to promote
cross-stakeholder integration).

Accordingly, major spec extensions to the main _OCS_ spec:

* **MUST** be assigned their own number, name, short name.
* **MUST** follow the [2/COSS](../2/README.md) lifecycle.
* **MAY** be assigned their own sub domain.
* **SHOULD** be designed around functional boundaries.
* **SHOULD NOT** be designed around functional or stakeholder boundaries.

Individuals can become members of the domain by completing the necessary legal clearance.  The copyright, patent, and 
trademark policies of the domain must be clarified in an Intellectual Property policy that applies to the domain.

Specifications exist as multiple pages, one page per version of the specification (see "_Branching and Merging_",
below), which may be assigned URIs that include an incremental number.  Thus, we refer to a specification by specifying
its domain, number, and short name.  New versions of the same specification will have new numbers.  The syntax for a
specification reference is:


    <domain>/spec:<number>/<shortname>


For example, this specification is **rfc.opencannabis.info/spec:3/OCS**.  The short form **3/OCS** may be used when
referring to the specification from other specifications in the same domain.

Every specification (including branches) carries a different number.  Lower numbers indicate more mature specifications,
higher numbers indicate more experimental specifications.

## Conventions

Where possible editors and contributors are encouraged to:

* Refer to and build on existing work when possible, especially IETF specifications.
* Contribute to existing specifications rather than reinvent their own.
* Use collaborative branching and merging as a tool for experimentation.

## Considerations

Throughout the specification, considerations for various specific topics will be listed in the following sections:
- *Security Considerations*: Maintaining data and system security with regard to a particular spec or definition.
- *Privacy Considerations*: Ensuring clear data ownership and privacy controls.

## Normative References

- [1/C4](../1/README.md): Hintjens, P.,
  *"Collective Code Construction Contract"*, June 2016.

- [2/COSS](../2/README.md): Rashkovskii, Y., Hintjens, P., Rebentisch, A., Barrioneuvo, A., Puttick, C.,
  *"Consensus-Oriented Specification System"*, September 2016.

- [RFC 2119](http://tools.ietf.org/html/rfc2119), [BCP 14](https://tools.ietf.org/html/bcp14): Bradner, S.,
  *"Key words for use in RFCs to Indicate Requirement levels"*, March 1997.

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
