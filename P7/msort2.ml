let rec divide l = match l with
	 h1::h2::t -> let t1, t2 = divide t in (h1::t1, h2::t2)
	| _ -> l, [];;

let rec merge = function
	 [], l | l, [] -> l
	| h1::t1, h2::t2 -> if h1 <= h2 then h1 :: merge (t1, h2::t2)
						else h2 :: merge (h1::t1, t2);;

let rec msort1 l = match l with
	 [] | _::[] -> l
	| _ -> let l1, l2 = divide l in
			merge (msort1 l1, msort1 l2);;


(*Redefina las funciones merge y msort1, con tipos (’a -> ’a -> bool) -> ’a list * ’a
list -> ’a list y (’a -> ’a -> bool) -> ’a list -> ’a list, respectivamente, de
modo que puedan ser utilizados con cualquier orden (y no solo con (<=)).*)

let rec merge ord = function 
	 [],l | l,[] -> l
	|h1::t1, h2::t2 -> if ( ord h1) h2 then h1 :: merge ord ( t1, h2::t2)
					   else h2::merge ord (h1::t1,t2);;

let rec msort1 ord l = match l with
	 [] | _::[] -> l
	| _ -> let l1, l2 = divide l in
		   merge ord (msort1 ord l1, msort1 ord l2);;


(*¿Puede provocar algún problema la no terminalidad de divide o merge? En caso afirmativo,
defina un valor l2 : int list que sea un ejemplo de ello. En caso negativo, defina l2 como
la lista vacı́a.*)

(*Sí, puede producir stack overflow si trabajan con listas muy grandes ya que 
no son funciones terminales*)

let randomL r n = 
	let rec aux (i, l) = if (i>n) then l
	else aux(i+1, Random.int r::l) in
aux(1, []);;

let l2 = randomL 400000 400000


(*Defina de modo recursivo terminal funciones divide’ y merge’ que cumplan el mismo
cometido que divide y merge, respectivamente. Realice una implementación, msort2, de la
ordenación por fusión utilizando divide’ y merge’. Compare el rendimiento en tiempo de
ejecución de msort2 con el de msort1 y con el de qsort2.*)

let divide' l = 
	let rec aux i p = function
		 [] -> (i, p)
		|h1::[] -> (h1::i, p)
		|h1::h2::t -> aux (h1::i) (h2::p) t
	in aux [] [] l;; 
	
let merge' ord (l1, l2) =
		let rec aux a = function
			 [], l | l, [] -> List.rev_append a l
			|h1::t1, h2::t2 -> if ord h1 h2 then aux (h1::a) (t1, h2::t2)
							   else aux (h2::a) (h1::t1, t2)
		in aux [] (l1, l2);;					   	


let rec msort2 ord l = match l with
	 [] | _::[] -> l
	| _ -> let l1, l2 = divide' l
		   in merge' ord (msort2 ord l1, msort2 ord l2);;

(*Tamaño de lista empleado para la comprobación: 150000.
Comparando los tiempos, msort2 es más lento que msort1 y más rápido que qsort2.*)
