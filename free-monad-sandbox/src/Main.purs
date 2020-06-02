module Main where

import Prelude (Unit, ($), discard, pure, unit)
import Effect (Effect)
import Effect.Console (log)
-- import StarlightNinjaFriends (bananice, domo, tokuiNandane, wai, runStarlightNinjaFriendsJp)
import StarlightNinjaFriends2 (bananice, domo, tokuiNandane, wai, runStarlightNinjaFriends2Jp)

main :: Effect Unit
main = do
  log "🍝"
  runStarlightNinjaFriends2Jp $ do
      wai
      domo "💩コード"
      tokuiNandane "💩コード"
      bananice
      pure unit
