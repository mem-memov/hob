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


frontend :: Frontend (R FrontendRoute)
frontend = Frontend
  { _frontend_head = do
      el "title" $ text "Obelisk Minimal Example"
      elAttr "meta" ("charset" =: "utf-8") blank
      elAttr "meta" (Map.fromList [("name", "viewport"), ("content", "width=device-width, initial-scale=1")]) blank
      elAttr "link" (("rel" =: "stylesheet") <> ("href" =: "https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css")) blank
      elAttr "script" (("defer" =: "defer") <> ("src" =: "https://use.fontawesome.com/releases/v5.3.1/js/all.js")) $ text ""
      return ()
  , _frontend_body = do
    elClass "section" "hero is-fullheight" $ do
      elClass "div" "hero-head" $ blank
      elClass "div" "hero-body" $ do
        -- elAttr "div" (Map.fromList [("class", "container"), ("style", "margin-top: auto; margin-bottom: 0;")]) $ do
        elAttr "div" (Map.fromList [("style", "display: flex; flex-flow: row wrap; align-self: stretch; align-items: bottom; flex-direction: column;")]) $ do
          -- elAttr "div" (Map.fromList [("style", "display: flex: 1 1 auto; overflow-y: auto; min-height: 0px;")]) $ do
            elClass "div" "" $ text "!!!"
            elClass "div" "" $ text "World"
            elClass "div" "" $ text "Hello"
            elClass "div" "" $ text "Bulma CSS"
            elClass "div" "" $ text "Reflex-DOM"
      elClass "div" "hero-foot" $ do
        elClass "div" "container" $ do
          elClass "div" "columns" $ do
            elClass "div" "column" $ do
              elAttr "input" (Map.fromList [("type", "text"), ("class", "input")]) $ blank
            elClass "div" "column" $ do
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
  }