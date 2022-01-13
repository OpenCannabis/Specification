---
domain: rfc.ocpx.info
shortname: OCP-15
parent: OCP-03
name: Verified Identity Assertion
version: 1.0
status: DRAFT
package: opencannabis.identity.consumer
editor: Sam Gammon <sg@cookies.co>
sponsors:
- Cookies
- Amuse
contributors:
- Sam Gammon <sam.g@cookies.co>
- George Durzi <george@openroaddeliveryholdings.com>
---
<a name="top"></a>

# Data Specification: Verified Identity Assertion

![Status: Raw](https://img.shields.io/badge/Status%20%20-Raw-blueviolet)
![Domain: `rfc.ocpx.info`](https://img.shields.io/badge/Domain%20%20-rfc.ocpx.info-gray)
![Code: `OCS-15`](https://img.shields.io/badge/Code%20%20-OCP15-gray)
![Version: `1.0`](https://img.shields.io/badge/Version%20%20-1.0-gray)
![Package: `opencannabis.identity.consumer`](https://img.shields.io/badge/Package%20%20-opencannabis.identity.consumer-gray)


### Status of this Memo

This specification's current status is considered a `DRAFT`. Distribution of this memo is unlimited.


## Background

This note is a draft. It is intended to document anticipated specs related to identity verification and assertion between licensed cannabis providers and/or trading partners.


### Problem Statement

Business that engages in legal cannabis activity must generally be _licensed_. Retail licensure in the cannabis space, which covers storefront and non-storefront services (meaning, brick/mortar and delivery), must generally _verify a user's age_ to ensure they legally qualify to purchase cannabis.

Age and medical access requirements vary by jurisdiction, but generally, a customer **MUST** be 18 years or older _and_ have a valid medical cannabis card or prescription, where applicable, _or_ **MUST** be 21 years or older, where adult-use law applies.

Brands who implement D2C e-commerce shopping experiences must perform this age validation for myriad reasons. However, the final entity which _fulfills_ the order also needs access to this information, in a secure and private way which can be trusted across partnership boundaries.

This path for ordering could be visualized like this:
```
customer --verifies identity--> brand --asserts identity--> fulfillment partner
```

The service proposed herein would enable communication from the _brand_ to the _fulfillment partner_ with a secure identity assertion yielded from an identity verification flow.


### Proposed Solution
```
customer --verifies identity--> brand
```

We (Cookies) propose a minimum-viable-interface based on JSON Web Tokens (JWTs) and standard key resolution via JWKS (JSON Web Keys) and HMAC.

#### Step 1: Verifying identity
This step is largely out of scope for this specification, but for the purposes of the following section, we define the following requirements for the identity verification process itself:

Brand-side identity verification **MUST** collect, and reasonably verify:
- Customer's date of birth
- Customer's legal name
- Customer's address of record, as applicable
    - _Note:_ In some cases, these address values are needed for tax calculations.

Brand-side identity verification **MAY** collect:
- Customer's passport nationality, as applicable
- Customer's state of residence, as applicable


#### Step 2: _Asserting verified identity_
```
brand --asserts identity--> fulfillment partner
```

Once the brand has completed identity verification, a JSON Web Token ([RFC7519](https://datatracker.ietf.org/doc/html/rfc7519)) is issued by the brand, using private key material _only_ held by the brand.

Brand adopters of this proposal **MUST**:
- Publish RSA public keys according to the JWKS Standard ([RFC7517](https://datatracker.ietf.org/doc/html/rfc7517)), _or_ must make pre-shared HMAC keys available to partners for verification purposes
- Adopt the following required fields in the ID verification payload
    - User's age
    - User's first and last name
    - User's document type
    - User's document ID

Brand adopters **SHOULD** heavily prefer JWKS-based keying because key change is otherwise manual and may risk signature verification breakage during key rotation events.

Fulfillment partner adopters of this proposal **MUST**:
- Acquire shared key material, or JWKS-based public keys, from partner brand companies
- Properly verify the JWS (JSON Web Signature) payload contained in the JWT, in accordance with [RFC7515](https://datatracker.ietf.org/doc/html/rfc7515)
- Provide or require extended attributes which should be collected from users by the verification process
    - Link to document image
    - Link to user's selfie image, as applicable


#### Appendix A: JWT Structure Definition

Within a typical JWT, there are three components: a header, which contains info like the signing algorithm and key ID; a body, which contains key-value pairs which are referred to as "claims"; and the base64-encoded signature.

To facilitate interoperability with this token, the claims section of the JWT body **MUST** contain a special map of data, at the assigned key `idv`, which is abbreviated from `idVerify`. Within that structure, known keys define values which are specified within this proposal.

Example JWT structure:

Header (standard + hint):
```json
{
  "kid": "abc123",
  "alg": "..."
}
```

Body (standard + extensions at `idv`):
```json
{
  "iat": "...",
  "exp": "...",
  "iss": "...",
  "aud": "...",
  "...": "...",
  "idv": {
    "dob": "1999-12-30",
    "fin": 1635366497,
    "name": {
      "given": "Mary",
      "last": "Jane",
      "nick": "Liz"
    }
  }
}
```

Tour of the above properties (all timestamps expressed as Unix epoch timestamps at second-level resolution):
- Standard JWT claims
    - `iat`: Issuance timestamp for JWT
    - `exp`: Expiration timestamp for JWT
    - `iss`: Issuer (brand authority) for JWT
    - `aud`: Application audience for JWT
- Extension ID verification JWT claims (at key `idv`, short for `idVerify`)
    - `dob`: User's date-of-birth, formatted in [ISO8601](https://www.w3.org/TR/NOTE-datetime) as `YYYY-MM-DD`
    - `fin`: Seconds-level Unix epoch timestamp indicating when the user last completed verification
    - `name`: User's name information payload
        - `given`: User's given name, as expressed on their ID, and corrected by them
        - `last`: User's family/last name, as expressed on their ID, and corrected by them
        - `nick`: User's go-by nickname, as provided by them (**OPTIONAL**)


##### Sample structure

Say we have a user named _Mary Jane_, who goes by _Liz_, and was born on _December 30th, 1999_, making her 21 years old at the time of this writing. She has verified her ID through Cookies, and wishes to place an order for delivery through Cookies with Amuse.

After performing verification, her user JWT is amended with an _enhanced-identity token_, which takes on the following structure:

```
{
  "iat": 1635367237,
  "exp": 1635370837,
  "iss": "https://accounts.cookies.co",
  "aud": "urn:cookies:storefront",
  "idv": {
    "dob": "1999-12-30",
    "fin": 1635367237,
    "name": {
      "given": "Mary",
      "last": "Jane",
      "nick": "Liz"
    }
  }
}
```

In this example, the provider elects to use HS256 with pre-shared key material (for easy reproducibility and testing), but note that RS256 **SHOULD** be preferred. Therefore, the user JWT header would be:

```json
{
  "alg": "HS256",
  "typ": "JWT"
}
```

Combining these values with the sample shared HMAC token `testing123123`, and encoding the structure as a standard JWT (you can do this too at [JWT.io](https://jwt.io/)) results in the following final payload:

```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2MzUzNjcyMzcsImV4cCI6MTYzNTM3MDgzNywiaXNzIjoiaHR0cHM6Ly9hY2NvdW50cy5jb29raWVzLmNvIiwiYXVkIjoidXJuOmNvb2tpZXM6c3RvcmVmcm9udCIsImlkdiI6eyJkb2IiOiIxOTk5LTEyLTMwIiwiZmluIjoxNjM1MzY3MjM3LCJuYW1lIjp7ImdpdmVuIjoiTWFyeSIsImxhc3QiOiJKYW5lIiwibmljayI6IkxpeiJ9fX0.CsuU4xi03syKTFYtvhbMA8UK3AlYGbPV9rD6CJzJz1I
```

### Adopters

Cookies is adopting this specification with Amuse.
