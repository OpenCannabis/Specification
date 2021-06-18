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

<li><code>opencannabis/crypto/Signature.proto</code></li>

<ul>
    <li><a href="#opencannabis.crypto.Signature"><code>Signature</code></a></li>
</ul><br />


<li><code>opencannabis/crypto/Container.proto</code></li>

<ul>
    <li><a href="#opencannabis.crypto.EncryptedContainer"><code>EncryptedContainer</code></a></li><li><a href="#opencannabis.crypto.EncryptedData"><code>EncryptedData</code></a></li>
</ul><br />


</ul>




_________________



<a name="opencannabis/crypto/Signature.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/crypto/Signature.proto`

Specifies structures that carry or otherwise contain cryptographic signatures.

To import this module:

```proto
import "opencannabis/crypto/Signature.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.crypto`     |
| **Bazel Target** | `//opencannabis.crypto`   |
|                  |                    |



<a name="opencannabis.crypto.Signature"></a>

### Message: <code>Signature</code> (`opencannabis.crypto.Signature`)

Specifies the concept of a cryptographic signature, including the raw signature bytes, a fingerprint of the data that
was signed, and information about the public key corresponding to the private key that performed the signing.

```proto
import "opencannabis/crypto/Signature.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.crypto.Signature field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `public_key` | [`KeyMaterial`](#opencannabis.crypto.KeyMaterial) | *None.* | Public key fingerprint, or raw content of the public key, that performed the signing operation. |
| `fingerprint` | [`Hash`](#opencannabis.crypto.Hash) | *None.* | Cryptographic fingerprint of the subject data that was signed. This is the actual value that should be signed by the private key and recomputed via the public key. |
| `raw` | [`bytes`](#bytes) | *None.* | Raw bytes of the digital signature, performed over `fingerprint` by the private key corresponding to the `public_key` listed in this request. |
| `b64` | [`string`](#string) | *None.* | Base-64 encoded raw bytes of the digital signature, performed over `fingerprint` by the private key corresponding to the `public_key` listed in this request. |
| `hex` | [`string`](#string) | *None.* | Hex-encoded and uppercased raw bytes of the digital signature, performed over `fingerprint` by the private key corresponding to the `public_key` listed in the request. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/crypto/Container.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/crypto/Container.proto`

Specifies container structures for use in cryptographic algorithms and design patterns.

To import this module:

```proto
import "opencannabis/crypto/Container.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.crypto`     |
| **Bazel Target** | `//opencannabis.crypto`   |
|                  |                    |



<a name="opencannabis.crypto.EncryptedContainer"></a>

### Message: <code>EncryptedContainer</code> (`opencannabis.crypto.EncryptedContainer`)

Container that carries an encrypted data payload, and maintains metadata describing it.

```proto
import "opencannabis/crypto/Container.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.crypto.EncryptedContainer field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `payload` | [`EncryptedData`](#opencannabis.crypto.EncryptedData) | *None.* | Specifies the encrypted data payload, or, the content inside this encrypted container. |
| `keying` | [`KeyType`](#opencannabis.crypto.KeyType) | *None.* | Type of keying used to encrypt/decrypt this payload. |
| `vector` | [`InitializationVector`](#opencannabis.crypto.InitializationVector) | *None.* | Initialization vector value for this container, if applicable according to the algorithm in use. |
| `key` | [`SymmetricKeyParameters`](#opencannabis.crypto.SymmetricKeyParameters) | *None.* | Specifies information regarding the key used to encrypt this container. |
| `keypair` | [`AsymmetricKeypairParameters`](#opencannabis.crypto.AsymmetricKeypairParameters) | *None.* | Specifies information regarding the key pair used to encrypt this container. |







<a name="opencannabis.crypto.EncryptedData"></a>

### Message: <code>EncryptedData</code> (`opencannabis.crypto.EncryptedData`)

Carries a payload of arbitrary data, that is supposedly encrypted in some manner.

```proto
import "opencannabis/crypto/Container.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.crypto.EncryptedData field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `data` | [`bytes`](#bytes) | *None.* | Ciphertext, i.e., data contained in the encrypted container. |
| `encoding` | [`opencannabis.content.Encoding`](#opencannabis.content.Encoding) | *None.* | Content encoding for the raw ciphertext data specified. |
| `compression` | [`opencannabis.base.Compression`](#opencannabis.base.Compression) | *None.* | Compression applied to the cleartext, if applicable and specified. |
| `fingerprint` | [`Hash`](#opencannabis.crypto.Hash) | *None.* | Cryptographic fingerprint of the ciphertext data. If compression is active, this is applied beforehand. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
