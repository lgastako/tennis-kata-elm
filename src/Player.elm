module Player exposing (Player(Player1, Player2), toString)


type Player
    = Player1
    | Player2


toString : Player -> String
toString player =
    case player of
        Player1 ->
            "Player 1"

        Player2 ->
            "Player 2"
