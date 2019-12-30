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

toolbarElement :: MonadWidget t m => m ()
toolbarElement = do
  elClass "div" "container" $ do
    sendMessageEvent <- inputWidget
    displayWidget sendMessageEvent
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

inputWidget :: (DomBuilder t m, MonadFix m) => m (Event t T.Text)
inputWidget = do
  rec
    let send = keypress Enter input
    input <- inputElement $ def
      & inputElementConfig_setValue .~ fmap (const "") send
      & inputElementConfig_elementConfig . elementConfig_initialAttributes .~
        ("placeholder" =: "Write task and press enter") 
        <> ("type" =: "text") 
        <> ("class" =: "input")
  return $ tag (current $ _inputElement_value input) send


displayWidget textEvent = do
  textDynamic <- holdDyn "" textEvent 
  elClass "div" "box" $ dynText textDynamic


-- todoItem :: MonadWidget t m 
--   => Dynamic t Text 
--   -> m (Event t ())
-- todoItem dText =
--   el "div" $ do
--     el "div" $ 
--       dynText dText
--     button "Remove"

-- example :: MonadWidget t m
--   => Dynamic t Text
--   -> m ()
-- example dText = el "div" $ mdo
--   eRemove <- todoItem $ dText <> dLabel
--   dLabel <- holdDyn "" $ " (Removed)" <$ eRemove
--   pure ()