
> module EightFive where

Essentially, our goal here is to have as many cases reduce down to the few 
base cases as possible and also reduce the number of times the recursion stack
is called.

> recursiveMultiply :: Integer -> Integer -> Integer
> recursiveMultiply 0 _ = 0
> recursiveMultiply 1 x = x
> recursiveMultiply x y
>   | x > y = recursiveMultiply y x
>   | x < 0 = - (recursiveMultiply (-x) y)
>   | otherwise = y + recursiveMultiply (x-1) y