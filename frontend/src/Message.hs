{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE RecursiveDo #-}
module Message (widget, Input(..), Output(..)) where

import qualified Data.Text as T
import Reflex.Dom.Core

data Input t = Input {
    inputText :: Dynamic t T.Text
}

data Output t = Output {
    outputClick :: Event t (DomEventType (Element EventResult GhcjsDomSpace t) 'ClickTag)
}

widget :: MonadWidget t m => Input t -> m (Output t)
widget input = do
  (dinamicElement, _) <- elClass' "div" "" $ do
    elClass "span" "tag is-primary" $ dynText (inputText input)
  return $ Output {
      outputClick = domEvent Click dinamicElement
  }

