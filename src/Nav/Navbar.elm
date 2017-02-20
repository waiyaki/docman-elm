module Nav.Navbar exposing (navbar)

import Html exposing (Html, div, text, nav, a)
import Html.Attributes exposing (class, href)


navbar : Html msg
navbar =
    nav [ class "navbar fixed-top navbar-inverse bg-inverse" ]
        [ a [ class "navbar-brand", href "#" ] [ text "DocMan" ]
        ]
