module Auth.View exposing (login, register)

import Html exposing (Html, div, h4, p, text, hr, input, button, span)
import Html.Attributes exposing (class, placeholder, type_, value)
import Html.Events exposing (onInput, onClick)
import Auth.Messages exposing (Msg(..))
import Auth.Models exposing (Credentials)


login : Credentials -> Html Msg
login credentials =
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
                        , value credentials.username
                        ]
                        []
                    ]
                , div [ class "form-group" ]
                    [ input
                        [ placeholder "Password"
                        , class "form-control"
                        , type_ "password"
                        , onInput UpdatePassword
                        , value credentials.password
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


register : Credentials -> Html Msg
register credentials =
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
                        , value credentials.username
                        ]
                        []
                    ]
                , div [ class "form-group" ]
                    [ input
                        [ placeholder "Email"
                        , class "form-control"
                        , type_ "email"
                        , onInput UpdateEmail
                        , value credentials.email
                        ]
                        []
                    ]
                , div [ class "form-group" ]
                    [ input
                        [ placeholder "Password"
                        , class "form-control"
                        , type_ "password"
                        , onInput UpdatePassword
                        , value credentials.password
                        ]
                        []
                    ]
                , div [ class "form-group" ]
                    [ input
                        [ placeholder "Confirm Password"
                        , class "form-control"
                        , type_ "password"
                        , onInput UpdatePasswordAgain
                        , value credentials.passwordAgain
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
