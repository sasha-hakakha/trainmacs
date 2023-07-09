module Main where
import System.IO
import  GameState.GameState as GameState
import InterpretCommand.InterpretCommand (interpretCommand)

applyCommand :: (GameState -> GameState) -> GameState -> (GameState, String)
applyCommand action gameState =
  let updatedState = InterpretCommand command gameState
  in (updatedState, "Command applied")

main :: IO ()
main = do
  let initialState = GameState { GameState.id = 0, cursor = "^/" }
  loop initialState

loop :: GameState -> IO ()
loop gameState = do
  putStr $ cursor gameState ++ " "
  hFlush stdout 
  action <- getLine
  let actionFunction = interpretAction action
      (updatedState, message) = applyCommand actionFunction gameState
  putStr message
  putStrLn ""
  loop updatedState
