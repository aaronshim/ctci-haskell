
> module OneFive where
> import Data.List

The easiest way to do this is to break the search into cases.
We also might notice that the insert and remove character cases are
actually inverses of each other.

The following method is to check whether str1 is just str2 minus a
character. We will build in a safeguard so that the order of arguments
don't really matter.

> insertedChar :: [Char] -> [Char] -> Bool
> insertedChar [] str2 = length str2 == 1
> insertedChar _ [] = False
> insertedChar str1 str2 = 
>  if length str1 > length str2
>  then insertedChar str2 str1
>  else
>    if head str1 == head str2
>    then insertedChar (tail str1) (tail str2)
>    else str1 == tail str2

And because of the safeguard, these two functions are the same:

> removedChar = insertedChar

And now for the third/final case:

> changedOneChar :: [Char] -> [Char] -> Bool
> changedOneChar [] [] = True
> changedOneChar str1 str2 =
>   if length str1 /= length str2
>   then False
>   else
>     if head str1 == head str2
>     then changedOneChar (tail str1) (tail str2)
>     else tail str1 == tail str2  

This seems very similar in code to the other method...

And our wrapper

> oneAway :: [Char] -> [Char] -> Bool
> oneAway str1 str2 =
>   if length str1 == length str2
>   then changedOneChar str1 str2
>   else removedChar str1 str2

Now... is there a way to wrap up the two cases so that we don't need
two separate functions? Would that look more elegant?

