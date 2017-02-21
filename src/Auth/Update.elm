module Auth.Update exposing (update)

import Auth.Models exposing (Model)
import Auth.Messages exposing (Msg(..))


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
            ( model, Cmd.none )

        Register ->
            ( model, Cmd.none )
