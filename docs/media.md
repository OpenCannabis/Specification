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

<li><code>opencannabis/media/MediaOrientation.proto</code></li>

<ul>
    <li><a href="#opencannabis.media.MediaOrientation"><code>MediaOrientation</code></a></li>
</ul><br />


<li><code>opencannabis/media/MediaType.proto</code></li>

<ul>
    <li><a href="#opencannabis.media.MediaType"><code>MediaType</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.media.MediaType.DocumentKind"><code>MediaType.DocumentKind</code></a></li><li><a href="#opencannabis.media.MediaType.ImageDPI"><code>MediaType.ImageDPI</code></a></li><li><a href="#opencannabis.media.MediaType.ImageKind"><code>MediaType.ImageKind</code></a></li><li><a href="#opencannabis.media.MediaType.Kind"><code>MediaType.Kind</code></a></li><li><a href="#opencannabis.media.MediaType.VideoKind"><code>MediaType.VideoKind</code></a></li>
</ul><br />


<li><code>opencannabis/media/MediaKey.proto</code></li>

<ul>
    <li><a href="#opencannabis.media.MediaKey"><code>MediaKey</code></a></li><li><a href="#opencannabis.media.MediaReference"><code>MediaReference</code></a></li>
</ul><br />


<li><code>opencannabis/media/MediaItem.proto</code></li>

<ul>
    <li><a href="#opencannabis.media.MediaItem"><code>MediaItem</code></a></li><li><a href="#opencannabis.media.MediaSubject"><code>MediaSubject</code></a></li><li><a href="#opencannabis.media.MediaUpload"><code>MediaUpload</code></a></li>
</ul>
<ul>
    <li><a href="#opencannabis.media.MediaPrivacy"><code>MediaPrivacy</code></a></li><li><a href="#opencannabis.media.MediaStatus"><code>MediaStatus</code></a></li>
</ul><br />


</ul>




_________________



<a name="opencannabis/media/MediaOrientation.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/media/MediaOrientation.proto`

Enumerates potential media orientation.

To import this module:

```proto
import "opencannabis/media/MediaOrientation.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.media`     |
| **Bazel Target** | `//opencannabis.media`   |
|                  |                    |


<!-- end messages -->


<a name="opencannabis.media.MediaOrientation"></a>

### Enumeration: <code>MediaOrientation</code> (`opencannabis.media.MediaOrientation`)

Orientation status of a piece of media. Provided by camera operations on mobile devices,
in some cases, and also stored along with media sometimes.

```proto
import "opencannabis/media/MediaOrientation.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.media.MediaOrientation enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UP` | `0` | Media is oriented 'up'. |
| `DOWN` | `1` | Media is oriented 'down'. |
| `LEFT` | `2` | Media is oriented 'left'. |
| `RIGHT` | `3` | Media is oriented 'right'. |
| `UP_MIRRORED` | `4` | Media is oriented 'up,' and mirrored. |
| `DOWN_MIRRORED` | `5` | Media is oriented 'down,' and mirrored. |
| `LEFT_MIRRORED` | `6` | Media is oriented 'left,' and mirrored. |
| `RIGHT_MIRRORED` | `7` | Media is oriented 'right,' and mirrored. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/media/MediaType.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/media/MediaType.proto`

Provides a structure for media type. Enumerates various types of media file types.

To import this module:

```proto
import "opencannabis/media/MediaType.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.media`     |
| **Bazel Target** | `//opencannabis.media`   |
|                  |                    |



<a name="opencannabis.media.MediaType"></a>

### Message: <code>MediaType</code> (`opencannabis.media.MediaType`)

Specifies the type of media being attached or described.

