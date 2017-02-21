module Auth.Models exposing (Model, initialModel)


type alias Credentials =
    { password : String
    , username : String
    , email : String
    , passwordAgain : String
    }


initialCredentials : Credentials
initialCredentials =
    Credentials "" "" "" ""



-- The error object will have same shape as the credentials.


type alias Errors =
    Credentials


type alias Model =
    { credentials : Credentials
    , errors : Maybe Errors
    , showingLogin : Bool
    }


initialModel : Model
initialModel =
    ({ credentials = initialCredentials, errors = Nothing, showingLogin = True })
