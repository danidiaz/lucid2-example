{-# LANGUAGE OverloadedStrings, ExtendedDefaultRules #-}
module Main where

import Lucid
import Network.Wai
import Network.Wai.Handler.Warp (run)
import Network.HTTP.Types (status200)

app :: Application
app _ f = f (responseLBS status200 [] "foo 2")

main :: IO ()
main = do
    putStrLn "Hello, Haskell! ---333"
    run 8000 app
