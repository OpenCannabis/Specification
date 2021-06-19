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

<li><code>opencannabis/crypto/Container.proto</code></li>

<ul>
    <li><a href="#opencannabis.crypto.EncryptedContainer"><code>EncryptedContainer</code></a></li><li><a href="#opencannabis.crypto.EncryptedData"><code>EncryptedData</code></a></li>
</ul><br />


<li><code>opencannabis/crypto/Integrity.proto</code></li>

<ul>
    <li><a href="#opencannabis.crypto.Hash"><code>Hash</code></a></li><li><a href="#opencannabis.crypto.HashedData"><code>HashedData</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.crypto.HashAlgorithm"><code>HashAlgorithm</code></a></li>
</ul><br />


<li><code>opencannabis/crypto/Keys.proto</code></li>

<ul>
    <li><a href="#opencannabis.crypto.AsymmetricKeypairParameters"><code>AsymmetricKeypairParameters</code></a></li><li><a href="#opencannabis.crypto.BlockCipherParameters"><code>BlockCipherParameters</code></a></li><li><a href="#opencannabis.crypto.InitializationVector"><code>InitializationVector</code></a></li><li><a href="#opencannabis.crypto.KeyMaterial"><code>KeyMaterial</code></a></li><li><a href="#opencannabis.crypto.KeyParameters"><code>KeyParameters</code></a></li><li><a href="#opencannabis.crypto.Keypair"><code>Keypair</code></a></li><li><a href="#opencannabis.crypto.SymmetricKey"><code>SymmetricKey</code></a></li><li><a href="#opencannabis.crypto.SymmetricKeyParameters"><code>SymmetricKeyParameters</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.crypto.BlockCipher"><code>BlockCipher</code></a></li><li><a href="#opencannabis.crypto.BlockMode"><code>BlockMode</code></a></li><li><a href="#opencannabis.crypto.InitializationVectorMode"><code>InitializationVectorMode</code></a></li><li><a href="#opencannabis.crypto.KeyAgreement"><code>KeyAgreement</code></a></li><li><a href="#opencannabis.crypto.KeyDisposition"><code>KeyDisposition</code></a></li><li><a href="#opencannabis.crypto.KeyType"><code>KeyType</code></a></li><li><a href="#opencannabis.crypto.KeyingScheme"><code>KeyingScheme</code></a></li><li><a href="#opencannabis.crypto.StreamCipher"><code>StreamCipher</code></a></li>
</ul><br />


<li><code>opencannabis/crypto/Signature.proto</code></li>

<ul>
    <li><a href="#opencannabis.crypto.Signature"><code>Signature</code></a></li>
</ul><br />


</ul>




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


_________________



<a name="opencannabis/crypto/Integrity.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/crypto/Integrity.proto`

Specifies cryptographic structures related to integrity protection and verification.

To import this module:

```proto
import "opencannabis/crypto/Integrity.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.crypto`     |
| **Bazel Target** | `//opencannabis.crypto`   |
|                  |                    |



<a name="opencannabis.crypto.Hash"></a>

### Message: <code>Hash</code> (`opencannabis.crypto.Hash`)

Specifies the hash portion of hashed data, along with the algorithm used to calculate the digest enclosed. This
particular container does not specify or otherwise contain the original referenced data.

