module Models exposing (Model, init, initialModel)

import Messages exposing (Msg)
import Auth.Models


type alias Model =
    { route : String
    , authModel : Auth.Models.Model
    }


initialModel : Model
initialModel =
    { route = ""
    , authModel = Auth.Models.initialModel
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )
