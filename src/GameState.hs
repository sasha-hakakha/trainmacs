module GameState
  ( GameState(..)
  ) where

data GameState = GameState
  { id :: Int
  , cursor :: String
  } deriving (Show)


