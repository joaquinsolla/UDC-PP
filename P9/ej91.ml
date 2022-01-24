(*JOAQUÍN SOLLA VÁZQUEZ*)

open Bin_tree
 
let rec fold_tree funct cc = function
	Empty -> cc
	|Node (x,l,r) -> funct x (fold_tree funct cc l ) (fold_tree funct cc r);;

let sum tree =
	fold_tree (fun x y z -> x+y+z) 0 tree;;

let prod tree = 
	fold_tree (fun x y z -> x*.y*.z) 1. tree;;

let num_nodes tree = 
	fold_tree (fun x y z -> 1+y+z) 0 tree;;

let in_order tree =
	fold_tree (fun x y z -> y @ x::z) [] tree;;

let mirror tree =
	fold_tree (fun x y z -> Node (x, z, y)) Empty tree;;

let rec prod2 = function
	Empty -> 1.
	|Node (x,l,r) -> if x=0. then 0.
		else x *. (prod2 l) *. (prod2 r);;
