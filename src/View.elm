module View exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import LandingPage.View
import Nav.Navbar
import Models exposing (Model)


view : Model -> Html msg
view model =
    div [ class "app" ]
        [ Nav.Navbar.navbar
        , LandingPage.View.view
        ]
