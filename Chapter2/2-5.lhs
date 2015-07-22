> module TwoFive where

Here is a good opportunity to use zip

(let's declare this little guy here so we can reuse it)

> unwrapDigits :: [Int] -> Int
> unwrapDigits [x] = x
> unwrapDigits (x:xs) = x + 10*unwrapDigits xs

> sumListsBackwards :: [Int] -> [Int] -> Int
> sumListsBackwards xs ys = unwrapDigits $ zipWith (+) xs ys

And easily enough, since hundreds, tens, ones, etc. do stay separate
but we have to worry about placeholders if the lists are not the same
length. The easiest way to do that is to defer to the backwards method
after taking the time to reverse both lists.

> sumListsForwards :: [Int] -> [Int] -> Int
> sumListsForwards xs ys = sumListsBackwards (reverse xs) (reverse ys)

Oh, also it appears that the zipWith kinda leaves out the excess if the
lists aren't the same length... we could write a caseworky version of
this using guards to correct for that situation...

Can we get some fancier currying here?

Note that this is much harder to do with transversing the list through
pointers because the zipWith essentially takes care of all the parallel
transversals and placeholders that have to happen.

