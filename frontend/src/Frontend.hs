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
        elAttr "div" (Map.fromList [("style", "display: flex; flex-grow: 1; flex-shrink: 1; align-self: stretch; position: relative")]) $ do
          -- elAttr "div" (Map.fromList [("style", "position: absolute; width: 100%; height: 100%; display: flex; flex-direction: column; overflow-y: auto;")]) $ do
          elAttr "div" (Map.fromList [("style", "position: absolute; width: 100%; height: 100%; display: flex; flex-direction: column; flex-wrap: wrap-reverse; align-items: flex-end; justify-content: flex-end;")]) $ do
            elClass "span" "tag is-primary" $ text "1"
            elClass "div" "tag is-primary" $ text "2"
            elClass "div" "tag is-primary" $ text "3"
            elClass "div" "tag is-primary" $ text "4"
            elClass "div" "tag is-primary" $ text "5"
            elClass "div" "tag is-primary" $ text "6"
            elClass "div" "tag is-primary" $ text "7"
            elClass "div" "tag is-primary" $ text "8"
            elClass "div" "tag is-primary" $ text "9"
            elClass "div" "tag is-primary" $ text "10"
            elClass "div" "tag is-primary" $ text "11"
            elClass "div" "tag is-primary" $ text "12"
            elClass "div" "tag is-primary" $ text "13"
            elClass "div" "tag is-primary" $ text "14"
            elClass "div" "tag is-primary" $ text "15"
      elClass "div" "hero-foot" $ do
        elClass "div" "container" $ do
          elAttr "input" (Map.fromList [("type", "text"), ("class", "input")]) $ blank
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