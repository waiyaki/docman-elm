module Nav.Navbar exposing (navbar)

import Html exposing (Html, div, text, nav, a, button, span)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import Messages exposing (Msg(Logout))
import Models exposing (Model)


navbar : Model -> Html Msg
navbar model =
    nav [ class "navbar fixed-top navbar-inverse bg-inverse" ]
        [ div []
            [ a [ class "navbar-brand", href "#" ] [ text "DocMan" ]
            , renderLogoutButton model
            ]
        ]


renderLogoutButton : Model -> Html Msg
renderLogoutButton model =
    if model.authModel.isAuthenticated then
        button
            [ class "btn btn-outline-primary pull-right"
            , onClick Logout
            ]
            [ text "Logout" ]
    else
        span [] []
