
type 'a st_tree =
    S of 'a
  | C of 'a * 'a st_tree * 'a st_tree
;;

exception No_branches
;;

let single e =
  S e
;;

let comp r (lb, rb) =
  C (r, lb, rb)
;;

let root = function
    S r
  | C (r, _, _) -> r
;;

let branches = function
    C (_, lb, rb) -> (lb, rb)
  | _ -> raise No_branches
;;

