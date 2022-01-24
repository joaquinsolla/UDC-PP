let is_prm n =
	let rec not_divisible_from d =
		d * d > n || (n mod d <> 0 && not_divisible_from (d+1)) in
	n > 1 && not_divisible_from 2;;
	
let goldbach n = 
		let rec p1 p = 
			if n < 3 then raise(Failure "goldbach") else
				if is_prm p && is_prm (n-p) then p, (n-p) else p1 (p-1)
		in p1 (n-1);;
