module Friends
  ( Friends
  , wai
  , tokuiNandane
  , runFriendsJp
  , goFriendsJp
  ) where

import Prelude (Unit, unit, ($), discard, (<>), pure)
import Control.Monad.Free (Free, foldFree, liftF)
import Data.Functor.Coproduct.Inject
import Effect (Effect)
import Effect.Console (log)
import Util (liftF')

data Friends a
  = Wai a
  | TokuiNandane String a

-- wai :: Free Friends Unit
-- wai = liftF $ Wai unit
wai :: forall f. Inject Friends f => Free f Unit
wai = liftF' $ Wai unit

-- tokuiNandane :: String -> Free Friends Unit
-- tokuiNandane skill  = liftF $ TokuiNandane skill unit
tokuiNandane :: forall f. Inject Friends f => String -> Free f Unit
tokuiNandane skill = liftF' $ TokuiNandane skill unit

goFriendsJp :: forall a. Friends a -> Effect a
goFriendsJp (Wai next) = do
  log "わーい！"
  pure next

goFriendsJp (TokuiNandane skill next) = do
  log ("君は" <> skill <> "が得意なフレンズなんだね！")
  pure next

runFriendsJp :: forall a. Free Friends a -> Effect a
runFriendsJp f = foldFree goFriendsJp f
