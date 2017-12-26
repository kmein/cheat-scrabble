#!/usr/bin/env stack
-- stack --resolver=lts-9.0 runhaskell --package=text
import Data.Maybe
import System.Environment
import qualified Data.Map.Strict as M
import qualified Data.Text as T
import qualified Data.Text.IO as T

type Pool a = M.Map a Word

fromString :: T.Text -> Pool Char
fromString = T.foldl' (\acc c -> M.insertWith (+) c 1 acc) M.empty

isSuperset
    :: Ord a
    => Pool a -> Pool a -> Bool
isSuperset haystack = all (\(k, v) -> M.lookup k haystack >= Just v) . M.assocs

main :: IO ()
main = do
    path <- fromMaybe "/usr/share/dict/words" <$> lookupEnv "DICT"
    dict <- T.lines <$> T.readFile path
    input <- (fromString . T.pack . concat) <$> getArgs
    mapM_ T.putStrLn $
        filter (\entry -> input `isSuperset` fromString (T.toLower entry)) dict

