module Auth.Update exposing (update)

import Http exposing (Error(BadStatus))
import Json.Decode as Decode
import Auth.Models exposing (Model, initialError, initialCredentials)
import Auth.Messages exposing (Msg(..))
import Auth.Commands exposing (login, register)
import Auth.Decoders.Error exposing (errorDecoder)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateUsername username ->
            let
                credentials =
                    model.credentials

                newCredentials =
                    { credentials | username = username }
            in
                ( { model | credentials = newCredentials }, Cmd.none )

        UpdateEmail email ->
            let
                credentials =
                    model.credentials

                newCredentials =
                    { credentials | email = email }
            in
                ( { model | credentials = newCredentials }, Cmd.none )

        UpdatePassword password ->
            let
                credentials =
                    model.credentials

                newCredentials =
                    { credentials | password = password }
            in
                ( { model | credentials = newCredentials }, Cmd.none )

        UpdatePasswordAgain password ->
            let
                credentials =
                    model.credentials

                newCredentials =
                    { credentials | passwordAgain = password }
            in
                ( { model | credentials = newCredentials }, Cmd.none )

        ToggleLogin ->
            ( { model
                | showingLogin = not model.showingLogin
                , errors = initialError
              }
            , Cmd.none
            )

        Login ->
            ( model, login model.credentials )

        PerformLogin (Ok token) ->
            ( { model
                | token = token
                , errors = initialError
                , isAuthenticated = True
                , credentials = initialCredentials
              }
            , Cmd.none
            )

        PerformLogin (Err error) ->
            handleError model error

        Register ->
            ( model, register model.credentials )

        PerformRegister (Ok user) ->
            ( { model
                | user = user
                , token = user.token
                , credentials = initialCredentials
                , errors = initialError
                , isAuthenticated = True
              }
            , Cmd.none
            )

        PerformRegister (Err error) ->
            handleError model error


handleError : Model -> Error -> ( Model, Cmd Msg )
handleError model error =
    case error of
        BadStatus { body } ->
            ( { model | errors = parseErrors body }, Cmd.none )

        _ ->
            ( { model | errors = parseErrors genericErrorMessage }, Cmd.none )


genericErrorMessage : String
genericErrorMessage =
    """{"message": "An error occurred when attempting to log in." }"""



{- Parse errors from the server or otherwise. Fall back to a genericmessage if parsing fails. -}


parseErrors : String -> Auth.Models.Error
parseErrors body =
    let
        errors =
            Decode.decodeString errorDecoder body
    in
        case errors of
            Ok error ->
                error

            Err error ->
                parseErrors genericErrorMessage
