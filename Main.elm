module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Time exposing (..)


main : Program Never Model Msg
main =
    program { init = init, view = view, update = update, subscriptions = subscriptions }



-- MODEL


type alias Model =
    { dimension : Int
    , time : Maybe Time
    }


init : ( Model, Cmd Msg )
init =
    ( { dimension = 100
      , time = Nothing
      }
    , Cmd.none
    )



-- MESSAGES


type Msg
    = Tick Time
    | DimensionChange Int



-- VIEW


view : Model -> Html Msg
view model =
    div
        [ style
            [ "background-color" => "black"
            , "width" => toString model.dimension ++ "px"
            , "height" => toString model.dimension ++ "px"
            , "text-align" => "center"
            , "margin-left" => "auto"
            , "margin-right" => "auto"
            , "postion" => "absolute"
            , "margin-top" => "10%"
            , "border" => "0"
            ]
        ]
        []



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DimensionChange dimension ->
            model ! []

        Tick _ ->
            { model | dimension = model.dimension - 3 } ! []


isMultipleOf100 : Float -> Bool
isMultipleOf100 float =
    round float % 100 == 0



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every millisecond Tick


(=>) : a -> b -> ( a, b )
(=>) =
    (,)
infixl 0 =>
