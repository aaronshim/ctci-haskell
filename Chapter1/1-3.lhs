> module OneThree where

The main problem here is that in Haskell, strings are lists of chars
so if we decided to do string replacements, we sometimes need to
replace one element with a multi-element sequence. Map or
List Comprehensions look like they will have a hard time with this.
We can write this using recursion or with folding.

(Thankfully, we only have to scan for one character at a time.
There is no need to substitute out a multi character block with
some other multi character block.)

> urlify :: [Char] -> [Char]
> urlify [] = []
> urlify (x:xs) = if x==' ' then "%20"++(urlify xs) else x:(urlify xs)

> urlifyFold :: [Char] -> [Char]
> urlifyFold = foldr (\x y -> if x==' ' then '%':'2':'0':y  else x:y) []
