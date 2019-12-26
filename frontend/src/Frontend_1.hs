{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE RecursiveDo #-}
module Frontend_1 where

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
      ti <- textInput $
          def
      return ()
      -- el "section" $ do
        -- t <- textInput def
      -- el "section" $ do
      --   elClass "div" "container" $ do
      --     elClass "h1" "title" $ text "Hello World"
      --     elClass "p" "subtitle" $ do
      --       text "My ! first website with "
      --       el "strong" $ text "Bulma"
      --       text "!"
      -- rec
      --   dynBool <- toggle False evClick
      --   let dynAttrs = attrsF <$> dynBool
      --   elDynAttr "h1" dynAttrs $ text "Changing color"
      --   evClick <- button "Change Color"
      -- elClass "h1" "main-title" $ text "Main Title"
      -- clickEvent <- button "ClickMe"
      -- n <- count clickEvent
      -- display (n * 2)
      -- el "h1" $ text "Welcome to Reflex-Dom"
      -- elAttr "a" attrs (text "Google")
      -- el "div" $ do
      --   el "p" $ text "Reflex-Dom is:"
      --   el "ul" $ do
      --     el "li" $ text "Fun"
      --     el "li" $ text "Not difficult"
      --     el "li" $ text "Efficient"
      -- text "Welcome to Obelisk!"
      -- elAttr "div" ("style" =: "color:red") (text "novikov")
      -- el "p" $ text $ T.pack commonStuff
      -- elAttr "img" ("src" =: static @"obelisk.jpg") blank
      -- el "div" $ do
      --   exampleConfig <- getConfig "common/example"
      --   case exampleConfig of
      --     Nothing -> text "No config file found in config/common/example"
      --     Just s -> text $ T.decodeUtf8 s
      -- return ()
  }

attrs :: Map.Map T.Text T.Text
attrs = ("target" =: "_blank") <> ("href" =: "http://google.com")

attrsF :: Bool -> Map.Map T.Text T.Text
attrsF b = "style" =: ("color: " <> color b)
  where 
    color True = "red"
    color _    = "blue"

bodyElement :: MonadWidget t m => m ()
bodyElement = do
  rec el "h2" $ text "Counter as a fold"
      numbs <- foldDyn (+) (0 :: Int)  (1 <$ evIncr)
      el "div" $ display numbs
      evIncr <- button "Increment"
  return ()
