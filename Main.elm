module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
-- import String


{-- MODEL --}

type alias Model =
  { number : Int
  , content : String
  , name : String
  , password : String
  , passwordAgain : String
  }

model : Model

model =
  { number = 0
  , content = ""
  , name = ""
  , password = ""
  , passwordAgain = ""
  }

--}

{-- UPDATE --}

type Msg =
  IncreaseByOne
  | IncreaseByTen
  | DecreaseByOne
  | DecreaseByTen
  | Reset
  | Change String

update : Msg -> Model -> Model
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
    Change newContent ->
      { model | content = newContent}
--}

{-- VIEW --}
view : Model -> Html Msg
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
      , div [] [
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
    , div [ style
            [ ("text-align", "center")
            , ("border", "1px solid green")
            , ("width", "200px")
            , ("margin", "0 auto")
            ]
          ] [
            input [ placeholder "Text to reverse here", onInput Change] []
            , div [] [ text <| (String.reverse model.content)]
          ]
    ]

--}

main =
  beginnerProgram
    { model = model
    , update = update
    , view = view}
