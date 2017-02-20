module Models exposing (Model, init)


type alias Model =
    { route : String
    }


init : ( Model, Cmd msg )
init =
    ( Model "", Cmd.none )
