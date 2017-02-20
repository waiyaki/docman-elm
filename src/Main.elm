module Main exposing (..)

import Html exposing (Html, program, div, text)
import Models exposing (Model, init)
import View exposing (view)


main : Program Never Model msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


update : msg -> Model -> ( Model, Cmd msg )
update msg model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none
