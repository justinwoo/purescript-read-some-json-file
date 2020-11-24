module Main where

import Prelude

import Data.Bifunctor (lmap)
import Data.Either (Either(..))
import Effect (Effect)
import Effect.Aff (launchAff)
import Effect.Class.Console (log)
import Node.Encoding (Encoding(..))
import Node.FS.Aff (readTextFile)
import Simple.JSON (readJSON)

type Config =
  { fruit :: String
  }

parseConfig :: String -> Either String Config
parseConfig s = lmap show $ readJSON s

main :: Effect _
main = launchAff do
  contents <- readTextFile UTF8 "./config.json"
  case parseConfig contents of
    Right config -> do
      log config.fruit
    Left e -> do
      log e