```proto
import "opencannabis/crypto/Integrity.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.crypto.Hash field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `algorithm` | [`HashAlgorithm`](#opencannabis.crypto.HashAlgorithm) | *None.* | Specifies the algorithm in use. |
| `raw` | [`bytes`](#bytes) | *None.* | Raw binary output of the hash algorithm. |
| `hex` | [`string`](#string) | *None.* | Hex-encoded digest value. |
| `b64` | [`string`](#string) | *None.* | Base64-encoded digest value. |







<a name="opencannabis.crypto.HashedData"></a>

### Message: <code>HashedData</code> (`opencannabis.crypto.HashedData`)

Specifies a set of raw data, of some kind, and an attached digest/hash value, along with the algorithm used to
calculate the digest.

```proto
import "opencannabis/crypto/Integrity.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.crypto.HashedData field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `data` | [`bytes`](#bytes) | *None.* | Raw data that we are transmitting. |
| `hash` | [`Hash`](#opencannabis.crypto.Hash) | *None.* | Hash for the raw data in this payload. |






<!-- end messages -->


<a name="opencannabis.crypto.HashAlgorithm"></a>

### Enumeration: <code>HashAlgorithm</code> (`opencannabis.crypto.HashAlgorithm`)

Enumerates hash algorithms supported or known by the runtime for shared use.

```proto
import "opencannabis/crypto/Integrity.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.crypto.HashAlgorithm enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `SHA1` | `0` | Secure Hash Algorithm v2. |
| `MD5` | `1` | Message Digest v5. |
| `SHA256` | `2` | Secure Hash Algorithm, with 256-bit width. |
| `SHA384` | `3` | Secure Hash Algorithm, with 384-bit width. |
| `SHA512` | `4` | Secure Hash Algorithm, with 512-bit width. |
| `MURMUR` | `6` | Specifies hashing with MurmurHash. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/crypto/Keys.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/crypto/Keys.proto`



To import this module:

```proto
import "opencannabis/crypto/Keys.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.crypto`     |
| **Bazel Target** | `//opencannabis.crypto`   |
|                  |                    |



<a name="opencannabis.crypto.AsymmetricKeypairParameters"></a>

### Message: <code>AsymmetricKeypairParameters</code> (`opencannabis.crypto.AsymmetricKeypairParameters`)

Specifies parameters that are applicable to asymmetric key pairs.

```proto
import "opencannabis/crypto/Keys.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.crypto.AsymmetricKeypairParameters field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `scheme` | [`KeyingScheme`](#opencannabis.crypto.KeyingScheme) | *None.* | Asymmetric keying scheme in use. |
| `fingerprint` | [`Hash`](#opencannabis.crypto.Hash) | *None.* | Fingerprint of the public key that was used in some circumstance. |







<a name="opencannabis.crypto.BlockCipherParameters"></a>

### Message: <code>BlockCipherParameters</code> (`opencannabis.crypto.BlockCipherParameters`)

Specifies parameters that are applicable specifically to ciphers operating on blocks of data, to include the block
cipher operating mode, and the cipher itself.

```proto
import "opencannabis/crypto/Keys.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.crypto.BlockCipherParameters field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `algorithm` | [`BlockCipher`](#opencannabis.crypto.BlockCipher) | *None.* | Specifies the cipher in use. |
| `mode` | [`BlockMode`](#opencannabis.crypto.BlockMode) | *None.* | Specifies the operating mode of the block cipher in use. |







<a name="opencannabis.crypto.InitializationVector"></a>

### Message: <code>InitializationVector</code> (`opencannabis.crypto.InitializationVector`)

Specifies information about an initialization vector value. IV lifecycle and use is governed by the specific
application or use case.

```proto
import "opencannabis/crypto/Keys.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.crypto.InitializationVector field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `mode` | [`InitializationVectorMode`](#opencannabis.crypto.InitializationVectorMode) | *None.* | Specifies the operating mode for this IV, if applicable. |
| `raw` | [`bytes`](#bytes) | *None.* | Raw bytes for the vector. |
| `b64` | [`string`](#string) | *None.* | Base64-encoded raw bytes for the vector. |
| `number` | [`uint32`](#uint32) | *None.* | Initialization number. |







<a name="opencannabis.crypto.KeyMaterial"></a>

### Message: <code>KeyMaterial</code> (`opencannabis.crypto.KeyMaterial`)

Specifies raw or encoded key material data, which is to say, the actual public or private keys themselves. Key
material may be specified in raw binary form, encoded PEM form, or simply a cryptographic hash of their contents
(particularly when transmitting a hash of a public key).

```proto
import "opencannabis/crypto/Keys.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.crypto.KeyMaterial field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `fingerprint` | [`Hash`](#opencannabis.crypto.Hash) | *None.* | Cryptographic hash of the key in question. |
| `params` | [`KeyParameters`](#opencannabis.crypto.KeyParameters) | *None.* | Parameters regarding the subject key. |
| `raw` | [`bytes`](#bytes) | *None.* | Raw bytes of the key itself. |
| `pem` | [`string`](#string) | *None.* | Key, encoded in PEM format. |







<a name="opencannabis.crypto.KeyParameters"></a>

### Message: <code>KeyParameters</code> (`opencannabis.crypto.KeyParameters`)

Specifies parameters used to generate an underlying keypair.

```proto
import "opencannabis/crypto/Keys.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.crypto.KeyParameters field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `algorithm` | [`string`](#string) | *None.* | Algorithm in use to generate the key. |
| `format` | [`string`](#string) | *None.* | Format name for the key. |
| `bits` | [`uint32`](#uint32) | *None.* | Key size, in bits, if applicable. |
| `type` | [`KeyType`](#opencannabis.crypto.KeyType) | *None.* | Type/architecture of the keys. |
| `disposition` | [`KeyDisposition`](#opencannabis.crypto.KeyDisposition) | *None.* | Disposition of the subject key (i.e. scope). |
| `scheme` | [`KeyingScheme`](#opencannabis.crypto.KeyingScheme) | *None.* | Key type/keying scheme. |
| `symmetric` | [`SymmetricKeyParameters`](#opencannabis.crypto.SymmetricKeyParameters) | *None.* | Specifies parameters for symmetric keying. |







<a name="opencannabis.crypto.Keypair"></a>

### Message: <code>Keypair</code> (`opencannabis.crypto.Keypair`)

Specifies key material for a set (pair) of asymmetric keys, which is to say, a public and a private key. This
structure may be used to transmit both keys in full, or just a hash of the public key, depending on the fields that
are filled in or not when the object is constructed.

```proto
import "opencannabis/crypto/Keys.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.crypto.Keypair field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `public` | [`KeyMaterial`](#opencannabis.crypto.KeyMaterial) | *None.* | Public key. In PKI, the public key can be used only to encrypt data. |
| `private` | [`KeyMaterial`](#opencannabis.crypto.KeyMaterial) | *None.* | Private key. In PKI, the private key can be used to encrypt or decrypt data. |







<a name="opencannabis.crypto.SymmetricKey"></a>

### Message: <code>SymmetricKey</code> (`opencannabis.crypto.SymmetricKey`)

Specifies a symmetric encryption key, which is generally considered a secret value.

```proto
import "opencannabis/crypto/Keys.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.crypto.SymmetricKey field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `bits` | [`uint32`](#uint32) | *None.* | Bit size for the underlying symmetric key. |
| `iv` | [`InitializationVector`](#opencannabis.crypto.InitializationVector) | *None.* | Specifies an initialization vector value. Raw bytes should be encoded in Base64. |
| `raw` | [`bytes`](#bytes) | *None.* | Specifies the raw bytes of the key. |
| `b64` | [`string`](#string) | *None.* | Specifies the key bytes, encoded in base64. |







<a name="opencannabis.crypto.SymmetricKeyParameters"></a>

### Message: <code>SymmetricKeyParameters</code> (`opencannabis.crypto.SymmetricKeyParameters`)

Specifies parameters that are applicable to symmetric keys, or, keys shared between parties and identically used for
encryption and decryption.

```proto
import "opencannabis/crypto/Keys.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.crypto.SymmetricKeyParameters field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `stream` | [`StreamCipher`](#opencannabis.crypto.StreamCipher) | *None.* | Specifies a stream cipher. |
| `block` | [`BlockCipherParameters`](#opencannabis.crypto.BlockCipherParameters) | *None.* | Specifies a block cipher. |






<!-- end messages -->


<a name="opencannabis.crypto.BlockCipher"></a>

### Enumeration: <code>BlockCipher</code> (`opencannabis.crypto.BlockCipher`)

Specifies known block cipher algorithms. Only the ciphers defined here are usable for sensitive data within the
OpenCannabis ecosystem. Other ciphers may be added in the future.

```proto
import "opencannabis/crypto/Keys.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.crypto.BlockCipher enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNSPECIFIED_BLOCK_CIPHER` | `0` | Unspecified block cipher. |
| `AES` | `1` | Advanced Encryption Standard. |
| `CAMELLIA` | `2` | Camellia block cipher. |



<a name="opencannabis.crypto.BlockMode"></a>

### Enumeration: <code>BlockMode</code> (`opencannabis.crypto.BlockMode`)

Specifies symmetric keying-based systems' block cipher operating mode. Some ciphers only support a subset of the
operating modes defined herein.

```proto
import "opencannabis/crypto/Keys.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.crypto.BlockMode enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNSPECIFIED_BLOCK_MODE` | `0` | Unspecified block cipher operation mode. |
| `ECB` | `1` | Electronic Code Book mode. |
| `CBC` | `2` | Cipher Block Chaining mode. |
| `CFB` | `3` | Cipher Feedback mode. |
| `OFB` | `4` | Output Feedback mode. |
| `CTR` | `5` | Counter mode. |
| `CCM` | `6` | Counter with CBC-MAC mode. |
| `GCM` | `7` | Galois Counter mode. |
| `XTS` | `8` | XEX with Ciphertext Stealing mode. |
| `KWP` | `9` | Key Wrap Padding mode. |



<a name="opencannabis.crypto.InitializationVectorMode"></a>

### Enumeration: <code>InitializationVectorMode</code> (`opencannabis.crypto.InitializationVectorMode`)

Specifies known initialization vector operating or allocation modes.

```proto
import "opencannabis/crypto/Keys.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.crypto.InitializationVectorMode enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `STATIC_IV` | `0` | The IV is pre-shared or otherwise does not change. |
| `TOTP` | `1` | The IV is generated, or derive-able, using a Time-based One-Time-Password (OTP) algorithm. |
| `COUNTER` | `2` | The IV is generated from a counter. |



<a name="opencannabis.crypto.KeyAgreement"></a>

### Enumeration: <code>KeyAgreement</code> (`opencannabis.crypto.KeyAgreement`)

Specifies known key agreement protocols. Only the algorithms defined here are usable for sensitive data within the
OpenCannabis ecosystem. Other protocols may be added in the future.

```proto
import "opencannabis/crypto/Keys.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.crypto.KeyAgreement enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNSPECIFIED_KEY_AGREEMENT` | `0` | Unspecified key agreement protocol. |
| `DHE` | `1` | Diffie-Hellman Ephemeral Key Exchange. |
| `ECDHE` | `2` | Elliptic Curve Diffie-Hellman Ephemeral Key Exchange. |



<a name="opencannabis.crypto.KeyDisposition"></a>

### Enumeration: <code>KeyDisposition</code> (`opencannabis.crypto.KeyDisposition`)

Specifies the known key disposition options for a given key. This indicates the use parameters for a key structure.
Secret keys, or private keys, should always be kept private. Ephemeral keys are private but meant for temporally
bounded use in some specific context or circumstance.

```proto
import "opencannabis/crypto/Keys.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.crypto.KeyDisposition enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `PRIVATE` | `0` | Secret key for a symmetric connection, or the private portion of an asymmetric keypair. |
| `EPHEMERAL` | `1` | Ephemeral key for a given session or specific context. Considered secret. |
| `PUBLIC` | `2` | Public portion of an asymmetric keypair. |



<a name="opencannabis.crypto.KeyType"></a>

### Enumeration: <code>KeyType</code> (`opencannabis.crypto.KeyType`)

Specifies basic types of keying. Options include "symmetric," which describes keys that are shared in some manner or
otherwise expected to be equal during encryption and decryption, and "asymmetric," which describes keying systems
that include the notion of a "public" and "private" member of a keypair.

```proto
import "opencannabis/crypto/Keys.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.crypto.KeyType enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `SYMMETRIC` | `0` | Symmetric and/or pre-shared keys. |
| `ASYMMETRIC` | `1` | Asymmetric keying. |



<a name="opencannabis.crypto.KeyingScheme"></a>

### Enumeration: <code>KeyingScheme</code> (`opencannabis.crypto.KeyingScheme`)

Enumerates PKI/asymmetric keying schemes supported by the system. RSA, ECC and DSA keying are usually used for TLS,
and in particular HTTPS (with DSA being in the far minority). EdDSA keying is used for distributed ledger operations.

```proto
import "opencannabis/crypto/Keys.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.crypto.KeyingScheme enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `RSA` | `0` | RSA keying. |
| `ECC` | `1` | ECC (curve-based) keying. |
| `DSA` | `2` | DSA keying. |
| `ED_DSA` | `3` | ED-DSA keying. |



<a name="opencannabis.crypto.StreamCipher"></a>

### Enumeration: <code>StreamCipher</code> (`opencannabis.crypto.StreamCipher`)

Specifies known stream cipher algorithms. Only the ciphers defined here are usable for sensitive data within the
OpenCannabis ecosystem. Other ciphers may be added in the future.

```proto
import "opencannabis/crypto/Keys.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.crypto.StreamCipher enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNSPECIFIED_STREAM_CIPHER` | `0` | Unspecified stream cipher. |
| `RC5` | `1` | Rivest Cipher 5. |
| `RC6` | `2` | Rivest Cipher 6. |
| `CHACHA20` | `3` | ChaCha20-Poly1305. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


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



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
