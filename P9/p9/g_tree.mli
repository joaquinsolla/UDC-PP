
type 'a g_tree =
  Gt of 'a * 'a g_tree list
;;
 
val breadth_first : 'a g_tree -> 'a list

