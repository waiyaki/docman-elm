module Auth.Messages exposing (..)

import Http
import Auth.Models exposing (User, Token)


type Msg
    = UpdateUsername String
    | UpdatePassword String
    | UpdatePasswordAgain String
    | UpdateEmail String
    | ToggleLogin
    | Login
    | PerformLogin (Result Http.Error Token)
    | Register
    | PerformRegister (Result Http.Error User)
