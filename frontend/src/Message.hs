{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE RecursiveDo #-}
module Message (widget, Input(..), Output(..), State(..)) where

import qualified Data.Text as T
import Reflex.Dom.Core

data Input t = Input {
    inputText :: Dynamic t T.Text
}

data Output t = Output {
    outputClick :: Event t (State)
}

data State = State {
    stateText :: T.Text
}

widget :: MonadWidget t m => Input t -> m (Output t)
widget input = do
  (dinamicElement, _) <- elClass' "div" "" $ do
    elClass "span" "tag is-primary" $ dynText (inputText input)
  state <- createState dinamicElement
  return $ Output {
      outputClick = state <$ domEvent Click dinamicElement
  }

createState :: DomBuilder t m => Element EventResult (DomBuilderSpace m) t -> m(State)
createState dinamicElement = do
  return $ State {
    stateText = "eee"
  }
