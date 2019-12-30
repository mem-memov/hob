{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE ScopedTypeVariables #-}
module ToolbarElement (widget, Output(..)) where


import           Control.Lens
import qualified Data.Map     as M
import qualified Data.Text    as T
import           Reflex.Dom
import Control.Monad.Fix (MonadFix)

import qualified Widget.Display
import qualified Widget.Input

data Output t = Output {
  toolbarElementSendMessageEvent :: Event t T.Text
}

widget :: MonadWidget t m => m (Output t)
widget = do
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
    return $
      Output {
        toolbarElementSendMessageEvent = sendMessageEvent
      }

