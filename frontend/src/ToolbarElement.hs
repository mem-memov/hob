{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE RecursiveDo #-}
module ToolbarElement(toolbarElement) where

import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import Obelisk.Frontend
import Obelisk.Configs
import Obelisk.Route
import Reflex.Dom.Core

import Common.Api
import Common.Route
import Obelisk.Generated.Static

import qualified Data.Map as Map
import           Data.Monoid ((<>))

toolbarElement :: MonadWidget t m => m ()
toolbarElement = do
  elClass "div" "container" $ do
    let attrs = constDyn $ Map.fromList [("type", "text"), ("class", "input")]
    message <- textInput $ def & textInputConfig_attributes .~ attrs
                    & textInputConfig_initialValue .~ "example"
    elClass "button" "button is-rounded" $ do
      elClass "span" "icon is-small" $ do
        elClass "i" "fas fa-search" $ blank
    elClass "button" "button is-rounded" $ do
      elClass "span" "icon is-small" $ do
        elClass "i" "fas fa-backspace" $ blank
    elClass "button" "button is-rounded" $ do
      elClass "span" "icon is-small" $ do
        elClass "i" "fas fa-undo" $ blank
    elClass "button" "button is-rounded" $ do
      elClass "span" "icon is-small" $ do
        elClass "i" "fas fa-redo" $ blank
  return ()