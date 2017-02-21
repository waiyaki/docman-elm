module Main exposing (..)

import Html exposing (Html, program, div, text)
import Models exposing (Model, init)
import View exposing (view)
import Messages exposing (Msg)
import Update exposing (update)


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none
