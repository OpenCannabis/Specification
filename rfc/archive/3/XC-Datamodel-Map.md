
## Appendix C: Datamodel Map

This specification appendix, entitled _Datamodel Map_, contains the entire _OpenCannabis Specification_ set of core and
extension data models, charted in one graphic.

{% nomnoml %}

[Language
  |ENGLISH: 0|SPANISH: 1|FRENCH: 2]

[Compression|enabled: bool|type: Compression.Type|
  [Type|NONE: 0|GZIP: 1|BROTLI: 2|SNAPPY: 3]]

[ProductKind
  |FLOWERS: 0|EDIBLES: 1|EXTRACTS: 2|PREROLLS: 3|APOTHECARY: 4|CARTRIDGES: 5|PLANTS: 6|MERCHANDISE: 7]

[ProductKey
  |id: string|type: ProductKind]->[ProductKind]

[ProductReference
  |name: string|key: ProductKey]->[ProductKey]

[Date
  |iso8601: string]

[Instant
  |iso8601: string|timestamp: uint64]

[Time
  |iso8601: string]

{% endnomnoml %}
