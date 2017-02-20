module View exposing (view)

import Html exposing (Html)
import LandingPage.View
import Models exposing (Model)


view : Model -> Html msg
view model =
    LandingPage.View.view
