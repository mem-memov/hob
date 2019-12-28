{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE RecursiveDo #-}
module MessageListElement(messageListElement) where

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

messageListElement :: MonadWidget t m => m ()
messageListElement = do
  elAttr "div" (Map.fromList [("style", "width: 100%; height: 100%; overflow-y: auto;")]) $ do
    elClass "div" "" $ text "1"
    elClass "div" "" $ text "2"
    elClass "div" "" $ text "3"
    elClass "div" "" $ text "4"
    elClass "div" "" $ text "5"
    elClass "div" "" $ text "6"
    elClass "div" "" $ text "7"
    elClass "div" "" $ text "8"
    elClass "div" "" $ text "9"
    elClass "div" "" $ text "10"
    elClass "div" "" $ text "11"
    elClass "div" "" $ text "12"
    elClass "div" "" $ text "13"
    elClass "div" "" $ text "14"
    elClass "div" "" $ text "15"