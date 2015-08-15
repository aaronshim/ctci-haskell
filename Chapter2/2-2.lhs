
> module TwoTwo where

Since a linked list does not come with a length, we need at least two transversals and O(n) to find the k-th to last.

Here is where the first iteration finds the length of the list and the second transverses it forwards again to find the length - kth item.

> returnKthToLast :: Int ->  [a] -> a
> returnKthToLast k xs = xs !! (length xs - k)

A slightly different way is to reverse the linked list (still only O(n) cost) and then find the kth item.

> returnKthToLastR :: Int -> [a] -> a
> returnKthToLastR k xs = (reverse xs) !! (k - 1)

(Error catching is done by Prelude's index out of range exceptions)

