module Main where
import System.IO
import GameState

identity :: GameState -> GameState
identity x = x 

interpretAction :: String -> (GameState -> GameState)
interpretAction x = identity

incrementAction :: GameState -> GameState
incrementAction gs = gs { GameState.id = GameState.id gs + 1 }

decrementAction :: GameState -> GameState
decrementAction gs = gs { GameState.id = GameState.id gs - 1 }

applyAction :: (GameState -> GameState) -> GameState -> (GameState, String)
applyAction action gameState =
  let updatedState = action gameState
  in (updatedState, "Action applied")

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
      (updatedState, message) = applyAction actionFunction gameState
  putStr message
  putStrLn ""
  loop updatedState
