module Model exposing (Model, empty, init)

import Score exposing (Score)


type alias Model =
    { score : Score }


empty : Model
empty =
    { score = Score.initial }


init : ( Model, Cmd msg )
init =
    (empty ! [])
