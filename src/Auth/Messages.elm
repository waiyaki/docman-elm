module Auth.Messages exposing (..)

import Http
import Auth.Models exposing (User)


type Msg
    = UpdateUsername String
    | UpdatePassword String
    | UpdatePasswordAgain String
    | UpdateEmail String
    | ToggleLogin
    | Login
    | PerformLogin (Result Http.Error String)
    | Register
    | PerformRegister (Result Http.Error ( User, String ))
