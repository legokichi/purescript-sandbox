module Main where

import Prelude -- (Unit, bind, pure)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
-- import Control.Monad.Maybe.Trans (MaybeT, runMaybeT)
import Data.Nullable (toMaybe)
import Data.Maybe (Maybe(..))
import DOM (DOM)
import DOM.HTML (window)
import DOM.HTML.Document (body)
-- import DOM.HTML.HTMLCanvasElement as Cnv
import DOM.HTML.Window (document)
import DOM.HTML.Types  (htmlDocumentToDocument, htmlElementToElement)
import DOM.Node.Node (appendChild)
import DOM.Node.Document (createElement)
import DOM.Node.Types (elementToNode)

{-
liftM1 :: forall m a b. Monad m => (a -> b) -> m a -> m b
(<$>)    :: forall f a b. Functor f => (a -> b) -> f a -> f b
(<*>)    :: forall f a b. Apply f => f (a -> b) -> f a -> f b
(>>=)    :: forall m a b. Bind m => m a -> (a -> m b) -> m b
($)   :: forall a b. (a -> b) -> a -> b
-}

main :: forall e. Eff (dom :: DOM, console :: CONSOLE | e) Unit
main = do
-- + HTMLDocument
-- |         + window :: forall eff. Eff (dom :: DOM | eff) Window
-- |         |      + (>>=) :: forall m a b. Bind m => m a -> (a -> m b) -> m b
-- |         |      |   + document :: forall eff. Window -> Eff (dom :: DOM | eff) HTMLDocument
-- |         |      |   |
  htmldoc <- window >>= document
--    + Document
--    |     + htmlDocumentToDocument :: HTMLDocument -> Document
--    |     |
  let doc = htmlDocumentToDocument htmldoc
  bod <- (body htmldoc) >>= pure <<< toMaybe
-- |      |                 |    |   |
-- |      |                 |    |   + toMaybe :: forall a. Nullable a -> Maybe a
-- |      |                 |    + (<<<) :: forall a b c d. Semigroupoid a => a c d -> a b c -> a b d :: (b -> c) -> (a -> b) -> (a -> c)
-- |      |                 + pure :: forall f a.  Applicative f => a -> f a
-- |      + body :: forall eff. HTMLDocument -> Eff (dom :: DOM | eff) (Nullable HTMLElement)
-- + Maybe HTMLElement
  case bod of
    Nothing  -> log "shit!"
    Just bod -> do
--    + Node
--    |      + createElement :: forall eff. String -> Document -> Eff (dom :: DOM | eff) Element
--    |      |                      + HTMLDocument
--    |      |                      |                + elementToNode :: Element -> Node
--    |      |                      |                |
      cnv <- createElement "canvas" doc >>= pure <<< elementToNode
      let _bod = elementToNode $ htmlElementToElement bod
--                               |
--                               + htmlElementToElement :: HTMLElement -> Element
--    + appendChild :: forall eff. Node -> Node -> Eff (dom :: DOM | eff) Node
--    |            + Node
--    |            |   + Node
--    |            |   |
      appendChild cnv _bod
      log "Hello sailor!"
