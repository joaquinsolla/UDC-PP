false && (2 / 0 > 0);;
(*- : bool = false*)

true && (2 / 0 > 0);;
(*Exception: Division_by_zero.*)

true || (2 / 0 > 0);;
(*- : bool = true*)

false || (2 / 0 > 0);;
(*Exception: Division_by_zero.*)

let con = (&&);;
(*val con : bool -> bool -> bool = <fun>*)

let dis = (||);;
(*val dis : bool -> bool -> bool = <fun>*)

(&&) (1 < 0) (2 / 0 > 0);;       
(*- : bool = false*)

con (1 < 0) (2 / 0 > 0);;
(*Exception: Division_by_zero.*)

(||) (1 > 0) (2 / 0 > 0);;
(*- : bool = true*)

dis (1 > 0) (2 / 0 > 0);;
(*Exception: Division_by_zero.*)
