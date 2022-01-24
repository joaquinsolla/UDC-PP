let rec qsort1 ord = function
	 [] -> []
	| h::t -> let after, before = List.partition (ord h) t in
	 qsort1 ord before @ h :: qsort1 ord after;;
	 
(*¿En qué casos no será bueno el rendimiento de esta implementación?*)

(*Como esta implementación no es terminal, producirá stack overflow para 
tamaños de lista muy grandes.*)


(*Para evitar problemas con la no terminalidad de (@) podemos hacer el 
siguiente cambio:*)

let rec qsort2 ord =
	let append l1 l2 = List.rev_append (List.rev l1) l2 in
	function
		 [] -> []
		| h::t -> let after, before = List.partition (ord h) t in
				append (qsort2 ord before) (h :: qsort2 ord after);;	 
				
(*¿Tiene qsort2 alguna ventaja sobre qsort1? ¿Permite qsort2 ordenar listas que no podrı́an
ordenarse con qsort1? En caso afirmativo, defina un valor l1 : int list que sea ejemplo
de ello. En caso negativo, defina l1 como la lista vacı́a.*)

(*Si, al ser append terminal, evitamos el problema de stack overflow 
permitiéndonos ordenar listas con tamaños muy grandes, mientras que en 
qsort1 claramente, no podemos.*)

let randomL r n = 
	let rec aux (i, l) = if (i>n) then l
	else aux(i+1, Random.int r::l) in
aux(1, []);;

let l1 = randomL 400000 400000;;


(*¿Tiene qsort2 alguna desventaja sobre qsort1? Compruebe si qsort2 es más lento que
qsort1. Si es ası́, explique por qué y estime la penalización, en porcentaje de tiempo usado,
de qsort2 respecto a qsort1.*)

(*qsort2 es más lento que qsort1  ya que emplea List.rev_append, la cual le hace consumir 
mucho más tiempo.
Empleando una lista de tamaño 150000, qsort2 es un 11.45% más lento que qsort1.*)
