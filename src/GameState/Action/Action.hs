module Action
  ( Action(..)
  ) where

import GameState
data Action = Action
  { action :: (GameState -> GameState)
  , async :: Boolean
  , ttl :: Int | Infinity
  }
