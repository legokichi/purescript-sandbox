{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "my-project"
, dependencies =
  [ "aff"
  , "console"
  , "datetime"
  , "effect"
  , "free"
  , "integers"
  , "psci-support"
  , "typelevel"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