```proto
import "opencannabis/media/MediaType.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.media.MediaType field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `kind` | [`MediaType.Kind`](#opencannabis.media.MediaType.Kind) | *None.* | Specifies the generic kind of media being described or attached. |
| `image_type` | [`MediaType.ImageKind`](#opencannabis.media.MediaType.ImageKind) | *None.* | Specifies content type for an image-based media item. |
| `document_type` | [`MediaType.DocumentKind`](#opencannabis.media.MediaType.DocumentKind) | *None.* | Specifies content type for a document-based media item. |
| `video_type` | [`MediaType.VideoKind`](#opencannabis.media.MediaType.VideoKind) | *None.* | Specifies content type for a video-based media item. |






<!-- end messages -->


<a name="opencannabis.media.MediaType.DocumentKind"></a>

### Enumeration: <code>MediaType.DocumentKind</code> (`opencannabis.media.MediaType.DocumentKind`)

Specifies kinds of documents that may be attached or described.

```proto
import "opencannabis/media/MediaType.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.media.MediaType.DocumentKind enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNSPECIFIED_DOCUMENT_TYPE` | `0` | Unspecified document type. |
| `TXT` | `1` | Plaintext format. |
| `HTML` | `2` | HTML format. |
| `PDF` | `3` | PDF format. |
| `MARKDOWN` | `4` | Markdown format. |



<a name="opencannabis.media.MediaType.ImageDPI"></a>

### Enumeration: <code>MediaType.ImageDPI</code> (`opencannabis.media.MediaType.ImageDPI`)

Specifies the pixel density setting for an image.

```proto
import "opencannabis/media/MediaType.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.media.MediaType.ImageDPI enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `X1` | `0` | The image has normal, 1:1 pixel density. |
| `X2` | `1` | The image has double pixel density. |
| `X3` | `2` | The image has triple pixel density. |



<a name="opencannabis.media.MediaType.ImageKind"></a>

### Enumeration: <code>MediaType.ImageKind</code> (`opencannabis.media.MediaType.ImageKind`)

Specifies kinds of images that may be attached or described.

```proto
import "opencannabis/media/MediaType.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.media.MediaType.ImageKind enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNSPECIFIED_IMAGE_TYPE` | `0` | Unspecified image type. |
| `PNG` | `1` | PNG image. |
| `JPG` | `2` | JPG image. |
| `GIF` | `3` | GIF image. |
| `SVG` | `4` | SVG image. |
| `WEBP` | `5` | WEBP image. |



<a name="opencannabis.media.MediaType.Kind"></a>

### Enumeration: <code>MediaType.Kind</code> (`opencannabis.media.MediaType.Kind`)

Enumerates, in generic terms, the kinds of media that can be attached or described.

```proto
import "opencannabis/media/MediaType.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.media.MediaType.Kind enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `LINK` | `0` | Web link, or URI. |
| `IMAGE` | `1` | Image or photograph. |
| `DOCUMENT` | `2` | Document or text data. |
| `VIDEO` | `3` | Video data. |



<a name="opencannabis.media.MediaType.VideoKind"></a>

### Enumeration: <code>MediaType.VideoKind</code> (`opencannabis.media.MediaType.VideoKind`)

Specifies kinds of videos that may be attached or described.

```proto
import "opencannabis/media/MediaType.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.media.MediaType.VideoKind enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `UNSPECIFIED_VIDEO_TYPE` | `0` | Unspecified video type. |
| `MP4` | `1` | MP4 video. |
| `FLV` | `2` | Flash video. |
| `HLS` | `3` | HTTP Live Streaming video. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/media/MediaKey.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/media/MediaKey.proto`

Provides structures relating to a media key and reference.

To import this module:

```proto
import "opencannabis/media/MediaKey.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.media`     |
| **Bazel Target** | `//opencannabis.media`   |
|                  |                    |



<a name="opencannabis.media.MediaKey"></a>

### Message: <code>MediaKey</code> (`opencannabis.media.MediaKey`)

Key uniquely describing an item of media known to the system. An "item of media" can be anything from an image or a
video, to a PDF document, or larger data.

