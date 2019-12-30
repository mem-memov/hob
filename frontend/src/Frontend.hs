{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE RecursiveDo #-}
module Frontend where

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

import ToolbarElement
import MessageListElement


frontend :: Frontend (R FrontendRoute)
frontend = Frontend
  { _frontend_head = prerender_ (text "Loading..") headElement
  , _frontend_body = prerender_ (text "Loading...") bodyElement
  }

headElement :: MonadWidget t m => m ()
headElement = do
  el "title" $ text "Obelisk Minimal Example"
  elAttr "meta" ("charset" =: "utf-8") blank
  elAttr "meta" (Map.fromList [("name", "viewport"), ("content", "width=device-width, initial-scale=1")]) blank
  elAttr "link" (("rel" =: "stylesheet") <> ("href" =: "https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css")) blank
  elAttr "script" (("defer" =: "defer") <> ("src" =: "https://use.fontawesome.com/releases/v5.3.1/js/all.js")) $ text ""
  return ()
  
bodyElement :: MonadWidget t m => m ()
bodyElement = do
  elClass "section" "hero is-fullheight" $ do
    elClass "div" "hero-head" $ blank
    elClass "div" "hero-body" $ do
      elAttr "div" (Map.fromList [("style", "display: flex; flex-grow: 1; flex-shrink: 1; align-self: stretch; position: relative")]) $ do
        elAttr "div" (Map.fromList [("style", "position: absolute; width: 100%; height: 100%;")]) $ do
          MessageListElement.messageListElement
    elClass "div" "hero-foot" $ do
      toolbarElementOutput <- ToolbarElement.widget
      return ()




