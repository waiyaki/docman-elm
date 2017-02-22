module Auth.Models exposing (..)

-- User object to store the logged in user details


type alias User =
    { id : String
    , username : String
    , email : String
    , fullName : Maybe String
    , name : Maybe Name
    , role : Role
    , token : Token
    }


initialUser : User
initialUser =
    { id = ""
    , username = ""
    , email = ""
    , fullName = Nothing
    , name = Nothing
    , role = initialRole
    , token = Nothing
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


initialError : Error
initialError =
    Error Nothing Nothing Nothing Nothing Nothing


type alias Token =
    Maybe String


type alias Model =
    { credentials : Credentials
    , errors : Error
    , user : User
    , showingLogin : Bool
    , token : Token
    , isAuthenticated : Bool
    }


initialModel : Token -> Model
initialModel token =
    let
        isAuthenticated =
            hasToken token
    in
        ({ credentials = initialCredentials
         , errors = initialError
         , user = initialUser
         , showingLogin = True
         , token = token
         , isAuthenticated = isAuthenticated
         }
        )


hasToken : Token -> Bool
hasToken token =
    case token of
        Just t ->
            True

        Nothing ->
            False
