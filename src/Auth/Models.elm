module Auth.Models exposing (..)

-- User object to store the logged in user details


type alias User =
    { id : String
    , username : String
    , email : String
    , fullName : Maybe String
    , name : Maybe Name
    , role : Role
    }


initialUser : User
initialUser =
    { id = ""
    , username = ""
    , email = ""
    , fullName = Nothing
    , name = Nothing
    , role = initialRole
    }


type alias Name =
    { firstName : String
    , lastName : String
    }


initialName : Name
initialName =
    { firstName = "", lastName = "" }


type alias Role =
    { id : String
    , accessLevel : Int
    , title : String
    }


initialRole : Role
initialRole =
    { id = "", accessLevel = 0, title = "" }



-- Temporary store for auth credentials.


type alias Credentials =
    { password : String
    , username : String
    , email : String
    , passwordAgain : String
    }


initialCredentials : Credentials
initialCredentials =
    Credentials "" "" "" ""



-- The error object will have (almost) the same shape as the credentials.


type alias Error =
    { username : Maybe String
    , password : Maybe String
    , passwordAgain : Maybe String
    , email : Maybe String
    , message : Maybe String
    }


type alias Model =
    { credentials : Credentials
    , errors : Maybe Error
    , user : User
    , showingLogin : Bool
    , token : Maybe String
    , isAuthenticated : Bool
    }


initialModel : Model
initialModel =
    ({ credentials = initialCredentials
     , errors = Nothing
     , user = initialUser
     , showingLogin = True
     , token = Nothing
     , isAuthenticated = False
     }
    )
