module Print3Broken where
printSecond :: IO ()
printSecond = do
    putStrLn greeting
    where greeting = "Yarrrrr"
main :: IO ()
main = do
    putStrLn greeting
    printSecond
    where greeting = "Yarrrrr"
-- bad practice to just copy the variable definition but i couldnt figure out another way to do it.