
> module OneFour where
> import Data.List
> import Data.Char

For something to be arranged into a palindrome, you either have an
even number of each letter (so the same number can be put in each
half) and you only have one (or none) letter that has an odd number 
of letters.

The example in the book seemed to ignore spaces (only letters) as 
well as case, so I guess we should clean the string first to take
these into consideration.

> palindromePermutation :: [Char] -> Bool
> palindromePermutation str = length (filter odd letterFrequencies) <=1
>   where cleanStr = map toLower $ filter isAlpha str
>         letterFrequencies = map length $ (group.sort) cleanStr

This approach only takes linearithmic time (the sorting), which is much
better than any proposed solution that does the brute force check with
or without extra heuristics. As is the case with any other string 
problem that is based on creating a histogram, we can write this using
an extra dictionary/hash data structure and reduce the running time
down to linear.