```proto
import "opencannabis/media/MediaKey.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.media.MediaKey field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `id` | [`string`](#string) | *None.* | Unique ID for this media item. |







<a name="opencannabis.media.MediaReference"></a>

### Message: <code>MediaReference</code> (`opencannabis.media.MediaReference`)

Reference to a global media item, which consists of at least a key/ID and a URL at which the media may be consumed.
Referenced media is expected to be public.

```proto
import "opencannabis/media/MediaKey.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.media.MediaReference field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `key` | [`MediaKey`](#opencannabis.media.MediaKey) | *None.* | Key for the media item. |
| `uri` | [`string`](#string) | *None.* | URI at which the media item can be consumed/downloaded. |
| `type` | [`MediaType`](#opencannabis.media.MediaType) | *None.* | Specifies the type of media being referenced. |






<!-- end messages -->

<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->


_________________



<a name="opencannabis/media/MediaItem.proto"></a>
<p align="right"><a href="#top" style="text-decoration:none">🔼 Top</a></p>

### `opencannabis/media/MediaItem.proto`

Provides structures for specifying the subject of a media image as well as the structure to specify a specific media
item. Enumerates various media stages and privacy.

To import this module:

```proto
import "opencannabis/media/MediaItem.proto";
```

|                  |                    |
| ---------------- | ------------------ |
| **Domain**       | `object.ocpx.info` |
| **Package**      | `opencannabis.media`     |
| **Bazel Target** | `//opencannabis.media`   |
|                  |                    |



<a name="opencannabis.media.MediaItem"></a>

### Message: <code>MediaItem</code> (`opencannabis.media.MediaItem`)

Describes an individual media item, which can be an image, video, etc. Media at its most basic is simply binary blob
data persisted in GCS and tracked with a corresponding DB record. Document types (like PDF, HTML, TXT) are all
supported in addition to traditional rich media (images, video, sound).

```proto
import "opencannabis/media/MediaItem.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.media.MediaItem field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `key` | [`MediaKey`](#opencannabis.media.MediaKey) | *None.* | Key uniquely identifying this media item. |
| `status` | [`MediaStatus`](#opencannabis.media.MediaStatus) | *None.* |  |
| `type` | [`MediaType`](#opencannabis.media.MediaType) | *None.* | Type of media this is describing. |
| `name` | [`string`](#string) | *None.* | Friendly name for this media. |
| `uri` | [`string`](#string) | *None.* | Origin URI to this media. |
| `serving_uri` | [`string`](#string) | *None.* | Serving URI for this media, if it differs from the origin URI. |
| `privacy` | [`MediaPrivacy`](#opencannabis.media.MediaPrivacy) | *None.* | Privacy setting for this media item. Defaults to location-wide access. |
| `created` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Timestamp for when this record was created. |
| `modified` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Timestamp for when this record was last modified. |
| `published` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Timestamp for when this media item was originally published. |
| `scope` | [`string`](#string) | *None.* | Ownership scope for this media item. |
| `token` | [`string`](#string) | *None.* | Most recent upload token for this media item. |







<a name="opencannabis.media.MediaSubject"></a>

### Message: <code>MediaSubject</code> (`opencannabis.media.MediaSubject`)

Specifies the subject properties of this media. That is to say, properties of the item of which this media is the
subject. Also referred to as this media item's "parent" in some cases.

```proto
import "opencannabis/media/MediaItem.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.media.MediaSubject field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `product` | [`opencannabis.base.ProductKey`](#opencannabis.base.ProductKey) | *None.* | Specify a product key as the subject parent of this media. |
| `partner` | [`string`](#string) | *None.* | Specify a partner as the subject parent of this media. |
| `location` | [`string`](#string) | *None.* | Specify a partner and location as the subject parent of this media. |
| `brand` | [`string`](#string) | *None.* | Specify a partner brand as the subject parent of this media. |
| `global` | [`bool`](#bool) | *None.* | Specify this media as global. This is a special flag that should only be used internally. |







<a name="opencannabis.media.MediaUpload"></a>

### Message: <code>MediaUpload</code> (`opencannabis.media.MediaUpload`)

Describes a pending upload operation, which may be waiting for data to finish uploading to underlying storage before
the resulting record is attached to its subject owner (partner/location account, product, user, etc).

```proto
import "opencannabis/media/MediaItem.proto";
// ...

// Code sample.
message YourMessage {
    // Example below.
    opencannabis.media.MediaUpload field_name = 1;
}

```


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `token` | [`string`](#string) | *None.* | Unique token identifying this media upload operation. This token is provisioned when the upload operation begins, and is used to track and later attach the resulting data. |
| `operation` | [`string`](#string) | *None.* | Upload operation ID, provided by GCS upon initializing a resume-able upload operation. |
| `media` | [`MediaItem`](#opencannabis.media.MediaItem) | *None.* | Media item provided during this upload operation. |
| `mime` | [`string`](#string) | *None.* | Mime-type for the file uploaded as part of this media operation. This should be known ahead of time. |
| `size` | [`uint64`](#uint64) | *None.* | Size, in bytes, of the item uploaded in this operation. |
| `finished` | [`bool`](#bool) | *None.* | Whether this upload operation has completed or not. |
| `md5` | [`string`](#string) | *None.* | MD5 hash for the data uploaded. Usually filled in afterwards but may be specified before the upload to check integrity of uploaded data. |
| `crc32` | [`string`](#string) | *None.* | CRC32 hash for the data uploaded. Usually filled in afterwards but may be specified before the upload to check integrity of uploaded data. |
| `owner` | [`string`](#string) | *None.* | User account that initiated this upload operation. |
| `path` | [`string`](#string) | *None.* | Path to the underlying file in GCS, without a bucket. |
| `parent` | [`string`](#string) | *None.* | Parent upload, in cases where an upload is performed over an existing item (overwriting it). |
| `created` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Timestamp for when this upload operation was created. |
| `completed` | [`opencannabis.temporal.Instant`](#opencannabis.temporal.Instant) | *None.* | Timestamp for when this upload operation was completed. |






<!-- end messages -->


<a name="opencannabis.media.MediaPrivacy"></a>

### Enumeration: <code>MediaPrivacy</code> (`opencannabis.media.MediaPrivacy`)

Specifies the allowed access scope for an individual media item. By default, uploaded items are accessible to users
at the same partner location as the uploading user. That access can be extended to the entire partner (all locations)
or the media item can be published for public serving.

```proto
import "opencannabis/media/MediaItem.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.media.MediaPrivacy enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `DEFAULT_PRIVACY` | `0` | Default privacy mode. At the time of this writing, this is defined as an access scheme where all users with read permission on the partner location account matching the uploading user are granted access. |
| `PARTNER` | `1` | All accounts in the entire partner organization should be able to see, access, and download this media item. |
| `PUBLIC` | `2` | The subject media item is published globally, and can be accessed by anyone with the link on the open Internet. |



<a name="opencannabis.media.MediaStatus"></a>

### Enumeration: <code>MediaStatus</code> (`opencannabis.media.MediaStatus`)

Specifies the states an individual media item may exist in. This covers the process of uploading/provisioning a media
item, optimizing/compressing/transforming it, and marking it as ready for serving.

```proto
import "opencannabis/media/MediaItem.proto";
// ...

// Code sample.
message YourMessage {
  // Example below.
  opencannabis.media.MediaStatus enum_name = 1;
}

```

| Name | Number | Description |
| ---- | ------ | ----------- |
| `PROVISIONED` | `0` | The media item has been provisioned, but is not yet subject to a resume-able write operation (at which point, the media item would be 'PENDING'). |
| `PENDING` | `1` | The media item is in the process of being uploaded or otherwise processed. It is not ready yet to be served and may not even yet have underlying data written. |
| `UPLOADED` | `2` | Data for the subject media item has been uploaded and written, but the media item has yet to be attached to its subject data in the backing datastore, so it is not ready for serving yet. |
| `READY` | `3` | This media item is ready to be served, and may include an optimized serving URL to be used instead of the raw URL for the item in storage. |


<!-- end enums -->

<!-- end HasExtensions -->

<!-- end services -->



---

Copyright &copy; 2021, OpenCannabis Authors. All rights reserved. Shared and released under
[GNU GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html). For more details regarding licensing, please see the
`LICENSE.txt` file distributed with the OpenCannabis Protocol Sources.
