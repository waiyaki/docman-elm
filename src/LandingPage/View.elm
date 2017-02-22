module LandingPage.View exposing (view)

import Html exposing (Html, div, text, h1, p)
import Html.Attributes exposing (class)
import Auth.View exposing (loginView, registerView)
import Auth.Messages exposing (Msg)
import Auth.Models exposing (Model)


view : Model -> Html Msg
view model =
    div [ class "landing-page" ]
        [ div [ class "row landing-page-content align-items-center justify-content-center" ]
            [ div [ class "col-md-8 hidden-sm-down" ] [ leadContent ]
            , div [ class "col-md-4" ]
                [ if model.showingLogin then
                    loginView model.credentials model.errors
                  else
                    registerView model.credentials model.errors
                ]
            ]
        ]


leadContent : Html msg
leadContent =
    div [ class "lead-content text-center" ]
        [ h1 [] [ text "DocMan" ]
        , p [ class "lead" ] [ text "Share Your Thoughts With The World" ]
        , p [] [ text "With DocMan Document Manager, you can easily share what's on your mind with the world," ]
        , p [] [ text "while maintaining fine-grained control over who has access to the content you share." ]
        , p [] [ text "Give it a whirl by logging in or signing up using the text box to your right!" ]
        ]
