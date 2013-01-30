module Text.Config.Lib
    where

import Text.Parsec
import Text.Parsec.ByteString
import Control.Applicative hiding (many, (<|>))
import Network.URI
import Data.ByteString (ByteString)
import qualified Data.ByteString.Char8 as BC

comment :: Parser ()
comment = () <$ string "--" <* many (noneOf "\r\n")

commentLine :: Parser ()
commentLine = comment *> nl <|> nl

nl :: Parser ()
nl = () <$ try (string "\r\n") <|> () <$ char '\n'

commentLines :: Parser ()
commentLines = () <$ many commentLine

key :: Parser String
key = many1 $ oneOf $ ['a'..'z'] ++ ['A'..'Z'] ++ ['0'..'9'] ++ "_"

spcs :: Parser ()
spcs = () <$ many spc

spcs1 :: Parser ()
spcs1 = () <$ many1 spc

spc :: Parser Char
spc = satisfy (`elem` " \t")

cv_string :: Parser String
cv_string = try $ do
    char '"'
    str <- many1 (noneOf "\"\r\n")
    char '"'
    return str
  <|> many1 (noneOf ", \t\r\n") <* spcs

cv_bytestring :: Parser ByteString
cv_bytestring = BC.pack <$> cv_string

cv_list :: Parser p -> Parser [p]
cv_list p = sepBy p (spcs *> char ',' <* spcs) <* spcs

cv_uri :: Parser String
cv_uri = do
    str <- cv_string
    if isURI str
      then return str
      else fail "parse error: URI"

cv_int :: Parser Int
cv_int = read <$> many1 digit <* spcs

sep :: Parser ()
sep = () <$ char ':' *> spcs
