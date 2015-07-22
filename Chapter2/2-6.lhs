> module TwoSix where

We could try to think of some overly complicated/clever transversal
that checks the outermost values of a palindrome... or we can make this
trivial by the observation that a palindrome is the same forwards and 
backwards.

> palindrome :: Eq a => [a] -> Bool
> palindrome xs = xs == reverse xs

This is just O(n) to reverse, but we need extra memory to hold the
second copy and then another transversal at the end to check for 
equality. There is a complicated outside-in recursive approach you
could take if you had the imperative pointer version of this problem.

