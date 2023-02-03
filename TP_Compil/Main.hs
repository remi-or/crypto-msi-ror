module Main(main) where

import Control.Monad.State.Lazy
import PascalParser

main :: IO()
main = do
  input <- getContents
  let (compile,finalState) = runState (parseProgram input) initEtat
  putStrLn compile
