module Ninja
  ( Ninja
  , domo
  , runNinjaJp
  , goNinjaJp
  ) where

import Prelude (Unit, unit, ($), discard, (<>), pure)
import Control.Monad.Free (Free, foldFree, liftF)
import Data.Functor.Coproduct.Inject
import Effect (Effect)
import Effect.Console (log)
import Util (liftF')

data Ninja a
  = Domo String a

domo :: forall f. Inject Ninja f => String -> Free f Unit
domo name = liftF' $ Domo name unit

goNinjaJp :: forall a. Ninja a -> Effect a
goNinjaJp (Domo name next) = do
  log ("ドーモ、" <> name <> "＝サン")
  pure next

runNinjaJp :: forall a. Free Ninja a -> Effect a
runNinjaJp f = foldFree goNinjaJp f
