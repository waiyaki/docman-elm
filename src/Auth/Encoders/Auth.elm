module Auth.Encoders.Auth exposing (..)

import Json.Encode as Encode
import Auth.Models exposing (Credentials)


loginCredentialsEncoder : Credentials -> Encode.Value
loginCredentialsEncoder { password, username } =
    Encode.object <|
        [ ( "password", Encode.string password )
        , ( "username", Encode.string username )
        ]


registerCredentialsEncoder : Credentials -> Encode.Value
registerCredentialsEncoder { password, passwordAgain, username, email } =
    Encode.object <|
        [ ( "passwordAgain", Encode.string passwordAgain )
        , ( "email", Encode.string email )
        , ( "password", Encode.string password )
        , ( "username", Encode.string username )
        ]
