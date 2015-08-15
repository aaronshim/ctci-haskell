
> module TwoOne where

This removing duplicates exercise is asking us for a reimplementation
of the Data.List function `nub`

Since lists in Haskell are linked lists (by the most basic system calls
we can make on them), this exercise should be reminiscent of how to
do it for any general linked lists with pointers, etc.

Given an unordered list, we have no choice but to transverse each
element using the naive algorithm... let us try to do this with as few
Data.List functions as possible. (We realize that most of what we are
implementing here is already in Data.List)

(Here is the specific case of `filter` we will use)

> removeElement :: Eq a => a -> [a] -> [a]
> removeElement _ [] = []
> removeElement x (y:ys) =
>   if x == y
>   then removeElement x ys
>   else y:(removeElement x ys)

And to run our new `filter` on every element on the list

> removeDuplicates :: Eq a => [a] -> [a]
> removeDuplicates [] = []
> removeDuplicates (x:xs) = x:(removeDuplicates (removeElement x xs))

And because we transverse the entier list for every element using the
naive algorithm, our runtime should be O(n^2). Unless we are allowed to
destroy the list (and return a scrambled version of it), we cannot use
sorting to make the linearithmic solution. (We did this in an earlier
exercise using `sort` and `group`.)

