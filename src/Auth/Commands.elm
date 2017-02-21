module Auth.Commands exposing (..)

import Http
import Config exposing (apiUrl)
import Auth.Encoders.Auth exposing (loginCredentialsEncoder)
import Auth.Decoders.Token exposing (tokenDecoder)
import Auth.Models exposing (Credentials)
import Auth.Messages exposing (Msg(..))


usersUrl : String
usersUrl =
    apiUrl ++ "/users"


loginUrl : String
loginUrl =
    usersUrl ++ "/login"


loginRequest : Credentials -> Http.Request String
loginRequest credentials =
    Http.post loginUrl (loginCredentialsEncoder credentials |> Http.jsonBody) tokenDecoder


login : Credentials -> Cmd Msg
login credentials =
    loginRequest credentials |> Http.send PerformLogin
