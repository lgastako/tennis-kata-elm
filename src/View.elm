module View exposing (view)

import Html exposing (div, h1, table, td, text, th, tr)
import Model exposing (Model)
import Msg exposing (Msg)
import Score


view : Model -> Html.Html Msg
view model =
    div []
        [ h1 [] [ text "Tennis Kata" ]
        , table []
            [ tr [] [ th [] [ text "Score" ] ]
            , tr [] [ td [] [ text <| Score.toString model.score ] ]
            ]
        ]
