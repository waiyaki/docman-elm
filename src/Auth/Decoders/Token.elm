module Auth.Decoders.Token exposing (tokenDecoder)

import Json.Decode as Decode
import Auth.Models exposing (Token)
import Auth.Decoders.Common exposing (stringDecoder)


tokenDecoder : Decode.Decoder Token
tokenDecoder =
    Decode.maybe (stringDecoder "token")
