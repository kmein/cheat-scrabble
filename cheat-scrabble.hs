#!/usr/bin/env stack
-- stack --resolver=lts-9.0 runhaskell --package=text --package=multiset
import Data.Maybe
import System.Environment
import qualified Data.Text as T
import qualified Data.Text.IO as T
import qualified Data.MultiSet as S

fromString :: T.Text -> S.MultiSet Char
fromString = T.foldl' (flip S.insert) S.empty

main :: IO ()
main = do
    path <- fromMaybe "/usr/share/dict/words" <$> lookupEnv "DICT"
    dict <- T.lines <$> T.readFile path
    input <- (fromString . T.pack . concat) <$> getArgs
    mapM_ T.putStrLn $
        filter
            (\entry -> fromString (T.toLower entry) `S.isSubsetOf` input)
            dict
