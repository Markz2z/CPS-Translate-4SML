structure Codegen: CODEGEN =
struct

exception TODO

fun transOperator t =
    case t
     of Flat.PrimOp.Add => Machine.PrimOp.Add
      | Flat.PrimOp.Sub => Machine.PrimOp.Sub
      | Flat.PrimOp.Times => Machine.PrimOp.Times
      | Flat.PrimOp.Print => Machine.PrimOp.Print
      | Flat.PrimOp.Int2String => Machine.PrimOp.Int2String

fun funLength (lis:(string list), len) =
    case lis
     of e::es => funLength (es, len+1)
      | [] => len

val counter5 = ref 0
fun freshVall ()=
    let val n = !counter5
        val _ = counter5 :=(n+1)
    in "z_"^(Int.toString (n))
    end

fun funArgInit (dst, args, acc, index) =
    case args
     of [] => acc
      | x::xs => 
        funArgInit (dst
                  , xs
                  , (Machine.Binding.Init{dst = dst
                                        , index = index
                                        , src = x})::acc
                  , index+1)

(*Exercise 3, task 1*)
fun transExp (t: Flat.Exp.t): Machine.Block.t =
    case t
     of Flat.Exp.Exit x => 
        Machine.Block.Block{ bindings = []
                           , exp = Machine.Block.Exit x}
      | Flat.Exp.Call{func: string
                             , args: string list} =>
                          let val len = funLength(args, 0)
                              val z = freshVall ()
                          in( Machine.Block.Block{ bindings = 
                                                  (Machine.Binding.Bind{ var = z, 
                                                   binding = Machine.Binding.AllocTuple{ numFields=len }} )::
                                                   funArgInit(z, args, [], 1),
                                                   exp = Machine.Block.Call{ func = func, 
                                                                              arg = z }
                                                 })
                          end 
      | Flat.Exp.If0{cond, thenn, elsee} =>
        Machine.Block.Block{ bindings = []
                           , exp = Machine.Block.If0{cond = cond,
                                                     thenn = transExp(thenn),
                                                     elsee = transExp(elsee) }}
      | Flat.Exp.Case{cond, thenarg, thenn, elsearg, elsee} =>
        Machine.Block.Block{ bindings = []
                           , exp = Machine.Block.Case{cond = cond,
                                                      thenarg = thenarg,
                                                      thenn = transExp(thenn),
                                                      elsearg = elsearg,
                                                      elsee = transExp(elsee) }}

fun reverse (l, res) =
    case l
     of x::xs => reverse(xs,x::res)
      | [] => res

fun addInit (dst, args, acc, index) =
    case args
     of [] => acc
      | x::xs => 
        addInit (dst
               , xs
               , (Machine.Binding.Init {dst = dst
                                      , index = index
                                      , src = x})::acc
               , index+1)

(*Exercise 3, task 2*)        
fun transOneBinding ((x, b), acc) =
    case b
     of Flat.Binding.Empty => 
        (Machine.Binding.Bind {var = x
                            , binding = Machine.Binding.Null})::acc
      | Flat.Binding.Num(i) =>
        (Machine.Binding.Bind {var = x,
                              binding = Machine.Binding.Num(i)})::acc
      | Flat.Binding.String(s) =>
        (Machine.Binding.Bind {var = x,
                              binding = Machine.Binding.String(s)})::acc      
      | Flat.Binding.Proj(i, s) =>
        (Machine.Binding.Bind {var = x,
                              binding = Machine.Binding.Fetch(i, s)})::acc   
      | Flat.Binding.Prim(t, l) =>
        let val opp = transOperator(t)
        in
        (Machine.Binding.Bind{var = x, 
                              binding = Machine.Binding.Prim(opp, l)})::acc
        end
      | Flat.Binding.Tag(i, s) =>
        let val v = Machine.Binding.Init{dst=x, index=i, src=s}
            val acc = Machine.Binding.Bind {var = x, binding = Machine.Binding.AllocTag{tag=i} }::acc
        in
        v::acc
        end     
      | Flat.Binding.Tuple(l) =>
        let val len = funLength(l,0)
            val y = Machine.Binding.Bind {var = x, binding = Machine.Binding.AllocTuple{numFields=len} }
            val xx = y::addInit(x, l, [], 1)
            val z = reverse(xx, [])
        in  
        z@acc
        end

fun transBindings(l, acc) =
    case l
     of [] => reverse(acc, [])
      | x::xs => transBindings (xs, transOneBinding (x, acc))

fun fetchArgs (newArg, l, r, index) =
    case l
     of [] => r
      | x::xs => 
        fetchArgs (newArg
                 , xs
                 , Machine.Binding.Bind {var = x,  
                                             binding = Machine.Binding.Fetch(index, newArg)}::r
                 , index+1)

(*Exercise 3, task 3*)
fun transFunction (Flat.Function.T {name
                                  , args
                                  , bindings
                                  , body}) =
                  let val len = funLength(args,0)
                      val ar = freshVall()
                  in
                  (Machine.Function.T { name = name,
                                        arg = ar,
                                        bindings = (fetchArgs(ar, args, [], 1))@transBindings(bindings, []),
                                        body = transExp(body)
                  })
                  end                  

fun transMain (Flat.Function.T {name
                              , args
                              , bindings
                              , body}) =
    let val newBind = transBindings (bindings, [])
        val newBindings = reverse(newBind,[])
    in  Machine.Function.T {name = name
                          , arg = (case args
                                    of [] => ""
                                     | _ => raise Fail "bug")
                          , bindings = rev newBindings
                          , body = transExp body}
    end

fun transProgram (Flat.Program.T{funcs, main}) =
    Machine.Program.T 
        {funcs = List.map transFunction funcs
       , main = transMain main}

fun trans (t) =
    transProgram t

end
