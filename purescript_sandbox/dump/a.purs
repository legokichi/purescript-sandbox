module Main where

foreign import take :: forall a. Number -> [a] -> [a]
foreign import reverse :: forall a. [a] -> [a]
foreign import filter :: forall a. (a -> Boolean) -> [a] -> [a]
foreign import even :: forall a. Number -> Boolean
foreign import iota :: forall a. Number -> Number -> [Number]

a = take 3 (reverse (filter even (iota 1 10)))
-- var c = take(3)(reverse(filter(even)(iota(1)(10))));

--b = take 3 . reverse . filter even $ (iota 1 10)
-- cannot compile

c = take 3 $ reverse $ filter even $ (iota 1 10)
-- var a = take(3)(reverse(filter(even)(iota(1)(10))));
