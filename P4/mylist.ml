(*hd*)
let hd = function 
	[]-> raise(Failure "hd")
	| h::_ -> h;;	

(*tl*)
let tl = function
	[]-> raise(Failure "tl")
	| _::t -> t;;

(*length*)
let rec length = function 
	[]->0
	| _::t -> 1 + length t;;

(*compare_lengths*)
let rec compare_lengths l1 l2 =
	match l1, l2 with
	([],[]) -> 0
	| ([], _) -> -1
	| (_, []) -> 1
	| (_::t1, _::t2) -> compare_lengths t1 t2;;
	
(*nth*)
let rec nth l n = match l, n with
	[], _ -> raise(Failure "nth")
	| h::_, 0 -> h
	| _::t, n -> nth t (n-1);; 
	
(*append*)
let rec append l1 l2 = match l1 with
	[]->l2
	| h::t -> h::append t l2;;


(*find*)
let rec find c l = match l with
	[]-> raise (Not_found)
	| h::t -> if c h then h
				else find c t;;

(*for_all*)
let rec for_all c l = match l with
	[] -> true
	| h::t -> if c h then for_all c t
						else false;;

(*exists*)
let rec exists c l = match l with
	[]-> false
	| h::t -> if c h then true
				else exists c t;;

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
	| lst -> let rec fstl = function [] -> [] 
	| h::t -> if t = [] then (fst h)::[] else (fst h)::(fstl t) in let rec sndl = function [] -> [] 
	| h::t -> if t = [] then (snd h)::[] else (snd h)::(sndl t) in (fstl lst, sndl lst);;

(*combine*)
let rec combine = function l1 -> function l2 ->
  if length l1 != length l2 then raise (Invalid_argument "combine") else
	if l1 = [] || l2=[] then [] else
		if l1 = [] then ((hd l1) , (hd l2))::[] else ((hd l1), (hd l2))::(combine (tl l1) (tl l2));;


(*init*)
let rec init = function n -> function f ->
	if n=1 then (f (n-1))::[]
	else append (init (n-1) f) ((f (n-1))::[]);;

(*rev*)
let rec rev = function
	[] -> []
   	|h::t -> append (rev t) [h];;

(*rev_append*)	
let rec rev_append l1 l2 = match l1 with
	[]->12
	| h::t -> rev_append t (h::l2);;
	
(*concat*)	
let rec concat = function
	[] -> []
	|h::t -> append h (concat t);;	

(*flatten*)
let rec flatten = concat;;

(*map*)
let rec map f=function
  	[]->[]   
  	|h::t->f h::map f t;;
  	
 (*rev_map*) 	
let rev_map f l = rev (map f l);;

(*map2*)
let rec map2 f l1 l2 = match (l1,l2) with
         ([],[]) -> []
         | (h1::t1,h2::t2) -> f h1 h2 :: map2 f t1 t2
         | (_,_) -> raise(Invalid_argument "List.map2");;	

(*fold_left*)
let rec fold_left op e = function
	[]->e
	| h::t -> fold_left op (op e h) t;;
	
(*fold_right*)
let rec fold_right op l e = match l with
	[] -> e
	| h::t -> op h (fold_right op t e);;	
