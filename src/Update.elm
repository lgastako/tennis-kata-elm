module Update exposing (update)

import Model exposing (Model)
import Msg exposing (Msg(..))
import Score


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewGame ->
            Model.empty ! []

        Score player ->
            { model | score = Score.point player model.score } ! []
