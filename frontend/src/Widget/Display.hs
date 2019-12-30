{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Widget.Display (widget) where


import           Control.Lens
import qualified Data.Map     as M
import qualified Data.Text    as T
import           Reflex.Dom
import Control.Monad.Fix (MonadFix)

widget textEvent = do
  textDynamic <- holdDyn "" textEvent 
  elClass "div" "box" $ dynText textDynamic