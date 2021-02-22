# Type mapping rules

## Message Type

```proto
message Book {
  string title = 1;
  uint64 author_id = 2;
  repeated uint64 liker_ids = 3;
}
```

```graphql
type Book {
  title: String!
  authorId: String!
  likerIds: [Int!]!
}
```

### Field behaviors

```proto
message Book {
  // Required. Output only.
  uint32 like_count = 101;
  // Optional. Input only.
  string token = 102;
}
```

```graphql
type Book {
  likeCount: Int!
}

input BookInput {
  token: String
}
```

### Oneofs

```proto
message MediaFile {
  string name = 1;
  oneof type {
    MediaImage image = 3;
    MediaVideo video = 4;
    MediaAudio audio = 5;
  }
}
```

```graphql
type MediaFile {
  name: String!
  mediaType: MediaFileType 
}

union MediaFileType = MediaImage | MediaVideo | MediaAudio
```

### Wrap oneof members

TODO

### Squashed Union

```proto
messsage Entry {
  option (graphql.object_type).squashed_union = true;
  oneof content {
    Text text = 1;
    Image image = 2;
    Video video = 3;
  }
}
```

```graphql
union Entry = Text | Image | Video
```

### Interfaces

TODO

## Scalar Types

### Type Mapping

Same as [proto3's JSON Mapping](https://developers.google.com/protocol-buffers/docs/proto3#json) 

- 64-bit integers are `String`
- floating point types are `Float`
- other integer types are `Int`
- `bytes` : TBD

### Wrapper types

- nullable by default
- Other than that, it is the same as Protobuf Scalar Value Types.

### Other well-known types

- google.protobuf.Timestamp
    - `DateTime` custom scalar
    - ISO8601 `2020-12-28T06:42:05.453Z` format
- google.protobuf.Duration
    - TBD
- google.type.Date
    - TBD

## Enum

When zero value is named `<TYPE_NAME>_UNSPECIFIED`, it's skipped in the generated GraphQL schema.

```proto
enum Role {
  ROLE_UNSPECIFIED = 0;
  BASIC = 1;
  DEVELOPER = 2;
}
```

```graphql
enum Role {
  BASSIC
  DEVELOPER
}
```
