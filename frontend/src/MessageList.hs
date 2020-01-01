{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE RecursiveDo #-}
module MessageList (widget, Input(..)) where

import qualified Data.Text as T
import Reflex.Dom.Core

import qualified Data.Map as Map

data Input t = Input {
  inputMessages :: Dynamic t [T.Text]
}

widget :: MonadWidget t m => Input t -> m ()
widget input = do
  elAttr "div" (Map.fromList [("style", "width: 100%; height: 100%; overflow-y: auto;")]) $ do
    _ <- simpleList (inputMessages input) displaySomeData
    return ()

displaySomeData :: MonadWidget t m => Dynamic t T.Text -> m ()
displaySomeData dynamicMessage = do
  elClass "div" "" $ dynText $ dynamicMessage
  return ()
