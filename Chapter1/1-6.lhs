> module OneSix where
> import Data.List
> import Data.Char

This exercise is made almost trivial by the existence of "group" in
the basic Haskell library. The complexity is added through dealing
with multiple list types in Haskell and converting them to these
letter-number hybrid strings when type conversions are much more
protected.

This is the helper method that does the conversion from strings of
like characters to the letter-number of times format. We work under
the assumption that these always contain a string of same characters.

> unwrapGroup :: [Char] -> [Char]
> unwrapGroup [x] = [x]
> unwrapGroup xs = [head xs, (intToDigit.length) xs]

And here is our actual compression method. We will use foldr for the
very final string concatenation because ++ is the cost of the length
of the left string.

> stringCompression :: [Char] -> [Char]
> stringCompression originalStr =
>   if length originalStr > length compressedStr
>   then compressedStr
>   else originalStr
>   where glue = foldr (++) []
>         compressedStr = glue $ map unwrapGroup $ group originalStr

NOTE: After preparing this solution, I noticed that the book does not
remove the redundant qualifier 1 after a singleton letter. (This
easily blows up the size of the compressed string if most characters
do not occur twice in a row.) This can be achieved by removing the
pattern-matching case for the singleton letter group in the unWrapGroup
method (the second line).
