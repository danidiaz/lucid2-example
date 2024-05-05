{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Exception (throwIO)
import Data.Function ((&))
import Data.Text
import Lucid
import Network.HTTP.Types (hContentType, status200)
import Network.Wai (Application, pathInfo, responseFile, responseLBS)
import Network.Wai.Handler.Warp (run)

page :: Html ()
page = do
  html_ do
    head_ do
      title_ "foo"
      link_ [rel_ "stylesheet", href_ "output.css"]
      pure ()
    body_ do
      div_ [class_ "m-auto bg-emerald-300 w-1/4"] do
        p_ "foo"
        p_ do toHtml someText
        foldMap p_ ["this", "is", "monoidally", "appended"]

someText :: Text
someText = "sometext"

app :: Application
app req f =
  case req & pathInfo of
    [] ->
      f do responseLBS status200 [(hContentType, "text/html; charset=utf-8")] do Lucid.renderBS page
    ["output.css"] ->
      f do responseFile status200 [(hContentType, "text/css")] "./output.css" Nothing
    _ ->
      throwIO do userError "unknown path"

main :: IO ()
main = run 8000 app
