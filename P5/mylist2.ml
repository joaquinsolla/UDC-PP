(*hd*)
let hd = function 
	[]-> raise(Failure "hd")
	| h::_ -> h;;	

(*tl*)
let tl = function
	[]-> raise(Failure "tl")
	| _::t -> t;;

(*length*)
let length = function 
	l -> let rec f = function
		([],i) -> i;
		|(h::t,i) -> f (t,i+1)
	in f(l, 0);;

(*compare_lengths*)
let compare_lengths = function l1 -> function l2 ->
	let rec f = function
		(_,[]) -> -1
		|([],[]) -> 0
		|([],_) -> 1
		|(h::t,h2::t2) -> f (t,t2)
	in f(l1,l2);;
	
(*nth*)
let nth = function l -> function n ->
	let rec f = function
		[] -> (function n -> raise(Failure "nth"))
		|h::t -> (function 0 -> h | n -> f t (n-1))
	in if n<0 then raise (Invalid_argument "nth") else f l n;;
	
(*append*)
let rec append = function
  [] -> (function l2 -> l2)
  | h1::t1 -> (function l2 -> h1::(append t1 l2));;


(*find*)
let rec find c l = match l with
	[]-> raise (Not_found)
	| h::t -> if c h then h else find c t;;

(*for_all*)
let rec for_all c l = match l with
	[] -> true
	| h::t -> if c h then for_all c t else false;;

(*exists*)
let rec exists c l = match l with
	[]-> false
	| h::t -> if c h then true else exists c t;;

(*mem*)
let rec mem e l = match l with
	[] -> false
	| h::t -> (h == e) || mem e t;;

(*filter*)
let rec filter c l = match l with
	[] -> []
	| h::t -> if (c h) then h::filter c t else filter c t;;

(*find_all*)
let find_all = filter;;

(*partition*)
let rec partition c l = match l with
	[] -> ([], [])
	| h::t -> let (l1, l2) = 
		partition c t in if (c h) then (h::l1, l2) else (l1, h::l2);;

(*split*)
let rec split = function 
	[] -> ([],[]) 
	| l -> let rec fstl = function [] -> [] 
	| h::t -> if t = [] then (fst h)::[] else (fst h)::(fstl t) in let rec sndl = function [] -> [] 
	| h::t -> if t = [] then (snd h)::[] else (snd h)::(sndl t) in (fstl l, sndl l);;

(*combine*)
let rec combine = function l1 -> function l2 ->
  if length l1 != length l2 then raise (Invalid_argument "combine") else
	if l1 = [] || l2=[] then [] else
		if l1 = [] then ((hd l1) , (hd l2))::[] else ((hd l1), (hd l2))::(combine (tl l1) (tl l2));;

(*init*)
let init = function n -> function f ->
	let rec aux (f,i,l) = match (f,i,l) with
		(_,0,l) -> (f i)::l
		|(f,i,l) -> aux(f,(i-1),(f i)::l)
in aux(f,n-1,[]);;

(*rev*)

let rev = function l ->
    let rec f (a,b) = match (a,b) with
    ([],[]) -> []
    |(a,[]) -> a
    |(a,hb::tb) -> f (hb::a , tb)
in f ([],l);;

(*rev_append*)	
let rev_append = function l1 -> function l2 -> 
    let rec f (a,b) = match (a,b) with
		([],[]) -> []
		|(a,[]) -> a
		|(a,hb::tb) -> f (hb::a , tb)
    in f (l2, l1);;
  
(*concat*)	
let rec concat = function
	[] -> []
	|h::t -> append h (concat t);;	

(*flatten*)
let rec flatten = concat;;

(*map*)
let rec map = function f -> function
	[] -> []
    |h::t -> (if t=[] then (f h)::[] else append ((f h)::[]) (map f t));;
      
 (*rev_map*) 	
let rev_map = function f -> function l ->
    let rec aux (lv,f,l) = match (lv,f,l) with
		([],f,[]) -> []
		|(a,f,[]) -> a
		|(a,f,hb::tb) -> aux ((f hb)::a ,f, tb)
    in aux ([],f,l);;

(*map2*)
let rec map2 f l1 l2 = match (l1,l2) with
         ([],[]) -> []
         | (h1::t1,h2::t2) -> f h1 h2 :: map2 f t1 t2
         | (_,_) -> raise(Invalid_argument "List.map2");;	

(*fold_left*)
let fold_left = function f -> function a -> function l ->
  let rec aux (f,i,l) = match (f,i,l) with
		(f,i,[]) -> i
		|(f,i,hb::[]) -> (f i hb)
		|(f,i,hb::tb) -> aux (f, (f i hb), tb)
	in aux(f,a, l);;
	
(*fold_right*)
let rec fold_right = function f -> function l -> function i -> 
  if l = [] then i else 
	if (tl l)=[] then (f (hd l) i) else f (hd l) (fold_right f (tl l) i);;
