module NinjaFriends
  ( module Friends
  , module Ninja
  , NinjaFriends
  , goNinjaFriendsJp
  , runNinjaFriendsJp
  ) where

import Friends (wai, tokuiNandane, runFriendsJp, goFriendsJp, Friends)
import Ninja (domo, Ninja, goNinjaJp)
import Data.Functor.Coproduct
import Control.Monad.Free (Free, foldFree)
import Effect (Effect)
import Util (or)

type NinjaFriends
  = Coproduct Ninja Friends

goNinjaFriendsJp :: forall a. NinjaFriends a -> Effect a
goNinjaFriendsJp x = (goNinjaJp `or` goFriendsJp) x

runNinjaFriendsJp :: forall a. Free NinjaFriends a -> Effect a
runNinjaFriendsJp f = foldFree goNinjaFriendsJp f
