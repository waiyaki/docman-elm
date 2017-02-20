module LandingPage.View exposing (view)

import Html exposing (Html, div, text, h1, p)
import Html.Attributes exposing (class)


view : Html msg
view =
    div [ class "landing-page" ]
        [ div [ class "row landing-page-content align-items-center justify-content-center text-center" ]
            [ div [ class "col-md-8 hidden-sm-down" ] [ leadContent ]
            , div [ class "col-md-4" ] [ text "Hey! The auth module goes here" ]
            ]
        ]


leadContent : Html msg
leadContent =
    div [ class "lead-content" ]
        [ h1 [] [ text "DocMan" ]
        , p [ class "lead" ] [ text "Share Your Thoughts With The World" ]
        , p [] [ text "With DocMan Document Manager, you can easily share what's on your mind with the world," ]
        , p [] [ text "while maintaining fine-grained control over who has access to the content you share." ]
        , p [] [ text "Give it a whirl by logging in or signing up using the text box to your right!" ]
        ]
