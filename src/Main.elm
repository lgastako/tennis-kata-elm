module Main exposing (main)

import Html.App exposing (program)
import Model exposing (Model)
import Update
import View


main : Program Never
main =
    program
        { init = Model.init
        , subscriptions = always Sub.none
        , update = Update.update
        , view = View.view
        }
