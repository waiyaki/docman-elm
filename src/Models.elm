module Models exposing (..)

import Messages exposing (Msg)
import Auth.Models


type alias Model =
    { route : String
    , authModel : Auth.Models.Model
    }


type alias Flags =
    { token : Auth.Models.Token
    }


emptyFlags : Flags
emptyFlags =
    { token = Nothing }


initialModel : Flags -> Model
initialModel flags =
    { route = ""
    , authModel = Auth.Models.initialModel flags.token
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( initialModel flags, Cmd.none )
