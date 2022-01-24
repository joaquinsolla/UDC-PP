
type 'a st_tree

exception No_branches

val single : 'a -> 'a st_tree
val comp : 'a -> 'a st_tree * 'a st_tree -> 'a st_tree
val root : 'a st_tree -> 'a
val branches : 'a st_tree -> 'a st_tree * 'a st_tree

