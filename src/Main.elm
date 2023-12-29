module Main exposing (..)

import Html exposing (Html, a, b, div, h1, h2, img, text, br, video)
import Html.Attributes exposing (alt, class, href, id, src, style, autoplay, controls, loop, property)
import Json.Encode exposing (..)

import Icons exposing (..)

type alias Image =
    { path : String
    , alt : String
    }


main =
    div [ class "app" ]
        [ div [ class "home" ]
            [ hero
            , promo
            , events
            ]
        , footer
        ]


hero =
    div [ class "hero" ]
        [ div [ class "center-text" ]
            [ header
            , info
            ]
        , img [ class "illustration", src "assets/svgs/RhythmBG.svg" ] []
        ]


header =
    div [ class "header" ]
        [ a [ class "back", href "https://www.mbits.edu.in/" ]
            [ iconBack
            , text "Back to MBITS Homepage"
            ]
        , div [ class "title" ] [ img [ src "assets/svgs/RhythmLogo.svg" ] [] ]
        ]


info =
    div [ class "bottom" ]
        [ div [ class "info" ]
              [ h1 [] [ text "Let it"
                      , br [] []
                      , text "Hit 'em"
                      ]
              , div [ class "info-date" ]
                  [ div [] [ text "Feel the rhythm of MBITS." ]
                  , h1 [] [ text "APR 25, 26" ]
                  , a [ class "bottom-text ticket-button"
                      , href "https://forms.gle/SKDrtRhcjain8NfUA"
                      ]
                      [ text "Buy Tickets"
                      , barcodeIllust
                      ]
                  ]
              ]
            , div [ class "bottom-text" ]
                [ iconChevronDown
                , text "Browse events"
                ]              
        ]


type ButtonType
    = Register


linkButton : ButtonType -> String -> String -> Html msg
linkButton typ link innerText =
    case typ of
        Register ->
            a [ class "button register", href link ]
                [ iconRegister
                , text innerText
                ]

promo =
    div [ class "promo" ]
        [ img [ src "assets/svgs/RhythmLogo.svg"
              , style "opacity" "0"
              ] []
        ]

events =
    div [ class "events" ]
        [ div [ class "marquee" ] [ h1 [] [text "Pro Shows"]
                                  , h1 [] [text "Pro Shows"]
                                  , h1 [] [text "Pro Shows"]
                                  , h1 [] [text "Pro Shows"]
                                  , h1 [] [text "Pro Shows"]
                                  ]
        , proShow RightAligned "SAN-CHA-RI" "Pro Concert" "Tue" "25 Apr" "7" "pm" "sanchari.mp4"
        , proShow LeftAligned "ARJUNADO" "Feat. RIKAYA" "Wed" "26 Apr" "7" "pm" "arjunado.mp4"
        , div [ class "marquee" ] [ h1 [] [text "Featured Events"]
                                  , h1 [] [text "Featured Events"]
                                  , h1 [] [text "Featured Events"]
                                  , h1 [] [text "Featured Events"]
                                  , h1 [] [text "Featured Events"]
                                  ]
        , featuredEvent RightAligned "ANOKHI" "Fashion Show" "Make a fashion statement, and bring out the model in you." "https://forms.gle/USm6F8qSHREV53AZ8" "mbits-anokhi.mp4"
        , featuredEvent LeftAligned "THANDAV" "Dance Contest" "Show off your best moves with your team." "https://forms.gle/hQZFFPnFt8pgzy9G7" "mbits-thandav.mp4"
        , featuredEvent RightAligned "MEDHYA" "Music Concert" "Play music with your band to the beat, face off other musicians from colleges across kerala." "https://docs.google.com/forms/d/e/1FAIpQLSc1RTsVihaM6oP-Q521Nu_Ra57mnsWud88ykxA83o8zrXUfDA/viewform?usp=sf_link" "mbits-raagam.mp4"
--        , event "Poster Designing" "fluent_design-ideas-24-filled" "12th Nov 2022" "Indiviual" "Manual/Digital, submit on or before."
        ]

type Alignment
    = LeftAligned
    | RightAligned

alignClass : Alignment -> String -> String
alignClass alignment class =
    case alignment of
        LeftAligned -> " " ++ class
        RightAligned -> ""
        
featuredEvent : Alignment -> String -> String -> String -> String -> String -> Html msg
featuredEvent alignment eventName eventType eventDesc registerLink videoURI =
    div [ class ("featured-event"  ++ (alignClass alignment "featured-left-align"))]
        [ div [ class ("featured-event-top" ++ (alignClass alignment "featured-top-left-align"))]
              [ video [ class "video"
                      , src ("assets/videos/" ++ videoURI)
                              , autoplay True
                              , controls False
                              , loop True
                              , property "muted" (Json.Encode.bool True)
                              ] []
                      , div [ class ("featured-event-info" ++ (alignClass alignment "featured-info-left-align"))]
                          [ h1 [] [ text eventType ]
                          , div [ class "event-desc" ] [ text eventDesc ]
                          , linkButton Register registerLink "Register now"
                          ]
              ]
        , div [ class ("featured-event-name")
              ] [ text eventName ]
        ]

proShow : Alignment -> String -> String -> String -> String -> String -> String -> String -> Html msg
proShow alignment title subTitle day date time timeA videoURI =
    div [ class ("pro-show" ++ (alignClass alignment "pro-show-left")) ]
        [ video [ class "video"
                , src ("assets/videos/" ++ videoURI)
                , autoplay True
                , controls False
                , loop True
                , property "muted" (Json.Encode.bool True)
                ] []
        , div [ class "pro-show-info" ]
              [ div [ class "pro-show-info-top" ]
                    [ h1 [] [ text title ]
                    , h2 [] [ text subTitle ]
                    ]
              , div [ class "pro-show-info-bottom" ]
                  [ div [ class "date" ]
                        [ div [ class "day" ] [ text day ]
                        , h2 [ class "date" ] [ text date ]
                        ]
                  , div [ class "time" ]
                      [ h1 [] [ text time ]
                      , text timeA
                      ]
                  ]
              ]
        ]
              
event : String -> String -> String -> String -> String -> Html msg
event name image date members desc =
    div [ class "event" ]
        [ img [ src ("assets/svgs/" ++ image ++ ".svg") ] []
        , div [ class "event-info" ]
            [ h1 [] [ text name ]
            , div [ class "event-add-info" ] [ b [] [ text (date ++ " · ") ], text members ]
            , text desc
            ]
        ]


gallery =
    div [ class "gallery" ]
        [ h1 [] [ text "Gallery" ]
        , text "Photos from Tech Olympiad 2018"
        , div [ class "photos" ]
            (List.map (\i -> img [ src ("assets/images/img" ++ i ++ ".jpg") ] []) (List.map String.fromInt (List.range 1 4)))
        ]


footer =
    div [ class "footer" ]
        [ div [ class "footer-text" ]
            [ div [ class "name" ] [ text "Rhythm" ]
            , div [] [ text "The biggest arts event in MBITS. With the sole reason of bringing out the artist in every student." ]
            ]
        , img [ class "mbits", src "assets/images/mbitsInstitutions.png" ] []
        ]
