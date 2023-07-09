-- module Main where

-- import GameState

-- processAction :: GameState -> String -> (GameState, String)
-- processAction gameState str = (gameState', "heard")
--   where
--     gameState' = updateGameState gameState
--     updateGameState :: GameState -> GameState
--     updateGameState gs = gs { GameState.id = GameState.id gs + 1 }

-- applyAction :: (GameState, String) -> (GameState, String)
-- applyAction GameState action =
--   let (message, updatedState) = processAction GameState action
--   in (updatedState { GameState.id = GameState.id updatedState + 1 }, message)

-- main :: IO ()
-- main = do
--   let initialState = GameState { GameState.id = 0, cursor = "^/" }
--   loop initialState

-- loop :: GameState -> IO ()
-- loop gameState = do
--   putStrLn $ cursor gameState
--   action <- getLine
--   let  (updatedState, message) = applyAction gameState (action gameState) 
--   putStrLn message
--   loop (updatedState { GameState.id = GameState.id updatedState })
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
