(* Pattern matching examples: try to predict what the result of each expression below will be.
   You can use utop to check. *)

(* tuples *)
let (a,b) = (3,4) in a*b
let c,d = 1,2

(* list patterns *)
let (h::t) = [1;2;3]
let (x::y::z) = [1]
let (_::rest) = [1;2]

(* "as" patterns *)
let ((a1,b1) as c1) = (2,3)
let ((a2,b2) as c2, d2) = ((2,3),4)

(* OR patterns *)

(* This or pattern works... *)
let rec make_pairs = function
  | ([] | _::[]) -> []
  | a::b::t -> (a,b) :: make_pairs t

(* but this one doesn't.  Why?  Fix it.*)
let rec singleton_or_empty_list = function
  | [] | h::[] -> true
  | _ -> false

(* This pattern won't work, due to the *linearity* restriction.  It can be
fixed with "pattern guards" as in Hickey, though that's overkill here. *)
let twins p = match p with
  | (s,s) -> true
  | (s,t) -> false
