module Auth.View exposing (login, register)

import Html exposing (Html, div, h4, p, text, hr, input, button, span)
import Html.Attributes exposing (class, placeholder, type_)
import Html.Events exposing (onInput, onClick)
import Auth.Messages exposing (Msg(..))


login : Html Msg
login =
    div [ class "card" ]
        [ div [ class "card-block" ]
            [ h4 [ class "card-title text-center" ] [ text "Login" ]
            , hr [] []
            , p [ class "card-text credentials-input" ]
                [ div [ class "form-group" ]
                    [ input
                        [ placeholder "Username"
                        , class "form-control"
                        , onInput UpdateUsername
                        ]
                        []
                    ]
                , div [ class "form-group" ]
                    [ input
                        [ placeholder "Password"
                        , class "form-control"
                        , type_ "password"
                        , onInput UpdatePassword
                        ]
                        []
                    ]
                , div [ class "text-center" ]
                    [ button
                        [ type_ "button"
                        , class "btn btn-outline-primary"
                        , onClick Login
                        ]
                        [ text "Login" ]
                    ]
                ]
            ]
        , div [ class "card-footer text-center" ]
            [ button [ class "btn btn-link toggle-auth", onClick ToggleLogin ] [ text "Not Registered? Register Here." ] ]
        ]


register : Html Msg
register =
    div [ class "card" ]
        [ div [ class "card-block" ]
            [ h4 [ class "card-title text-center" ] [ text "Register" ]
            , hr [] []
            , p [ class "card-text credentials-input" ]
                [ div [ class "form-group" ]
                    [ input
                        [ placeholder "Username"
                        , class "form-control"
                        , onInput UpdateUsername
                        ]
                        []
                    ]
                , div [ class "form-group" ]
                    [ input
                        [ placeholder "Email"
                        , class "form-control"
                        , type_ "email"
                        , onInput UpdateEmail
                        ]
                        []
                    ]
                , div [ class "form-group" ]
                    [ input
                        [ placeholder "Password"
                        , class "form-control"
                        , type_ "password"
                        , onInput UpdatePassword
                        ]
                        []
                    ]
                , div [ class "form-group" ]
                    [ input
                        [ placeholder "Confirm Password"
                        , class "form-control"
                        , type_ "password"
                        , onInput UpdatePasswordAgain
                        ]
                        []
                    ]
                , div [ class "text-center" ]
                    [ button
                        [ type_ "button"
                        , class "btn btn-outline-primary"
                        , onClick Register
                        ]
                        [ text "Register" ]
                    ]
                ]
            ]
        , div [ class "card-footer text-center" ]
            [ button [ class "btn btn-link toggle-auth", onClick ToggleLogin ] [ text "Already Registered?" ] ]
        ]
