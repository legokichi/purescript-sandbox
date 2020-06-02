module Util where

import Prelude (($))
import Control.Monad.Free (Free, liftF)
import Data.Either (Either(..))
import Data.Functor.Coproduct (Coproduct(..))
import Data.Functor.Coproduct.Inject

liftF' :: forall f g a. Inject f g => f a -> Free g a
liftF' f = liftF $ inj f

or :: forall f g h a. (f a -> h a) -> (g a -> h a) -> (Coproduct f g a -> h a)
or fh gh = case _ of
  (Coproduct (Left left)) -> fh left
  (Coproduct (Right right)) -> gh right
