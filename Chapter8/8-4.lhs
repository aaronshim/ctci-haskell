
> module EightFour where

We will just construct the permutation subsets on an element by element basis.
We just needed to make sure that our base case was correct.

> powerSet :: [a] -> [[a]]
> powerSet [] = [[]]
> powerSet (x:xs) = oldSet ++ (map (\l -> x:l) oldSet)
>   where oldSet = powerSet xs
