module Update exposing (update)

import Models exposing (Model, initialModel, emptyFlags)
import Messages exposing (Msg(..))
import Auth.Update
import Auth.Ports as AuthPorts


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AuthMessages subMsg ->
            let
                ( authModel, cmd ) =
                    Auth.Update.update subMsg model.authModel
            in
                ( { model | authModel = authModel }, Cmd.map AuthMessages cmd )

        Logout ->
            ( initialModel emptyFlags, AuthPorts.removeToken Nothing )
