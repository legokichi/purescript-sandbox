module Main where

import Control.Monad.Eff
import Debug.Trace
import Data.Array

fizzbuzz :: Number -> [String]
fizzbuzz 0 = []
fizzbuzz n
  | n % 15 == 0 = fizzbuzz(n - 1) ++ ["fizzbuzz"]
  | n %  5 == 0 = fizzbuzz(n - 1) ++ ["buzz"]
  | n %  3 == 0 = fizzbuzz(n - 1) ++ ["fizz"]
  | true        = fizzbuzz(n - 1) ++ [show n]

main :: Eff (trace::Trace) Unit
main = do
  trace $ map ++ fizzbuzz 10
