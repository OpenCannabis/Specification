# Protocol Documentation
<a name="top"></a>

---
Module: `module`
Package: `opencannabis.module`
Domain: rfc.opencannabis.info
---


## Reference Documentation

- [opencannabis/crypto/Signature.proto](#opencannabis/crypto/Signature.proto)
  - [Signature](#opencannabis.crypto.Signature)

- [opencannabis/crypto/Container.proto](#opencannabis/crypto/Container.proto)
  - [EncryptedContainer](#opencannabis.crypto.EncryptedContainer)
  - [EncryptedData](#opencannabis.crypto.EncryptedData)





<a name="opencannabis/crypto/Signature.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/crypto/Signature.proto
Specifies structures that carry or otherwise contain cryptographic signatures.


<a name="opencannabis.crypto.Signature"></a>

### Signature
Specifies the concept of a cryptographic signature, including the raw signature bytes, a fingerprint of the data that
was signed, and information about the public key corresponding to the private key that performed the signing.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| public_key | [KeyMaterial](#opencannabis.crypto.KeyMaterial) |  | Public key fingerprint, or raw content of the public key, that performed the signing operation. |
| fingerprint | [Hash](#opencannabis.crypto.Hash) |  | Cryptographic fingerprint of the subject data that was signed. This is the actual value that should be signed by the private key and recomputed via the public key. |
| raw | [bytes](#bytes) |  | Raw bytes of the digital signature, performed over `fingerprint` by the private key corresponding to the `public_key` listed in this request. |
| b64 | [string](#string) |  | Base-64 encoded raw bytes of the digital signature, performed over `fingerprint` by the private key corresponding to the `public_key` listed in this request. |
| hex | [string](#string) |  | Hex-encoded and uppercased raw bytes of the digital signature, performed over `fingerprint` by the private key corresponding to the `public_key` listed in the request. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


<a name="opencannabis/crypto/Container.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## opencannabis/crypto/Container.proto
Specifies container structures for use in cryptographic algorithms and design patterns.


<a name="opencannabis.crypto.EncryptedContainer"></a>

### EncryptedContainer
Container that carries an encrypted data payload, and maintains metadata describing it.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| payload | [EncryptedData](#opencannabis.crypto.EncryptedData) |  | Specifies the encrypted data payload, or, the content inside this encrypted container. |
| keying | [KeyType](#opencannabis.crypto.KeyType) |  | Type of keying used to encrypt/decrypt this payload. |
| vector | [InitializationVector](#opencannabis.crypto.InitializationVector) |  | Initialization vector value for this container, if applicable according to the algorithm in use. |
| key | [SymmetricKeyParameters](#opencannabis.crypto.SymmetricKeyParameters) |  | Specifies information regarding the key used to encrypt this container. |
| keypair | [AsymmetricKeypairParameters](#opencannabis.crypto.AsymmetricKeypairParameters) |  | Specifies information regarding the key pair used to encrypt this container. |






<a name="opencannabis.crypto.EncryptedData"></a>

### EncryptedData
Carries a payload of arbitrary data, that is supposedly encrypted in some manner.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| data | [bytes](#bytes) |  | Ciphertext, i.e., data contained in the encrypted container. |
| encoding | [opencannabis.content.Encoding](#opencannabis.content.Encoding) |  | Content encoding for the raw ciphertext data specified. |
| compression | [opencannabis.base.Compression](#opencannabis.base.Compression) |  | Compression applied to the cleartext, if applicable and specified. |
| fingerprint | [Hash](#opencannabis.crypto.Hash) |  | Cryptographic fingerprint of the ciphertext data. If compression is active, this is applied beforehand. |





<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
