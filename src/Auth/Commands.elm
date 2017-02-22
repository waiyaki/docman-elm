module Auth.Commands exposing (..)

import Http
import Config exposing (apiUrl)
import Auth.Encoders.Auth exposing (loginCredentialsEncoder, registerCredentialsEncoder)
import Auth.Decoders.Token exposing (tokenDecoder)
import Auth.Decoders.User exposing (userDecoder)
import Auth.Models exposing (Credentials, User, Token)
import Auth.Messages exposing (Msg(..))


usersUrl : String
usersUrl =
    apiUrl ++ "/users"


loginUrl : String
loginUrl =
    usersUrl ++ "/login"


loginRequest : Credentials -> Http.Request Token
loginRequest credentials =
    Http.post loginUrl (loginCredentialsEncoder credentials |> Http.jsonBody) tokenDecoder


login : Credentials -> Cmd Msg
login credentials =
    loginRequest credentials |> Http.send PerformLogin


registerRequest : Credentials -> Http.Request User
registerRequest credentials =
    Http.post usersUrl (registerCredentialsEncoder credentials |> Http.jsonBody) userDecoder


register : Credentials -> Cmd Msg
register credentials =
    registerRequest credentials |> Http.send PerformRegister
