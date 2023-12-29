module Icons exposing (..)

import Svg exposing (..)
import Svg.Attributes exposing (..)

iconChevronDown =
    svg [ viewBox "0 0 44 44" ]
        [ Svg.path [ stroke "currentColor"
                   , strokeWidth "7"
                   , strokeLinecap "round"
                   , strokeLinejoin "round"
                   , d "M7.33301 16.5L21.9997 31.1667L36.6663 16.5"
                   ] []
        ]

iconBack =
    svg [ viewBox "0 0 26 26" ]
        [ Svg.path [ stroke "currentColor"
                   , strokeWidth "3"
                   , strokeLinecap "round"
                   , strokeLinejoin "round"
                   , d "M11.9163 5.4165L4.33301 12.9998L11.9163 20.5832M4.33301 12.9998H21.6663"
                   ] []
        ]

iconRegister =
    svg [ viewBox "0 0 34 27" ]
        [ Svg.path [ fill "currentColor"
                   , d "M27.625 25.75H22.0469C21.6086 25.75 21.25 25.3914 21.25 24.9531V22.2969C21.25 21.8586 21.6086 21.5 22.0469 21.5H27.625C28.8004 21.5 29.75 20.5504 29.75 19.375V6.625C29.75 5.44961 28.8004 4.5 27.625 4.5H22.0469C21.6086 4.5 21.25 4.14141 21.25 3.70313V1.04688C21.25 0.608594 21.6086 0.25 22.0469 0.25H27.625C31.1445 0.25 34 3.10547 34 6.625V19.375C34 22.8945 31.1445 25.75 27.625 25.75ZM24.5039 12.4023L13.3477 1.24609C12.3516 0.25 10.625 0.947266 10.625 2.375V8.75H1.59375C0.710547 8.75 0 9.46055 0 10.3438V16.7188C0 17.602 0.710547 18.3125 1.59375 18.3125H10.625V24.6875C10.625 26.1152 12.3516 26.8125 13.3477 25.8164L24.5039 14.6602C25.1215 14.0359 25.1215 13.0266 24.5039 12.4023Z"
                   ] []
        ]

barcodeIllust =
    svg [ viewBox "0 0 150 100", preserveAspectRatio "none" ]
        [ Svg.path [ fillRule "evenodd"
                   , clipRule "evenodd"
                   , fill "currentColor"
                   , d "M150 0L150 5L1.0775e-05 5L1.14441e-05 -2.14186e-06L150 0ZM150 10L150 20L8.76788e-06 20L1.0106e-05 10L150 10ZM150 30L150 35L6.76073e-06 35L7.42978e-06 30L150 30ZM150 40L150 55L4.08452e-06 55L6.09168e-06 40L150 40ZM150 60L150 65L2.74642e-06 65L3.41547e-06 60L150 60ZM150 75L150 80L7.39262e-07 80L1.40831e-06 75L150 75ZM150 85L150 90L-5.98842e-07 90L7.021e-08 85L150 85ZM150 95L150 100L-1.93695e-06 100L-1.26789e-06 95L150 95Z"
                   ] []
        ]
