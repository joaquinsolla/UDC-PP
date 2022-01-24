let suml lst = let rec aux a = function
	[] -> 0
    |h::t -> aux (h+a) t in aux 0 lst;;

let maxl lst = let rec aux amx = function
    [] -> raise (Failure "maxl")
    |h::[] -> if (h>amx) then h else amx
    |h::t -> if (h>amx) then aux h t
    else aux amx t in aux (List.hd lst) lst;;

let to0from n = let rec aux a i =
    if i<0 then []
    else if i=n then i::a
    else aux (i::a) (i+1) in aux [] 0;;

let fromto m n = let rec aux a i =
    if m>n then []
    else if i=m then i::a
    else aux (i::a) (i-1) in aux [] n;;

let from1to n = let rec aux a i =
	if n<1 then []
    else if i=1 then i::a
    else aux (i::a) (i-1) in aux [] n;;

let append lst1 lst2 = let rec aux a = function
	[] -> a
	|h::t -> aux (h::a) t in aux lst2 (List.rev lst1);;

let map f lst = let rec aux a = function
	[] -> a
    |h::t -> aux ((f h)::a) t in aux [] (List.rev lst);;

let power x y = let rec aux a i =
		if i=y then x*a
        else aux (x*a) (i+1) in
  if y<0 then raise (Invalid_argument "power")
  else if y=0 then 1
  else aux 1 1;;

let incseg l = let rec aux al an = function
	[] -> al
    |h::t -> aux ((h+an)::al) (h+an) t in List.rev (aux [] 0 l);;

let remove x lst = let rec aux lno = function
	[] -> lno
    |h::t -> if (x=h) then List.rev_append lno t
    else aux (h::lno) t in aux [] lst;;

let insert x lst = let rec aux pila = function
    [] -> x::pila
    |h::t -> if (x<=h) then List.rev_append pila (x::h::t)
    else aux (h::pila) t in aux [] lst;;

let insert_gen f x lst = let rec aux pila = function
    [] -> x::pila
    |h::t -> if (f x h) then List.rev_append pila (x::h::t)
    else aux (h::pila) t in aux [] lst;;

