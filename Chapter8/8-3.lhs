
> module EightThree where

The simplest way is to start off with an element-by-element transversal.
This, however, is not the most efficient way because it doesn't take into
account that the array comes sorted.

> magicIndex :: [Integer] -> Integer
> magicIndex = magicIndexOffset 0
>   where magicIndexOffset _ [] = error "Not in list"
>         magicIndexOffset n (x:xs)
>           | n == x = x
>           | otherwise = magicIndexOffset (n+1) xs

Since we have a sorted array, we can take a binary search-like approach to see
whether the A[i] == i happens in the left or right half?

No, that approach is not likely to work... Even if we have an element that is 
too big for our index, there is no guarentee that the magic index will be 
before our current observed value or after...

Actually, with the addition that the numbers will be distinct, we know that 
this is actually possible: if we approach a value that is too big for its
index than we know that the magic index will be to its left because the values
will only increase to the right of it, so the index will never be able to 
increase to catch up.

Honestly, this won't be much faster because of access times for indices only
Haskell lists... but at least in theory we can write an array-like algorithm?

We also need to change the type from Integer to Int to play nice with the fact
that we are dealing with indices in a Haskell list. Also the integer division
function in Haskell is called quot. We also have to includ a base case of a
singleton list because of list subdivisions and drop 0 will cause infinite 
loops.

> magicIndexOpt :: [Int] -> Int
> magicIndexOpt = magicIndexOffset 0
>   where magicIndexOffset _ [] = error "Not in list"
>         magicIndexOffset n [x]
>           | n == x = n
>           | otherwise = magicIndexOffset n []
>         magicIndexOffset n xs
>           | midElement > midIndex = magicIndexOffset n (take mid xs)
>           | midElement < midIndex = magicIndexOffset (n+mid) (drop mid xs)
>           | midElement == midIndex = midElement
>           where mid = length xs `quot` 2
>                 midElement = xs !! mid
>                 midIndex = mid + n

The checks are also a little bit more complicated when there are repeated 
elements in the list. In that case, we have to once again look at both sides
of the list even when we get a suspicision on whether it is to the right or
left.