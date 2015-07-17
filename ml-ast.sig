signature ML_AST = 
sig
 
    structure PrimOp: sig
        datatype t 
          = Print
          | Add
          | Sub
          | Times
          | Int2String

        val pp: t -> unit 
    end

    datatype t
      = Var of string
      | Empty 
      | Num of int
      | String of string
      (* | Pair of t * t *) (*(e,e)*)
      | App of t * t 
      | FuncVal of string * t (*fn x => e*)
      | Tag of int * t (*ini e*)
      | LetVal of string * t * t
      (*let val x = e in e' end*)
      | Tuple of t list
      | Proj of int * t (* #i e *)
      | Case of t * string * t * string * t
    (* case e of in1 x1 => e1 | in2 x2 => e2 *)
      | Prims of PrimOp.t * t list
      | If0 of t * t * t 
      | LetFix of string * string * t * t
(* let fun f (x) = e1 in e2 *)   

val dump2file : t * string -> unit
val pp : t-> unit 
end
