module Messages exposing (..)

import Auth.Messages


type Msg
    = AuthMessages Auth.Messages.Msg
