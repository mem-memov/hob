{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE ScopedTypeVariables #-}
module ToolbarElement(toolbarElement) where


import           Control.Lens
import qualified Data.Map     as M
import qualified Data.Text    as T
import           Reflex.Dom
import Control.Monad.Fix (MonadFix)

import Widget.Display
import Widget.Input

toolbarElement :: MonadWidget t m => m ()
toolbarElement = do
  elClass "div" "container" $ do
    sendMessageEvent <- Widget.Input.widget
    Widget.Display.widget sendMessageEvent
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

