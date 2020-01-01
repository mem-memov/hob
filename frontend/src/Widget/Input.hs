{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Widget.Input (widget) where


import           Control.Lens
import qualified Data.Text    as T
import           Reflex.Dom
import Control.Monad.Fix (MonadFix)

widget :: (DomBuilder t m, MonadFix m) => m (Event t T.Text)
widget = do
  rec
    let send = keypress Enter input
    input <- inputElement $ def
      & inputElementConfig_setValue .~ fmap (const "") send
      & inputElementConfig_elementConfig . elementConfig_initialAttributes .~
        ("placeholder" =: "Write message and press enter") 
        <> ("type" =: "text") 
        <> ("class" =: "input")
  return $ tag (current $ _inputElement_value input) send