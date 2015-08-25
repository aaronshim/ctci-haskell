
> module EightSeven where
> import Data.List

We are going to recursively build a set of all possible permutations of a 
string by putting the dynamic programming approach on permutations of the 
substring. Essentially, every time we have the permutations of the substring,
we will add one new letter by placing it in every possible position of each
of the possible permutations of the substring.

We are also wrapping a error checker on this to make sure there are no dups.

> permutationWithoutDups :: String -> [String]
> permutationWithoutDups str
>   | (sort.nub) str == sort str = pwdRec str
>   | otherwise = error "List must be without duplicates"
>   where pwdRec [] = [[]]
>         pwdRec (x:xs) = concat $ map (insertEvery x) (pwdRec xs)

Given an item and a list, we want a new set of lists where the item was
 inserted between every single possible position in the list.

> insertEvery :: a -> [a] -> [[a]]
> insertEvery x [] = [[x]]
> insertEvery x (y:ys) = (x:(y:ys)):(map (\l -> y:l) (insertEvery x ys))