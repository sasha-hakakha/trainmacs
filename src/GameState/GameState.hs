module GameState.GameState
  ( GameState(..)
  ) where

data GameState = GameState
  { id :: Int
  , cursor :: String
  , actions :: [Action]
  } 

data IntOrInfinity = Finite Int | Infinity

data Action = Action
  -- todo  action :: SHOW | CREATE
  { action :: (GameState -> GameState)
  , async :: Bool
  , ttl :: IntOrInfinity
  }

