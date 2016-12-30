module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)


{-- MODEL --}

model =
  {number = 0}

--}

{-- UPDATE --}

type Msg =
  IncreaseByOne
  | IncreaseByTen
  | DecreaseByOne
  | DecreaseByTen
  | Reset

update msg model =
  case msg of
    IncreaseByOne ->
      { model | number = model.number + 1 }
    IncreaseByTen ->
      { model | number = model.number + 10 }
    DecreaseByOne ->
      { model | number = model.number - 1 }
    DecreaseByTen ->
      { model | number = model.number - 10 }
    Reset ->
      { model | number = 0 }

--}

{-- VIEW --}

view model =
  div [ style
          [ ("margin", "0 auto" )
          , ( "width", "400px")
          , ( "border", "1px solid black")
          ]
      ]
    [ div [ style
            [ ("text-align", "center")
            ]
          ]
      [ text <| toString model.number ]
    , div []
        [
        button [ onClick IncreaseByOne ] [text <| "+1"]
      , button [ onClick IncreaseByTen ] [text <| "+10"]
      ]
    , div [] [
        button [ onClick DecreaseByOne ] [ text <| "-1"],
        button [ onClick DecreaseByTen ] [ text <| "-10"]
      ]
    , div [] [
        button [ onClick Reset ] [ text <| "Reset Value"]
      ]
    ]

{--}

main =
  beginnerProgram
    { model = model
    , update = update
    , view = view}
