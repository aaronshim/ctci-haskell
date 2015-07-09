module OneOne where
import Data.List

-- this is the O(n^2) solution because nub is O(n^2)
isUnique :: Eq a => [a] -> Bool
isUnique xs = (nub xs) == xs

--is there a less than O(n^2) solution?
-- we can take the histogram approach that we usually do in
--  imperative programming for a O(n) solution

-- that approach with single transversal in Haskell is not
--  the easiest to write for now...


--oh wait, groupBy/group should be slightly better than nub?
isUnique2 :: Eq a => [a] -> Bool
isUnique2 xs = (length (filter (flip (>) 1) (map length (group xs)))) > 0

--by the design of haskell, these don't use extra data structures?
-- In imperative langauges where it is very easy to make a dictionary
--  this problem essentially boils down to linear time with dictionary
--  or linearithmic (this approach) without it (because it depends on
--  sorting).
