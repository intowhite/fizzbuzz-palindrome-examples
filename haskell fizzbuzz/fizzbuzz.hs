{-
- Example fizzBuzz program
-
- Compile first ->
- ghc -o fizzbuzz fizzbuzz.hs
-
- Run from command line with 3 arguments ->
- ./fizzbuzz 2 4 6
-}

import Data.List
import System.IO
import System.Environment

main = do
    -- Get args from commandline
    [first,second,upper] <- getArgs
    let [firstNum,secondNum,upperNum] = [read first :: Int, read second :: Int, read upper :: Int]

    -- Generate range list based on uppper input
    -- Starts with [0..] per challenge
    let range = [0..upperNum]

    let speak_numbers x =
            if (x `mod` firstNum == 0 && x `mod` secondNum == 0)
                then "FizzBuzz"
                else if (x `mod` firstNum == 0)
                    then "Fizz"
                    else if (x `mod` secondNum == 0)
                        then "Buzz"
                        else show x

    -- Formatting
    let results = map speak_numbers range
    let output = unlines results
    let trimnewline = 
            reverse . dropWhile (=='\n') . reverse
    let trimmed = trimnewline output

    -- Remove the FizzBuzz generated from range[0]
    let clean = drop 9 trimmed
    putStrLn clean