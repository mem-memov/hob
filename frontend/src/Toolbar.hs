{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Toolbar (widget, Output(..)) where

import qualified Data.Text    as T
import           Reflex.Dom

import qualified Widget.Input

data Output t = Output {
  outputMessage :: Event t T.Text
}

widget :: MonadWidget t m => m (Output t)
widget = do
  elClass "div" "container" $ do
    sendMessageEvent <- Widget.Input.widget
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
        outputMessage = sendMessageEvent
      }

