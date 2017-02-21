module Auth.Decoders.Token exposing (tokenDecoder)

import Json.Decode as Decode
import Auth.Decoders.Common exposing (stringDecoder)


tokenDecoder : Decode.Decoder String
tokenDecoder =
    stringDecoder "token"
