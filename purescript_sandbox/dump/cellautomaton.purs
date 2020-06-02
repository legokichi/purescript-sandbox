module Main where

import Prelude
import Control.Monad.Eff

foreign import run
  "function run(a){\
  \  a();\
  \};" :: forall e a. Eff e a -> Eff e {}

foreign import log
  "function log(a){\
  \  return function(){\
  \    console.log(a);\
  \  };\
  \};" :: forall e a. a -> Eff e {}

instance semiList :: Semigroup [a] where
  (<>) [] bs = bs
  (<>) (a:as) bs = a : (as <> bs)


stepAge :: [Number] -> [Number]
stepAge (a:(b:(c:d))) = [step [a,b,c]] ++ (stepAge (b:(c:d)))
stepAge (a:(b:[c])) = [step [a,b,c]]
stepAge (a:[b]) = [0]
stepAge _ = [0]

step :: [Number] -> Number
step [1,1,1] = 0
step [0,1,1] = 1
step [1,0,1] = 0
step [1,1,0] = 0
step [1,0,0] = 1
step [0,1,0] = 1
step [0,0,1] = 1
step [0,0,0] = 0


loop :: forall e. Number -> [Number] -> Eff e {}
loop 0 _ = return {}
loop n a = do
  log $ toString a
  loop (n-1) ([0] ++ stepAge a)

toString :: [Number] -> String
toString [x] = " "
toString (0:xs) = " " ++ toString xs
toString (1:xs) = "#" ++ toString xs

main = run $ do
  let a = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  loop 100 a
