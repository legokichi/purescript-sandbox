module Main where

import Control.Applicative (pure)
import Control.Bind (bind, discard)
import Control.Category (identity)
import Control.Monad.Error.Class (try)
import Control.Monad.Trans.Class (lift)
import Data.Function (($))
import Data.Either (Either(Left, Right))
import Data.Newtype (wrap)
import Data.Show (show)
import Data.Time.Duration (Milliseconds, class Duration, fromDuration)
import Data.Semigroup ((<>))
import Data.Unit (Unit, unit)
import Effect.Aff (Aff, launchAff, launchAff_, Fiber, delay, joinFiber, forkAff, killFiber)
import Effect (Effect)
import Effect.Class (class MonadEffect, liftEffect)
import Effect.Class.Console (log)
import Effect.Exception (error)

main :: Effect Unit
main = do
  log "============"
  logExample
  log "============"
  simpleFiber
  log "============"
  killingFiber
  

main2 :: Effect Unit
main2 = do
  fiber <- launchAff do
    log2 "fiber launching"
    delay $ wrap 1.0
    a <- forkAff do
      log2 "fiber2 launching"
      delay $ wrap 1.0
      log2 "never run"
      pure unit
    log2 "fiber2 launched"
    killFiber (error "canceled") a
    delay $ wrap 1.0
    liftEffect $ log3 "fiber ended"
    pure unit
  log "fiber launched"
  pure unit
  where
    log2 :: forall m. MonadEffect m => String -> m Unit
    log2 = log
    log3 :: String -> Effect Unit
    log3 = log



logExample :: Effect Unit
logExample = do
  log "log"
  log' "log'"
  logEffect "logEffect"
  --logAff "logAff" -- type error
  launchAff_ do
    log "log"
    log' "log'"
    logAff "logAff"
    --logEffect "logEffect" -- type error
    liftEffect do
      logEffect "logEffect"
      pure unit
    pure unit
  pure unit
  where
    log' :: forall m. MonadEffect m => String -> m Unit
    log' = log
    logEffect :: String -> Effect Unit
    logEffect = log
    logAff :: String -> Aff Unit
    logAff = log

simpleFiber :: Effect Unit
simpleFiber = do
  log "simpleFiber 0"
  fiber <- launchAff do
    log "simpleFiber 1"
    delay $ wrap 1.0
    log "simpleFiber 5"
    pure unit
  log "simpleFiber 2"
  fiber2 <- launchAff do
    log "simpleFiber 3"
    joinFiber fiber
    log "simpleFiber 6"
  log "simpleFiber 4"
  pure unit

killingFiber :: Effect Unit
killingFiber = launchAff_ do
  log "killingFiber 0"
  fiber <- forkAff do
    log "killingFiber 1"
    delay $ wrap 1.0
    log "killingFiber never"
  log "killingFiber 2"
  killFiber (error "canceled") fiber
  log "killingFiber 3"
  result <- try $ joinFiber fiber
  case result of
    Left err -> do
      log $ "killingFiber 4: " <> show err
    Right result -> do
      log $ "never show unit: " <> show result
  log "killingFiber 5"
  pure unit


