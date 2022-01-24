(*EJERCICIO 1*)
let rec gcd a b =
	if (a mod b == 0 || b mod a == 0) then min a b
	else gcd (min a b)((max a b) / (min a b));;
	
(*EJERCICIO 2*)
let is_prm n =
	let rec not_divisible_from d =
		d * d > n || (n mod d <> 0 && not_divisible_from (d+1)) in
	n > 1 && not_divisible_from 2;;
(*La función is_prm determina si un número n es primo, recibiendo un 
entero y devolviendo un booleano. Comenzamos comprobando si es divisible
entre 2, si es verdadero el número no es primo, sino, comprobamos si se
cumple que d*d > n siendo n no divisible entre d, si es así, el número
es primo.*)

let is_prm2 n =
	let rec not_divisible_from d =
		(n mod d <> 0 && not_divisible_from (d+1)) || d * d > n in
	n > 1 && not_divisible_from 2;;
(*El resultado de la función es el mismo que la anterior, pero su
rendimiento es mucho peor que el de la primera. El cambio en la tercera 
línea, evaluando de segunda condición "d*d > n" obliga al sistema a
realizar siempre la operación recursiva not_divisible_from lo cual 
aumenta considerablemente el tiempo de operación*)

(*EJERCICIO 3*)
let capicua n =
	let rec inverso n i =
		let r = n mod 10 in
		if (n/10 = 0) then i*10+r else inverso (n/10) (i*10+r) in 
	n = inverso n 0;;
