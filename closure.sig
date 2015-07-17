signature CLOSURE = 
sig             
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
      = LetVal of {name: string
                 , value: v , body: t}
      | Let of {name: string, index: int
              , tuple: string, body: t} 
      | LetCont of {cont: string
                  , env: string
                  , arg: string
                  , fbody: t
                  , body: t
                  , freevars: string list}
      | ContApp of {cont: string
                  , env: string
                  , arg: string}
      | FuncApp of {func: string
                  , cont: string
                  , env: string
                  , arg: string}
      | Case of {cond: string
               , thenarg: string
               , thenn: t
               , elsearg: string
               , elsee: t} 
      | LetPrim of {name: string
                  , opr: PrimOp.t
                  , args: string list
                  , body: t}
      | If0 of {cond: string
              , thenn: t
              , elsee: t} 
      | LetFix of {func :string
                 , env: string
                 , cont: string
                 , arg: string
                 , fbody: t
                 , body: t
                 , freevars: string list}
      | Exit of string
         and v
           = Empty
           | Num of int
           | String of string 
           | Tuple of string list 
           | Tag of {label: int
                   , name: string}  
           | FuncVal of {env: string
                       , cont: string
                       , arg: string
                       , fbody: t
                       , freevars: string list}
                        
    val dump2file : t * string -> unit
    val pp : t  -> unit
end
