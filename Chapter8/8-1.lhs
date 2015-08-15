
> module EightOne where

This is a bottom-up addition approach similar to the Towers of Hanoi solution.
(Pattern matching is subsequently harder when you have to have a check for
 negative numbers.)

> tripleStep :: Int -> Integer
> tripleStep n = 
>   if n < 0 then 0
>   else if n == 0 then 1
>        else tripleStep (n-1) + tripleStep (n-2) + tripleStep (n-3)

And since this is too expensive to do without memoization, here is a
slight optimization (inspired by the guide to Haskell memoization on
	the Haskell Wiki).

> tripleStepMem :: Int -> Integer
> tripleStepMem n 
>   | n < 0 = 0
>   | n == 0 = 1
>   | otherwise = map tripleStepI [0 ..] !! n
>   where tripleStepI n
>           | n < 0 = 0
>           | n == 0 = 1
>           | otherwise = tripleStepMem (n-1) + tripleStepMem (n-2)
>              + tripleStepMem (n-3)

This doesn't seem that much faster...

> tripleStepMem2 :: Int -> Integer
> tripleStepMem2 = (map tripleStepI [0 ..] !!)
>   where tripleStepI n
>           | n < 0 = 0
>           | n == 0 = 1
>           | n == 1 = 1
>           | n == 2 = 2
>           | n == 3 = 4
>           | otherwise = tripleStepMem2 (n-1) + tripleStepMem2 (n-2)
>              + tripleStepMem2 (n-3)

So it appears that this is the only memoized approach that works! It
looks like there is some inherent magic in lazy evaulation that makes
this particular approach work, but not the first two.