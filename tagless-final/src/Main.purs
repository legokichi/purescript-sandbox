module Main where

import Prelude
import Effect (Effect)
import MainEffect as E
import MainAff as A
import MainAff2 as A2
import MainFree as F

main :: Effect Unit
main = do
    -- F.main
    E.main
    A.main
    A2.main
