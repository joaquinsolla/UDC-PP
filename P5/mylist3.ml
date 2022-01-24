let rec remove = function a -> function
	[] -> []
	|h::t -> if h=a then t else h::remove a t;;

let rec remove_all = function a -> function
  [] -> []
  |h::t -> if h=a then remove_all a t else h::remove_all a t;;

let rec ldif l1 l2 = match l1,l2 with
	([],_) -> []
	|(h1::t1,[]) -> h1::t1
	|(h1::t1,h2::t2) -> ldif (remove_all h2 l1) t2;;
 
 let rec lprod l1 l2 =
	let rec sprod s = function 
		[] -> []
        | h::t -> (s,h)::sprod s t in
    match l1 with
        [] -> []
        | h::t -> sprod h l2 @ lprod t l2;;

let rec divide = function l ->
	let rec impar = function 
		[] -> [] | h1::[] -> h1::[] 
		| h1::h2::t -> (h1::impar t) 
	in let rec par = function 
		[] -> [] 
		| h1::[] -> [] 
		| h1::h2::t -> (h2::par t) 
	in (impar l, par l);;
