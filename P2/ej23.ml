let e1 = (function pi -> pi *. (pi +. 1.)) (2. *. asin 1.);;

let e2 = (function lg2 -> (function log2 -> log2 (float (1024 * 1024))) (function x -> log x /. lg2)) (log 2.);;

let e3 = (function pi_2 -> function r -> pi_2 *. r) (4. *. asin 1.);;

let e4 = (function sqr -> (function pi -> function r -> pi *. sqr r) (2. *. asin 1.)) (function x -> x *. x);;
