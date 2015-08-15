
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
