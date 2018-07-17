string :: String
string = "Curry is awesome"
rvrs :: String
rvrs = part3 ++ part2 ++ " " ++ part1
    where part1 = take 5 string
          part2 = take 3 $ drop 5 string
          part3 = drop 9 string
