port module Auth.Ports exposing (..)

import Auth.Models exposing (Token)


port setToken : Token -> Cmd msg


port removeToken : Token -> Cmd msg
