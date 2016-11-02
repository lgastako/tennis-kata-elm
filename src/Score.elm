module Score exposing (Score, gameOver, initial, point, toString)

import Player exposing (Player(Player1, Player2))
import Point exposing (Point(Love, Fifteen, Thirty))


type Score
    = Points PointsData
    | Forty FortyData
    | Deuce
    | Advantage Player
    | Game Player


type alias PointsData =
    { p1Point : Point
    , p2Point : Point
    }


type alias FortyData =
    { player : Player
    , otherPlayerPoint : Point
    }


initial : Score
initial =
    Points { p1Point = Love, p2Point = Love }


toString : Score -> String
toString score =
    case score of
        Points { p1Point, p2Point } ->
            Point.toString p1Point ++ "-" ++ Point.toString p2Point

        Forty { player, otherPlayerPoint } ->
            Player.toString player ++ " 40-" ++ Point.toString otherPlayerPoint

        Deuce ->
            "Deuce"

        Advantage player ->
            "Advantage " ++ Player.toString player

        Game player ->
            "Game " ++ Player.toString player


gameOver : Score -> Bool
gameOver score =
    case score of
        Game _ ->
            True

        _ ->
            False


point : Player -> Score -> Score
point scoringPlayer score =
    case score of
        Points { p1Point, p2Point } ->
            case scoringPlayer of
                Player1 ->
                    case p1Point of
                        Love ->
                            Points { p1Point = Fifteen, p2Point = p2Point }

                        Fifteen ->
                            Points { p1Point = Thirty, p2Point = p2Point }

                        Thirty ->
                            Forty { player = scoringPlayer, otherPlayerPoint = p2Point }

                Player2 ->
                    case p2Point of
                        Love ->
                            Points { p1Point = p1Point, p2Point = Fifteen }

                        Fifteen ->
                            Points { p1Point = p1Point, p2Point = Thirty }

                        Thirty ->
                            Forty { player = scoringPlayer, otherPlayerPoint = p1Point }

        Forty { player, otherPlayerPoint } ->
            if scoringPlayer == player then
                Game scoringPlayer
            else
                case otherPlayerPoint of
                    Love ->
                        Forty { player = player, otherPlayerPoint = Fifteen }

                    Fifteen ->
                        Forty { player = player, otherPlayerPoint = Thirty }

                    Thirty ->
                        Deuce

        Deuce ->
            Advantage scoringPlayer

        Advantage advantagePlayer ->
            if scoringPlayer == advantagePlayer then
                Game scoringPlayer
            else
                Deuce

        Game gamePlayer ->
            Game gamePlayer
