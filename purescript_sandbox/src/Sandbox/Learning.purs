module Sandbox.Learning
  ( _main
  ) where

import Prelude
import Control.Monad.Eff (Eff())
import Control.Monad.Eff.Console (CONSOLE(), log)


_main :: forall e. Eff (console :: CONSOLE | e) Unit
_main = do
  log $ show $ getAnswer earth
  log $ show $ Cartesian3D 3.0 3.0


data Cartesian3D = Cartesian3D Number Number
instance showCartesian3D :: Show Cartesian3D where
  show (Cartesian3D a b) = "Cartesian3D " ++ show a ++ " " ++ show b

earth :: Object ( answer :: Number )
earth = { answer : 42.0 }
blueplanet :: { answer :: Number }
blueplanet = { answer : 42.0 }
getAnswer :: Object ( answer :: Number ) -> Number
getAnswer { answer : n } = n

-- dataで直積型を定義。
data Vector2 = Vector2 Number Number
p :: Vector2
p = Vector2 10.0 20.0

-- 関数定義でのパターンマッチングは可能
addVector :: Vector2 -> Vector2 -> Vector2
addVector (Vector2 x1 y1) (Vector2 x2 y2) = Vector2 (x1 + x2) (y1 + y2)

-- case式でもパターンマッチングは可能
px :: Number
px = case p of
  Vector2 x y -> x

-- Type Kind
---- *
---- * -> *
-- Effect Kind
---- !
---- Data.Trace.Trace :: !
-- Row Kind
---- () :: # *
---- () :: # !
---- ( number :: Number ) :: # *
---- ( trace :: Trace ) :: # !
---- ( number :: Number, string :: String ) :: # *
---- Object :: # * -> *
---- Object () :: *
---- Object ( number :: Number, string :: String ) :: *
---- Eff :: # ! -> * -> *
---- Eff () :: * -> *
---- Eff ( trace :: Trace ) :: * -> *
---- Eff ( trace :: Trace ) Number :: *

{-
(x) :: Cartesian3D -> Cartesian3D -> Cartesian3D

class Field a where
  add  :: a -> a -> a
  zero :: a
  mul  :: a -> a -> a
  one  :: a
  sub  :: a -> a -> a
instance fieldNumber :: Field Number where
  add = numAdd
  zero = 0.0
  mul = numMul
  one = 1.0
-}
