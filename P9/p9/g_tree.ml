
type 'a g_tree =
  Gt of 'a * 'a g_tree list
;;
 
let rec breadth_first = function
    Gt (x, []) -> [x]
  | Gt (x, (Gt (y, t2))::t1) -> x :: breadth_first (Gt (y, t1@t2))
;;

