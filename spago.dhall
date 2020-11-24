{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "read-some-json-file"
, dependencies =
  [ "console", "effect", "node-fs-aff", "psci-support", "simple-json" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
