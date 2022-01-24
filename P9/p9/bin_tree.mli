
type 'a bin_tree =
    Empty
  | Node of 'a * 'a bin_tree * 'a bin_tree
;;

val sum : int bin_tree -> int
val prod : float bin_tree -> float
val in_order : 'a bin_tree -> 'a list

