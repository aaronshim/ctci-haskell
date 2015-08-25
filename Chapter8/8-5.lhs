
> module EightFive where

> recursiveMultiply :: Integer -> Integer -> Integer
> recursiveMultiply _ 0 = 0
> recursiveMultiply 0 _ = 0
> recursiveMultiply x 1 = x
> recursiveMultiply 1 x = x
> recursiveMultiply x y
>   | x < 0 || y < 0 = error "Cannot deal with negative numbers"
>   | otherwise = y + recursiveMultiply (x-1) y