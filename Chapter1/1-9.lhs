> module OneNine where
> import Data.List

This is one of those questions that becomes trivial once you know the
"trick". The isSubstring method mentioned in the book is implemented
in Haskell through the function isInfixOf that takes a more general
list (since String in Haskell is defined as a list of characters).

> stringRotation :: [Char] -> [Char] -> Bool
> stringRotation s1 s2 = isInfixOf s2 (s1 ++ s1)

The string addition of s1 is a O(n) operation on the length n of s1.
isInfixOf appears to be O(m*n) because it is just a functional
implementation of the naive substring search algorithm-- it takes all
possible tails of the haystack (should be O(n)) and then checks if each
has the needle as a prefix (should be O(m)).

It is worth noting that most system substring-search libraries use some
sort of iterated naive search algorithm-- there are some published
smarter algorithms on this for O(n) time (they have heuristics to skip
some searches on mismatch) but it appears that these more complex
beasts have not been widely implemented yet.

