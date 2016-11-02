module Score exposing (Score, gameOver, initial, toString)

import Player exposing (Player)
import Point exposing (Point(Love))


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
