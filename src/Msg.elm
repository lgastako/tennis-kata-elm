module Msg exposing (Msg(..))

import Player exposing (Player)


type Msg
    = NewGame
    | Score Player
