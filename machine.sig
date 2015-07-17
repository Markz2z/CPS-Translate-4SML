signature MACHINE =
sig

    structure PrimOp:
              sig
                  datatype t
                    = Add
                    | Sub
                    | Times
                    | Print
                    | Int2String
              end

    structure Binding:
              sig
                  datatype v
                    = Null
                    | Fetch of int * string
                    | Num of int
                    | String of string
                    | AllocTuple of {numFields: int}
                    | Prim of PrimOp.t * string list
                    | AllocTag of {tag: int}

                  datatype t
                    = Bind of {var: string, binding: v}
                    | Init of {dst: string, index: int, src: string} (* dst[index] = src *)
              end
              
    structure Block:
              sig
                  datatype exp
                    = Call of {func: string
                             , arg: string}
                    | If0 of {cond: string
                            , thenn: t
                            , elsee: t}
                    | Case of {cond: string
                             , thenarg: string
                             , thenn: t
                             , elsearg: string
                             , elsee: t}
                    | Exit of string
                  and t
                    = Block of {bindings: Binding.t list, exp: exp}
              end

    structure Function:
              sig
                  datatype t
                    = T of {name: string
                          , arg: string
                          , bindings: Binding.t list
                          , body: Block.t}
              end

    structure Program:
              sig
                  datatype t
                    = T of {main: Function.t
                          , funcs: Function.t list}

                  val dump2file: t * string -> unit
              end
end
