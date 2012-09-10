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
-- >     val  Int
-- >     vals [Int]
-- >     bs   ByteString
-- > |]
--
-- The example generates following codes.
--
-- > data TestConfig = TestConfig
-- >     { uri :: String
-- >     , text :: String
-- >     , list :: [String]
-- >     , val :: Int
-- >     , vals :: [Int]
-- >     , bs :: ByteString
-- >     }
-- >   deriving (Show)
-- >
-- > instance Default TestConfig where
-- >     def = TestConfig
-- >         { uri = "http://localhost/"
-- >         , text = ""
-- >         , list = []
-- >         , val = 0
-- >         , vals = []
-- >         , bs = ""
-- >         }
-- > 
-- > configParser :: Parser TestConfig
-- > configParser = ...
--
-- Its parser is able to parse following string.
--
-- > uri: http://example.com/content.html
-- > text: wakaruwa
-- > list: kaede, kirari, momoka
-- > val: 28
-- > vals: 25, 17, 12
-- > bs: chihiro
--
module Text.Config
    ( -- * Types
      module Text.Config.Types
    , module Text.Config.TH
    ) where

import Text.Config.Types
import Text.Config.TH

