{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE RecursiveDo #-}
module MessageList (widget, Input(..)) where

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

data Input t = Input {
  inputMessageEvent :: Event t T.Text
}

widget :: MonadWidget t m => Input t -> m ()
widget input = do
  elAttr "div" (Map.fromList [("style", "width: 100%; height: 100%; overflow-y: auto;")]) $ do
    widgetHold (text "Loading...") (displaySomeData <$> (inputMessageEvent input))
    elClass "div" "" $ text "1"

displaySomeData :: MonadWidget t m => T.Text -> m ()
displaySomeData passedText = do 
  elClass "div" "" $ text passedText
  return ()