module Main exposing (..)

import Html exposing (Html, programWithFlags, div, text)
import Models exposing (Model, init, Flags)
import View exposing (view)
import Messages exposing (Msg)
import Update exposing (update)


main : Program Flags Model Msg
main =
    programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none
