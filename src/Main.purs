module Main where

import Prelude

import Control.Monad.Aff (launchAff)
import Control.Monad.Aff.Console (log)
import Control.Monad.Eff (Eff)
import Control.Monad.Except (runExcept)
import Data.Bifunctor (lmap)
import Data.Either (Either(..))
import Node.Encoding (Encoding(..))
import Node.FS.Aff (readTextFile)
import Simple.JSON (readJSON)

type Config =
  { fruit :: String
  }

parseConfig :: String -> Either String Config
parseConfig s = lmap show $ runExcept $ readJSON s

main :: Eff _ _
main = launchAff do
  contents <- readTextFile UTF8 "./config.json"
  case parseConfig contents of
    Right config -> do
      log config.fruit
    Left e -> do
      log e
