
> module EightFive where

> recursiveMultiply :: Integer -> Integer -> Integer
> recursiveMultiply 0 _ = 0
> recursiveMultiply 1 x = x
> recursiveMultiply x y
>   | x > y = recursiveMultiply y x
>   | x < 0 = error "Cannot deal with negative numbers"
>   | otherwise = y + recursiveMultiply (x-1) y