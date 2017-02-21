module Decoders.Common exposing (..)

import Json.Decode as Decode exposing (string, int, field)


{- Flip `field` such that it can accept the decoder before the string name
   of the field being decoded.
-}


decoderFirstField : Decode.Decoder a -> String -> Decode.Decoder a
decoderFirstField =
    flip field



{- Utilities for creating decoders and reduce duplication.
   Instead of having to write `(field "id" string)`, we can use these
   utilities and write decoders like `(stringDecoder "id")`
-}


stringDecoder : String -> Decode.Decoder String
stringDecoder =
    decoderFirstField string


intDecoder : String -> Decode.Decoder Int
intDecoder =
    decoderFirstField int
