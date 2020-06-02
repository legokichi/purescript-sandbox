module Main where


import Prelude (Unit, show, ($), discard, (<), negate, map, (<$>), (<*>), pure)
import Data.Ord (class Ord)
import Effect (Effect)
import Effect.Console (log)
import Data.Traversable (sequence, traverse)
import Data.Semiring (zero, class Semiring)
import Data.Maybe (Maybe(..))
import Data.Array ((..), (:))
import Debug.Trace (spy)

main :: Effect Unit
main = do
  log "sequence :: Array (Maybe String) -> Maybe (Array String)"
  let a = spy "a" [Just "🍝", Nothing]
  log $ show $ sequence a
  log "sequence :: Array (Maybe String) <- Maybe (Array String)"
  let b = spy "b" Just ["🍝"]
  log $ show $ b
  log $ show $ sequence b

  -- https://en.wikibooks.org/wiki/Haskell/Traversable
  log "traverse :: Array String -> Maybe (Array String)"
  let c = ["🍝"] :: Array String
  log $ show $ traverse (\o -> Just o) c
  let d = [1, -1, 2, -2, 3]
  log $ show $ traverse deleteIfNegative d
  let e = [1.0, -1.0, 2.0, -2.0, 3.0]
  log $ show $ traverse deleteIfNegative e
  let f = spy "f" (0 .. 2)
  log $ show $ traverse (\x -> spy ".." $ 0 .. (spy "x" x)) $ f
  log $ show $ sequence $ map (\x -> 0 .. x) (0 .. 2)
  let g = spy "g" $ map (\x -> 0 .. x) (0 .. 2)
  log $ show $ sequence [[0],[0,1],[0,1,2]]
  log $ show $ (:) <$> [0] <*> ((:) <$> [0,1] <*> ((:) <$> [0,1,2] <*> (pure [])))
  log $ show $ (:) <$> [0] <*> ((:) <$> [0,1] <*> ([[0],[1],[2]]))
  log $ show $ (:) <$> [0] <*> [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2]]
  log $ show [[0,0,0],[0,0,1],[0,0,2],[0,1,0],[0,1,1],[0,1,2]]

deleteIfNegative :: forall a. Ord a => Semiring a => a -> Maybe a
deleteIfNegative x = if x < zero then Nothing else Just x
