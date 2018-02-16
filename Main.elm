module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Time exposing (..)


main : Program Never Model Msg
main =
    program { init = init, view = view, update = update, subscriptions = subscriptions }



-- MODEL


type alias Model =
    { dimension : Float
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
    | DimensionChange Float



-- VIEW


view : Model -> Html Msg
view model =
    div [ style [ "postion" => "relative" ] ]
        [ div
            [ style
                [ "background-color" => "black"
                , "width" => toString model.dimension ++ "px"
                , "height" => toString model.dimension ++ "px"
                , "text-align" => "center"
                , "position" => "absolute"
                , "top" => "50%"
                , "margin-left" => "50%"
                , "border" => "0"
                ]
            ]
            []
        ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DimensionChange dimension ->
            model ! []

        Tick time ->
            if time |> inMilliseconds |> isMultipleOf100 then
                { model | dimension = model.dimension - 0.5 } ! []
            else
                model ! []


isMultipleOf100 : Float -> Bool
isMultipleOf100 float =
    round float % 10 == 0



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every millisecond Tick


(=>) : a -> b -> ( a, b )
(=>) =
    (,)
infixl 0 =>
