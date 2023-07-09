module InterpretCommand.InterpretCommand
  ( interpretCommand
  )
  where


identity :: a -> a
identity x = x 

interpretCommand :: String -> (a -> a)
interpretCommand x = identity
