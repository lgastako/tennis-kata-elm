module View exposing (view)

import Html exposing (Html, button, div, h1, table, td, text, th, tr)
import Html.Events exposing (onClick)
import Model exposing (Model)
import Msg exposing (Msg(NewGame, Score))
import Player exposing (Player(Player1, Player2))
import Score


view : Model -> Html Msg
view model =
    let
        scoreButtons =
            if Score.gameOver model.score then
                []
            else
                [ button [ onClick (Score Player1) ] [ text "Player 1 Score" ]
                , button [ onClick (Score Player2) ] [ text "Player 2 Score" ]
                ]

        buttons =
            scoreButtons ++ [ button [ onClick NewGame ] [ text "New Game" ] ]
    in
        div []
            [ h1 [] [ text "Tennis Kata" ]
            , table []
                [ tr [] [ th [] [ text "Score" ] ]
                , tr [] [ td [] [ text <| Score.toString model.score ] ]
                ]
            , div [] buttons
            ]
