module Starlight where

import Prelude (Unit, unit, ($), discard, pure)
import Control.Monad.Free (Free, foldFree, liftF)
import Data.Functor.Coproduct.Inject
import Effect (Effect)
import Effect.Console (log)
import Util (liftF')

data Starlight a
  = Bananice a

bananice :: forall f. Inject Starlight f => Free f Unit
bananice = liftF' $ Bananice unit

goStarlightJp :: forall a. Starlight a -> Effect a
goStarlightJp (Bananice next) = do
  log "バナナイス！"
  pure next

runStarlightJp :: forall a. Free Starlight a -> Effect a
runStarlightJp f = foldFree goStarlightJp f
