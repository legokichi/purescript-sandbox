module Main (main) where

import Prelude (Unit(), bind)
import Control.Monad.Eff (Eff())
import Control.Monad.Eff.Console (CONSOLE(), log)
import qualified Sandbox.Learning as L
import qualified Sandbox.Halogen as H

-- Eff :: # ! -> * -> *
-- Eff ( console :: CONSOLE ) :: * -> *
-- main :: # ! -> * -> *
main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  L._main
  H._main
