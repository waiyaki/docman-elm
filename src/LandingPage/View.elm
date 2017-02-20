module LandingPage.View exposing (view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)


view : Html msg
view =
    div [ class "landing-page" ]
        [ div [ class "row" ]
            [ div [ class "col-md-8" ] [ text "Hello there!!" ]
            , div [ class "col-md-4" ] [ text "Hey" ]
            ]
        ]
