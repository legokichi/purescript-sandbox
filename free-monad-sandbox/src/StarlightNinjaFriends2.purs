module StarlightNinjaFriends2
  ( module Ninja
  , module Friends
  , module Starlight
  , StarlightNinjaFriends2
  , goStarlightNinjaFriends2Jp
  , runStarlightNinjaFriends2Jp
  ) where

import Friends (wai, tokuiNandane, runFriendsJp, goFriendsJp, Friends)
import Ninja (domo, Ninja, goNinjaJp)
import Starlight (bananice, Starlight, goStarlightJp)
import Data.Functor.Coproduct
import Control.Monad.Free (Free, foldFree)
import Effect (Effect)
import Util (or)

type StarlightNinjaFriends2
  = Coproduct Starlight (Coproduct Ninja Friends)

goStarlightNinjaFriends2Jp :: forall a. StarlightNinjaFriends2 a -> Effect a
goStarlightNinjaFriends2Jp x = (goStarlightJp `or` (goNinjaJp `or` goFriendsJp)) x


runStarlightNinjaFriends2Jp :: forall a. Free StarlightNinjaFriends2 a -> Effect a
runStarlightNinjaFriends2Jp f = foldFree goStarlightNinjaFriends2Jp f
