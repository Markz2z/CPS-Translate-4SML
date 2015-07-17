signature CPS = 
sig
    type cont
    type func

    structure PrimOp:
              sig
                  datatype t 
                    = Print
                    | Add
                    | Sub
                    | Times
                    | Int2String

                  val pp: t -> unit 
              end               
 
    datatype t
      = LetVal of string * v * t 
      | Let of string * int * string * t 
      | LetCont of cont * string * t * t  
      | ContApp of cont * string   
      | FuncApp of func * cont * string  
      | Case of string * cont * cont  
      | LetPrim of string * PrimOp.t * string list * t 
      (*let val x = option [x1, ...] in t*)
      | If0 of string * cont * cont
      | LetFix of func * cont * string * t * t 
      | Exit of string  
         and v
           = Empty
           | Num of int
           | String of string 
           | Tuple of string list 
           | Tag of int * string  
           | FuncVal of cont * string * t 

    val dump2file : t * string -> unit
    val pp : t  -> unit
end
