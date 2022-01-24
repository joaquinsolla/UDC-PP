
open Bin_tree

val fold_tree : ('a -> 'b -> 'b -> 'b) -> 'b -> 'a bin_tree -> 'b
val sum : int bin_tree -> int
val prod : float bin_tree -> float
val num_nodes : 'a bin_tree -> int
val in_order : 'a bin_tree -> 'a list
val mirror : 'a bin_tree -> 'a bin_tree
val prod2 : float bin_tree -> float

