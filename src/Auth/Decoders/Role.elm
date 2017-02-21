module Auth.Decoders.Role exposing (..)

import Json.Decode as Decode exposing (succeed)
import Json.Decode.Extra exposing ((|:))
import Auth.Models exposing (Role)
import Auth.Decoders.Common exposing (stringDecoder, intDecoder, decoderFirstField)


decodeRole : Decode.Decoder Role
decodeRole =
    succeed Role
        |: stringDecoder "_id"
        |: intDecoder "accessLevel"
        |: stringDecoder "title"


roleDecoder : String -> Decode.Decoder Role
roleDecoder =
    decoderFirstField decodeRole
