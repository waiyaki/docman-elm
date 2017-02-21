module Auth.Decoders.Error exposing (..)

import Json.Decode as Decode exposing (succeed, maybe)
import Json.Decode.Extra exposing ((|:))
import Auth.Decoders.Common exposing (stringDecoder)
import Auth.Models exposing (Error)


errorDecoder : Decode.Decoder Error
errorDecoder =
    succeed Error
        |: maybe (stringDecoder "username")
        |: maybe (stringDecoder "password")
        |: maybe (stringDecoder "email")
        |: maybe (stringDecoder "passwordAgain")
        |: maybe (stringDecoder "message")
