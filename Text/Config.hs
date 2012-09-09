-- | Simple-config is a parser generator for simple configuration file.
--
-- To use this library, one needs import a module and set extensions.
--
-- > {-# LANGUAGE TemplateHaskell, QuasiQuotes #-}
-- > import Text.Config
--
-- The following is quick example.
--
-- > mkConfig "configParser" [config|
-- > TestConfig
-- >     uri  URI
-- >     text String
-- >     list [String]
-- > |]
--
-- The example generates following codes.
--
-- > data TestConfig = TestConfig
-- >     { uri  :: String
-- >     , text :: String
-- >     , list :: [String]
-- >     }
-- > 
-- > configParser :: Parser TestConfig
-- > configParser = ...
--
module Text.Config
    ( -- * Types
      module Text.Config.Types
    , module Text.Config.TH
    ) where

import Text.Config.Types
import Text.Config.TH

