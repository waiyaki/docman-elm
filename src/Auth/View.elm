module Auth.View exposing (loginView, registerView)

import Html exposing (Html, div, h4, p, text, hr, input, button, span)
import Html.Attributes exposing (class, placeholder, type_, value)
import Html.Events exposing (onInput, onClick)
import Auth.Messages exposing (Msg(..))
import Auth.Models exposing (Credentials, Error)


{- Single Html input field config. -}


type alias FieldConfig =
    { placeholder : String
    , handleInput : String -> Msg
    , value : String
    , error : Maybe String
    , type_ : String
    }



{- We can only have 2 auth views, `login` or `register`, which differ slightly
   based on the data they display.
   This config specifies that data such that the general auth view can be
   abstracted into a general component and configured to required specificity.
-}


type alias AuthViewConfig =
    { heading : String
    , authAction : Msg
    , toggleAuthText : String
    }



-- Data specific to login view


loginViewConfig : AuthViewConfig
loginViewConfig =
    { heading = "Login"
    , authAction = Login
    , toggleAuthText = "Not Registered? Register Here."
    }



-- Data specific to register view


registerViewConfig : AuthViewConfig
registerViewConfig =
    { heading = "Register"
    , authAction = Register
    , toggleAuthText = "Already Registered?"
    }



-- Html Input fields to display in the login view


loginFields : Credentials -> Error -> List FieldConfig
loginFields creds errors =
    [ FieldConfig "Username" UpdateUsername creds.username errors.username "text"
    , FieldConfig "Password" UpdatePassword creds.password errors.password "password"
    ]



-- Html Input fields to display in the register view.


registerFields : Credentials -> Error -> List FieldConfig
registerFields creds errors =
    List.concat
        [ List.intersperse
            (FieldConfig "Email" UpdateEmail creds.email errors.email "email")
            (loginFields creds errors)
        , [ FieldConfig "Confirm Password" UpdatePasswordAgain creds.passwordAgain errors.passwordAgain "password"
          ]
        ]



{- General authentication view component.
   Requires config to customize it to a specific auth component.
-}


authViewComponent : AuthViewConfig -> List FieldConfig -> Error -> Html Msg
authViewComponent componentConfig fieldConfigList error =
    div [ class "card" ]
        [ div [ class "card-block" ]
            [ h4 [ class "card-title text-center" ] [ text componentConfig.heading ]
            , hr [] []
            , p [ class "card-text credentials-input" ]
                (List.append
                    (renderGeneralMessage (getFieldValue error.message)
                        :: (formGroups fieldConfigList)
                    )
                    [ renderButton componentConfig ]
                )
            ]
        , div [ class "card-footer text-center" ]
            [ button [ class "btn btn-link toggle-auth", onClick ToggleLogin ] [ text componentConfig.toggleAuthText ] ]
        ]



-- Customize general auth view component to yield a login component.


loginView : Credentials -> Error -> Html Msg
loginView creds error =
    authViewComponent loginViewConfig (loginFields creds error) error



-- Customize general auth view component to yield a register component.


registerView : Credentials -> Error -> Html Msg
registerView creds error =
    authViewComponent registerViewConfig (registerFields creds error) error



-- Render a `Login` or `Register` button, depending on specified config.


renderButton : AuthViewConfig -> Html Msg
renderButton { authAction, heading } =
    div [ class "text-center" ]
        [ button
            [ type_ "button"
            , class "btn btn-outline-primary"
            , onClick authAction
            ]
            [ text heading ]
        ]


formGroups : List FieldConfig -> List (Html Msg)
formGroups fields =
    List.map renderFormGroup fields



-- A single Bootstrap form group. Customize it as per the field config.


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



-- Show error if the rendered field has an error.


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
