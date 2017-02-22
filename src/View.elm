module View exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import LandingPage.View
import Homepage.View
import Nav.Navbar
import Models exposing (Model)
import Messages exposing (Msg(AuthMessages))


view : Model -> Html Msg
view model =
    div [ class "app" ]
        [ Nav.Navbar.navbar model
        , div [ class "content" ] [ viewLandingOrHome model ]
        ]


viewLandingOrHome : Model -> Html Msg
viewLandingOrHome model =
    if model.authModel.isAuthenticated then
        Homepage.View.view model
    else
        Html.map AuthMessages (LandingPage.View.view model.authModel)
