{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Widget.Display (widget) where

import qualified Data.Text    as T
import           Reflex.Dom

widget :: (DomBuilder t m, PostBuild t m, MonadHold t m) 
    => Event t T.Text
    -> m ()
widget textEvent = do
  textDynamic <- holdDyn "" textEvent 
  elClass "div" "box" $ dynText textDynamic