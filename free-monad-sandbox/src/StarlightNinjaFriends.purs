module StarlightNinjaFriends
  ( module NinjaFriends
  , module Starlight
  , StarlightNinjaFriends
  , goStarlightNinjaFriendsJp
  , runStarlightNinjaFriendsJp
  ) where

import NinjaFriends (domo, wai, tokuiNandane, runNinjaFriendsJp, goNinjaFriendsJp, NinjaFriends)
import Starlight (bananice, Starlight, goStarlightJp)
import Data.Functor.Coproduct
import Control.Monad.Free (Free, foldFree)
import Effect (Effect)
import Util (or)

type StarlightNinjaFriends
  = Coproduct Starlight NinjaFriends

goStarlightNinjaFriendsJp :: forall a. StarlightNinjaFriends a -> Effect a
goStarlightNinjaFriendsJp x = (goStarlightJp `or` goNinjaFriendsJp) x

runStarlightNinjaFriendsJp :: forall a. Free StarlightNinjaFriends a -> Effect a
runStarlightNinjaFriendsJp f = foldFree goStarlightNinjaFriendsJp f
