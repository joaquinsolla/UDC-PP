(*JOAQUÍN SOLLA VÁZQUEZ*)

open Bin_tree;;

let rec fold_tree f a t =
  match t with
	| Empty -> a
	| Node (x, l, r) -> f x (fold_tree f a l) (fold_tree f a r);;
  
let in_order t = fold_tree (fun x l r -> l @ [x] @ r) [] t;;

let rec insert_tree f x t = match t with
	| Empty -> Node (x, Empty, Empty)
	| Node (r, i, d) -> if f x r then Node (r, i, insert_tree f x d)
					    else Node(r, insert_tree f x i, d);; 

let sort f l =
	in_order (List.fold_left (fun x a -> insert_tree f a x) Empty l) ;;
