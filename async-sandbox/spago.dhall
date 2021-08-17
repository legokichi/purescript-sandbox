{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "my-project"
, dependencies =
  [ "aff"
  , "aff-coroutines"
  , "argonaut"
  , "avar"
  , "console"
  , "contravariant"
  , "coroutines"
  , "effect"
  , "foldable-traversable"
  , "free"
  , "newtype"
  , "option"
  , "parallel"
  , "psci-support"
  , "transformers"
  , "tuples"
  , "variant"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
