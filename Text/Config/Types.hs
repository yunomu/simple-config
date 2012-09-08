module Text.Config.Types
    where

data ConfType
    = ConfString
    | ConfURI
    | ConfList ConfType
  deriving (Show)

type ConfLine = (String, ConfType)

type ConfTmp = (String, [ConfLine])

