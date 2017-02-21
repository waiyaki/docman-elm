module Auth.Messages exposing (..)


type Msg
    = UpdateUsername String
    | UpdatePassword String
    | UpdatePasswordAgain String
    | UpdateEmail String
    | ToggleLogin
    | Login
    | Register
