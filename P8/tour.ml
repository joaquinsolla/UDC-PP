(*JOAQUÍN SOLLA VÁZQUEZ*)

let in_board x y (px, py) =
	(px>0 && px<=x) && (py>0 && py<=py);;
	
let not_mem l e =
	not (List.mem e l);;
	
let move x y (px, py) visitadas = 
	let mov = [(px+1, py+2); (px+1, py-2); (px-1, py+2); (px-1, py-2); (px+2, py+1); (px+2, py-1); (px-2, py+1); (px-2, py-1)]
		in List.filter (not_mem visitadas) (List.filter (in_board x y) mov);;<
		
let tour x y start finish =
	if x>0 && y>0 && (in_board x y start) && (in_board x y finish) then
		let rec aux solution = function
			 [] -> raise(Not_found)
			|h::t -> if (h=finish) then List.rev (h::solution)
					 else try aux (h::solution) (move x y h (h::solution))
						  with Not_found -> aux solution t
			in if (start=finish) then [start]
				else aux [start] (move x y start [start])
		else raise(Invalid_argument "tour");;	
