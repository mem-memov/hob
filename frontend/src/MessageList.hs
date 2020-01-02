{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE RecursiveDo #-}
module MessageList (widget, Input(..)) where

import qualified Data.Text as T
import Reflex.Dom.Core

import qualified Data.Map as Map

import qualified Message

data Input t = Input {
  inputMessages :: Dynamic t [T.Text]
}

widget :: MonadWidget t m => Input t -> m ()
widget input = do
  elAttr "div" (Map.fromList [("style", "width: 100%; height: 100%; overflow-y: auto;")]) $ do
    messageOutputs <- simpleList (inputMessages input) displaySomeData
    return ()

displaySomeData :: MonadWidget t m => Dynamic t T.Text -> m (Message.Output t)
displaySomeData dynamicMessage = do
  output <- Message.widget (Message.Input dynamicMessage)
  return (output)

