module Point exposing (Point(Love, Fifteen, Thirty), toString)


type Point
    = Love
    | Fifteen
    | Thirty


toString : Point -> String
toString =
    Basics.toString
