{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Function ((&))
import Lucid
import Network.HTTP.Types (status200)
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
      div_ [class_ "m-auto bg-emerald-300 w-3/4"] "foo"

app :: Application
app req f =
  case req & pathInfo of
    ["output.css"] -> f (responseFile status200 [] "./output.css" Nothing)
    _ -> f (responseLBS status200 [] (Lucid.renderBS page))

main :: IO ()
main = run 8000 app
