module Auth.View exposing (login, register)

import Html exposing (Html, div, h4, p, text, hr, input, button, span)
import Html.Attributes exposing (class, placeholder, type_, value)
import Html.Events exposing (onInput, onClick)
import Auth.Messages exposing (Msg(..))
import Auth.Models exposing (Credentials, Error)


type alias FieldConfig =
    { placeholder : String
    , handleInput : String -> Msg
    , value : String
    , error : Maybe String
    , type_ : String
    }


loginFields : Credentials -> Error -> List FieldConfig
loginFields creds errors =
    [ FieldConfig "Username" UpdateUsername creds.username errors.username "text"
    , FieldConfig "Password" UpdatePassword creds.password errors.password "password"
    ]


registerFields : Credentials -> Error -> List FieldConfig
registerFields creds errors =
    List.concat
        [ List.intersperse
            (FieldConfig "Email" UpdateEmail creds.email errors.email "email")
            (loginFields creds errors)
        , [ FieldConfig "Confirm Password" UpdatePasswordAgain creds.passwordAgain errors.passwordAgain "password"
          ]
        ]


login : Credentials -> Error -> Html Msg
login credentials errors =
    div [ class "card" ]
        [ div [ class "card-block" ]
            [ h4 [ class "card-title text-center" ] [ text "Login" ]
            , hr [] []
            , p [ class "card-text credentials-input" ]
                (List.append
                    (renderGeneralMessage (getFieldValue errors.message)
                        :: (formGroups (loginFields credentials errors))
                    )
                    [ renderButton "Login" Login ]
                )
            ]
        , div [ class "card-footer text-center" ]
            [ button [ class "btn btn-link toggle-auth", onClick ToggleLogin ] [ text "Not Registered? Register Here." ] ]
        ]


register : Credentials -> Error -> Html Msg
register credentials errors =
    div [ class "card" ]
        [ div [ class "card-block" ]
            [ h4 [ class "card-title text-center" ] [ text "Register" ]
            , hr [] []
            , p [ class "card-text credentials-input" ]
                (List.append
                    (renderGeneralMessage (getFieldValue errors.message)
                        :: (formGroups (registerFields credentials errors))
                    )
                    [ renderButton "Register" Register ]
                )
            ]
        , div [ class "card-footer text-center" ]
            [ button [ class "btn btn-link toggle-auth", onClick ToggleLogin ] [ text "Already Registered?" ] ]
        ]


renderButton : String -> Msg -> Html Msg
renderButton action handleClick =
    div [ class "text-center" ]
        [ button
            [ type_ "button"
            , class "btn btn-outline-primary"
            , onClick handleClick
            ]
            [ text action ]
        ]


formGroups : List FieldConfig -> List (Html Msg)
formGroups fields =
    List.map renderFormGroup fields


renderFormGroup : FieldConfig -> Html Msg
renderFormGroup fieldConfig =
    let
        error =
            getFieldValue fieldConfig.error

        ( formGroupClasses, inputClasses ) =
            getClasses error
    in
        div [ class formGroupClasses ]
            [ input
                [ placeholder fieldConfig.placeholder
                , class inputClasses
                , onInput fieldConfig.handleInput
                , value fieldConfig.value
                , type_ fieldConfig.type_
                ]
                []
            , getFormFeedback error
            ]


getClasses : String -> ( String, String )
getClasses error =
    if error == "" then
        ( "form-group", "form-control" )
    else
        ( "form-group has-danger", "form-control form-control-danger" )


getFormFeedback : String -> Html msg
getFormFeedback error =
    if error /= "" then
        div [ class "form-control-feedback" ] [ text error ]
    else
        span [] []


getFieldValue : Maybe String -> String
getFieldValue fieldValue =
    case fieldValue of
        Just field ->
            field

        Nothing ->
            ""


renderGeneralMessage : String -> Html msg
renderGeneralMessage error =
    if error == "" then
        span [] []
    else
        span [ class "has-danger" ]
            [ span [ class "form-control-feedback" ] [ text error ] ]
