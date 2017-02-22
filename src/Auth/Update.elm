module Auth.Update exposing (update)

import Http exposing (Error(BadStatus))
import Json.Decode as Decode
import Auth.Models exposing (Model, initialError)
import Auth.Messages exposing (Msg(..))
import Auth.Commands exposing (login)
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
            ( { model | showingLogin = not model.showingLogin }, Cmd.none )

        Login ->
            ( model, login model.credentials )

        PerformLogin (Ok token) ->
            ( { model
                | token = (Just token)
                , errors = initialError
              }
            , Cmd.none
            )

        PerformLogin (Err error) ->
            case error of
                BadStatus { body } ->
                    let
                        errors =
                            parseErrors body
                    in
                        ( { model | errors = errors }, Cmd.none )

                _ ->
                    ( { model
                        | errors = parseErrors genericErrorMessage
                      }
                    , Cmd.none
                    )

        Register ->
            ( model, Cmd.none )

        _ ->
            ( model, Cmd.none )


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
