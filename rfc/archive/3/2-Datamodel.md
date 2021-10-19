
## Section 1: Datamodel
<a name="top"></a>

Central to the OpenCannabis project's goals is a *unified datamodel* for use across functional boundaries. When
cultivators talk about *flowers* with labs, and labs talk about *test results* with retailers, and so on, they are all
talking about the same thing - but in today's legal cannabis industry, they aren't speaking the same language.

### Table of Contents
1. [Toolchain](#Toolchain)
1. [General Guidelines](#General-Guidelines)
    - [Nomenclature](#Nomenclature)
1. [Message Categories](#Message-Categories)
    - [Part 1.1: Core Structures](3-Core-Structures.md)
        - `base`: Foundational structures used across the spec.
        - `temporal`: Dates, times, and so on.
        - `crypto`: Cryptographic primitives and containers.
        - `geo`: Structures relating to geography.
        - `device`: Managed and anonymous, operating systems, browsers.
        - `content`: Narrative and marketing content.
        - `person`: People, names, birth dates, and so on.
        - `contact`: Email, phone, and postal addresses.
        - `media`: Images, video, documents, etc.
        - `structs`: Utility structures used across the spec.
    - [Part 1.2: Extension Structures](4-Extension-Structures.md)
        - `labtesting`: Laboratory testing and QA.
        - `pricing`: Pricing schemes and structures.
        - `proximity`: Bluetooth and GPS-related structures.
        - `oauth`: OAuth2 implementation structures.
        - `products`: High-level product structures.
        - `commerce`: Commercial ordering and fulfillment structures.
        - `accounting`: Bookkeeping, accounting, taxes, and so on.

<a name="Toolchain"></a>

### i. Toolchain

The model put forth by OpenCannabis is specified in a programming language called
[Protocol Buffers](https://developers.google.com/protocol-buffers/) that originated inside Google. *Protobuf*, as it is
referred to colloquially, has numerous strengths that this project leverages to deliver better compatibility and
support to spec adopters:

* Protobuf is an [easy language to learn](https://developers.google.com/protocol-buffers/docs/proto3), even for
  non-technical contributors
* Models written in Protobuf can be compiled into a _ton_ of languages: all popular ones and quite a few others, too.
  This means: **complete language agnosticism** if you are adopting OpenCannabis! 🚀
    * Language support includes, but is not limited to: C/C++, Java, C#, Python Go, Objective-C, Swift, PHP, and R
* Custom Protobuf plugins can be written to generate custom code, docs, or other materials
* Compatibility with other Protobuf-authored models, such as [OpenRTB](https://openrtb.github.io/OpenRTB/) and
  [Google APIs](https://github.com/googleapis/googleapis/tree/master/google)

<a name="Nomenclature"></a>

#### A. Nomenclature

Models implemented in Protobuf are referred to as *Messages*. *Services*, which specify *Methods*, make use of
*Messages* as input and output structures. 

<a name="General-Guidelines"></a>

### ii. General Guidelines

These guidelines govern how OpenCannabis specifications make use of Protobuf.

1. Models accompanying a specification **MUST** provide an implementation written in Protobuf.
1. Source files **MUST** use the syntax mode `proto3`.
1. Source files **MUST** use the package prefix with `opencannabis`.
1. Source files **MUST** adhere to the policies in *3/OCS- 1.2(A-D)*.

#### A. Source file guidelines

These guidelines govern how OpenCannabis protobuf source files must be formatted and specified.

1. Source files **MUST** specify a `java_package`.
1. Source files **MUST** specify a `objc_class_prefix`.
1. Source files **MUST** specify a Java package starting with `io.opencannabis`.
1. Source files **MUST** place exactly one newline at the beginning of the file.
1. Source files **MUST** place exactly one newline after the `syntax = proto3` declaration.
1. Source files **MUST** list file-level options immediately after the `syntax` declaration.
1. Source files **MUST** list imports immediately after file-level options, separated by exactly one newline.
1. Source files **MUST** place exactly two newlines after the imports.
1. Source files **SHOULD** specify an `optimize_for` value of `SPEED`.
1. Source files **SHOULD** specify a `java_outer_classname`.
1. Source files **SHOULD** make use of the `objc_class_prefix` value of `OCS`.
1. Source files **SHOULD** place `enum` specifications at the beginning of the file.
1. Source files **SHOULD** place `service` specifications at the end of the file.
1. Source files **MAY** break up many imports into groups, each separated by exactly one newline.

#### B. Messages

These guidelines govern how OpenCannabis protobuf messages are structured and specified.

1. Messages **MUST** begin with a capital letter.
1. Messages **MUST** adhere to *CamelCase* when including multiple words in their name.
1. Messages **MUST** include a comment describing their use and purpose, according to *3/OCS-1.2(D)*.
1. Messages **MUST** select or allocate a _Message Category_ according to *3/OCS-1.3*.
1. Messages **MUST** include exactly one newline between each other.
1. Messages **MUST** immediately begin properties without an initial newline.
1. Messages **MUST NOT** include a terminal newline before the closing curly bracket.
1. Messages **SHOULD** specify required or notable properties first.

#### C. Properties

These guidelines govern individual message properties.

1. Properties **MUST** be specified in all-lowercase, underscored form *(i.e., `example_property_name`)*.
1. Properties **MUST** include exactly one newline after their definition, unless they are the last property specified.
1. Properties **MUST** include a comment describing their use and purpose, according to *3/OCS-1.2(D)*.

#### D. Commenting

These guidelines govern inline source comments on *Messages*, *Properties*, *Services* and *Methods*.

1. Comments **MUST** begin with a single space.
1. Comments **MUST** end with a period.
1. Comments **MUST** occur directly above the entry they are commenting on, with no newline below.
1. Comments **MUST** wrap lines at 80 characters; no less, no more.
1. Comments **SHOULD** describe their subject in simple, easy-to-understand terms.
1. Comments **SHOULD** be complete sentences, in present-imperative form *(i.e., 'Specifies xyz, in abc
  circumstances.')*.

<a name="Message-Categories"></a>

### iii. Message Categories

Messages may be grouped or placed adjacently according to their functional purpose. Message categories may either be
included in the core specification, (in which case, they are considered _Core Message Categories_) or they are proposed
by an _Extension_ to the OpenCannabis specification, the process for which is specified below in _Subsection B_. Each
_Core Message Category_ and _Extension Message Category_ must include the models and procedures associated with that
category.

All categories are to be registered, and listed accordingly in the main specification, in
[_Appendix A: Model Categories_](XA-Message-Categories.md), along with their type and maturity status.

These guidelines govern the taxonomic process and interpretation of message categories:

1. Message categories **MUST** follow the [1/C4](../1/README.md) and [2/COSS](../2/README.md) guidelines and lifecycle.
1. Message categories **MUST** be addressed by a one-word name in all-lowercase.
1. Message categories **MUST** align folder structure with Protocol Buffer package structure.
1. Message categories **MUST NOT** be coupled to stakeholder boundaries *(i.e., `cultivation` or `manufacturing`).*
1. Contributors **MUST** provide a strong rationale for creating a new message category.
1. Contributors **SHOULD** make an attempt to use an existing category rather than create one.
1. Message categories **SHOULD** be allocated according to functional boundaries *(i.e., `media` or `analytics`)*
1. Message categories **MAY** be nested in other message categories.
