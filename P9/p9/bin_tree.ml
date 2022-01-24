
type 'a bin_tree =
    Empty
  | Node of 'a * 'a bin_tree * 'a bin_tree
;;

let rec sum = function
    Empty -> 0
  | Node (r, lb, rb) -> r + (sum lb) + (sum rb)
;;

let rec prod = function
    Empty -> 1.0
  | Node (r, lb, rb) -> r *. (prod lb) *. (prod rb)
;;

let rec in_order = function
    Empty -> []
  | Node (r, lb, rb) -> in_order lb @ (r :: in_order rb)
;;

