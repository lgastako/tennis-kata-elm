module Player exposing (Player(Player1, Player2), toString)

import Regex exposing (HowMany(All), regex)


type Player
    = Player1
    | Player2


toString : Player -> String
toString player =
    player
        |> Basics.toString
        |> Regex.replace All (regex "\\d+") (\{ match } -> " " ++ match)
