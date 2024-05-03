{-# LANGUAGE OverloadedStrings, ExtendedDefaultRules, BlockArguments #-}
module Main where

import Lucid
import Network.Wai
import Network.Wai.Handler.Warp (run)
import Network.HTTP.Types (status200)
import Data.Function ((&))

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
