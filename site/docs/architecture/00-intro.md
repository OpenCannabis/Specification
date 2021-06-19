---
title: Conceptual Overview
---
# Architecture Intro

This page describes, in broad terms, how OpenCannabis is architected to optimize for low friction and fast consensus
between trading partners in the legal cannabis industry. OpenCannabis isn't intended to solve _every_ need, want, or
goal; but _is_ mediating between multi-lateral concerns. As such, the project follows a set of **goals** and
**anti-goals** which guide the standardization process.

## Conceptual Overview

Essentially, OpenCannabis is a codified set of practices and data expressions which enable companies operating in the
cannabis space to collaborate easily. Cannabis supply chains are incredibly complex, requiring interoperation between
multiple stakeholders to deliver a product to market. That final product is made of _much more_ than its physical form
by the time it hits a dispensary shelf, though: there's cultivation and R&D data, test data, distribution data,
inventory, menuing, profiling, and all sorts of topics in between. It's here that OpenCannabis fits in.

### Why write a spec?

Currently, the state of the art in cannabis technology is one of two options: Massive, sweeping ecosystems of
proprietary code (that frequently break), and isolated, SaaS-style startups that provide great tools but without the
ecosystem around them for maximal value.

With a multi-lateral specification that maps between like concepts in foreign models, this `N*N` integration problem
reduces down to one that scales _linearly by member_. Thus, each adopter of the OpenCannabis Specification and Protocol
sees compounding returns in integration potential, rather than the other way around.

### Who writes the spec, and how is it structured?

Anyone can contribute to the specification and protocol. The process follows [2/COSS][1], which stands for the
_Consensus-Oriented Specification System_. COSS is itself a spec, which defines how companies can cooperate to make
interoperable specs. It just so happens that COSS defines Git/GitHub-based collaborative flow, which is _itself built on
another spec_. That would be [1/C4][2], which is the _Collective Code Construction Contract_. You get the idea, but here
is a useful chart anyway:

```
|---------------------------------------------|
| 1/C4: Collective Code Construction Contract |
|---------------------------------------------|
     |
     | extends
     \
   |-------------------------------------------------|
   | 2/COSS: Consensus-Oriented Specification System |
   |-------------------------------------------------|
        |
        | implements
        \
      |----------------------------|
      | OpenCannabis Specification |
      |----------------------------|
```

From there, focus-area working groups composed of _OpenCannabis Adopting Members_ (sponsor companies and staff) propose,
refine, review, ratify, revise, and deprecate toward shared goals. Underneath the _OpenCannabis Specification_ umbrella
are two core elements: the _Core Specification_ and _Extension Specifications_:

```
      |----------------------------|
      | OpenCannabis Specification |
      |----------------------------|
           |
           |
           |
         |---------------------------|
         | 3/OCS: Core Specification |
         |---------------------------|
             |
             |
            Extension Specs
```

#### Core Specification

The _Core Specification_ defines records and services which are expected to be implemented or supported by _all
adopters_, as applicable depending on their market posture and capabilities.

Examples of things defined in the _Core Specification_:
- Product keys
- Product types
- Records expressing time, location


#### Extension Specifications

_Extension Specs_ define additional functionality which extends the _Core_ specification for a particular purpose or
context. Extensions are always optional, and can be proprietary.

Examples of things defined in _Extension Specs_:
- Bluetooth proximity
- Menu payloads
- Lab test structures


[1]: https://github.com/OpenCannabis/RFC/tree/master/2
[2]: https://github.com/OpenCannabis/RFC/tree/master/1
