module View exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import LandingPage.View
import Nav.Navbar
import Models exposing (Model)
import Messages exposing (Msg(AuthMessages))


view : Model -> Html Msg
view model =
    div [ class "app" ]
        [ Nav.Navbar.navbar
        , Html.map AuthMessages (LandingPage.View.view model.authModel)
        ]
