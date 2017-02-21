module Decoders.User exposing (..)

import Json.Decode as Decode exposing (string, int, field, succeed, maybe, andThen)
import Json.Decode.Extra exposing ((|:))
import Decoders.Common exposing (stringDecoder, intDecoder, decoderFirstField)
import Decoders.Role exposing (roleDecoder)
import Auth.Models exposing (User, Name, Role)


decodeName : Decode.Decoder Name
decodeName =
    succeed Name
        |: stringDecoder "firstName"
        |: stringDecoder "lastName"


nameDecoder : String -> Decode.Decoder Name
nameDecoder =
    decoderFirstField decodeName


userDecoder : Decode.Decoder User
userDecoder =
    succeed User
        |: stringDecoder "_id"
        |: stringDecoder "username"
        |: stringDecoder "email"
        |: maybe (stringDecoder "fullName")
        |: nameDecoder "name"
        |: roleDecoder "role"
