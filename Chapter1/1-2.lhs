
> module OneTwo where
> import Data.List

this is the cleanest solution just by sorting and checking
unfortunately, this approach depends on Ord when it shouldn't
have any sort of dependency like that to be just a permutation

> checkPermutation :: Ord a => [a] -> [a] -> Bool
> checkPermutation xs ys = (sort xs) == (sort ys)

without Ord (and sorting) the runtime jumps from linearithmic
to quadratic because the orderly checking method through the
sort cannot be used, so we must make histograms and make sure
they are the same entry by entry. Also, note that this requires
the construction of two dictionaries on top of the time penalty.
