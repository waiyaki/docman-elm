module Homepage.View exposing (view)

import Html exposing (Html, div, text)


view : model -> Html msg
view model =
    div [] [ text "Welcome home." ]
