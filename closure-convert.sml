structure ClosureConvert: CLOSURE_CONVERT =
struct

open Temp

fun transOpt (opt:Cps.PrimOp.t):Closure.PrimOp.t =
    case opt
     of Cps.PrimOp.Add => Closure.PrimOp.Add
      | Cps.PrimOp.Sub => Closure.PrimOp.Sub
      | Cps.PrimOp.Times => Closure.PrimOp.Times
      | Cps.PrimOp.Print => Closure.PrimOp.Print
      | Cps.PrimOp.Int2String => Closure.PrimOp.Int2String

val counter7 = ref 1
fun freshEnv ()=
    let val n = !counter7
        val _ = counter7 :=(n+1)
    in "e_"^(Int.toString (n))
    end

(*Task1: finish the function freeVarTerm and freeVarValue 
to  calulate free variables and store some results in AST. *)
fun freeVarTerm (t: Cps.t): Closure.t * Set.t =
    case t
     of Cps.LetVal(x, v, t) =>
        (let val (v', set1) = freeVarValue v
             val (t', set2) = freeVarTerm t
             val set = Set.union(set1,
                                 Set.remove(x, set2))
        in (Closure.LetVal{name=x, value=v', body=t'}, set)
        end)
      | Cps.Exit x =>
        (Closure.Exit(x), Set.add(x, Set.new()))
      | Cps.Let(str1, i, str2, t) => 
      	let val (t', set1) = freeVarTerm t;
      		  val set = Set.add(str2,
                                Set.remove(str1, set1))   
      	in  (Closure.Let{name=str1, index=i, tuple=str2, body=t'}, set)
      	end
      | Cps.LetCont(k,s,t1,t2) =>
      	let val (t3, set1) = freeVarTerm t1
        		val (t4, set2) = freeVarTerm t2
        		val set = Set.union(Set.remove(s, set1), Set.remove(k, set2))
        		val e = freshEnv()
      	in  (Closure.LetCont{cont=k, env=e, arg=s, fbody=t3, body=t4, freevars=Set.toList([],set)}, set)
      	end
      | Cps.ContApp(k, s) => 
      	let val set1 = Set.add(k, Set.new())
            val set2 = Set.add(s, Set.new())
      		  val e = freshEnv()
            val k_code = freshCont()
        in  (Closure.Let{name=k_code, 
                       index=1, 
                       tuple=k, 
                       body=Closure.Let{name=e, 
                                        index=2, 
                                        tuple=k,
                                        body=Closure.ContApp{cont=k_code, 
                                                             env=e, 
                                                             arg=s}}
                      }, set2)
      	end
      | Cps.FuncApp(f,k,s)=>
      	let val set = Set.add(f, Set.add(k, Set.add(s, Set.new())))
      		  val e = freshEnv()
      	in (Closure.FuncApp{func=f, cont=k, env=e, arg=s}, set)
      	end
      | Cps.Case(s,k1,k2) => 
      	(let val set = Set.add(s, Set.add(k1, Set.add(k2, Set.new())))
             val e1 = freshEnv()
             val e2 = freshEnv()
             val v1 = freshVal()
             val v2 = freshVal()
      	in (Closure.Case
              {cond=s,
               thenarg=v1,
               thenn=Closure.ContApp{cont=k1, env=e1, arg=v1},
               elsearg=v2,
               elsee=Closure.ContApp{cont=k2, env=e2, arg=v2}}, 
               set)
        end)
      | Cps.LetPrim(s1, opp, l, t) => 
        let val (t', set1) = freeVarTerm t;
            val set2 = Set.addAll(l, Set.new());
            val set = Set.union(Set.remove(s1, set1), set2);
        in (Closure.LetPrim{name=s1, opr=transOpt(opp), args=l, body=t'}, set)
        end
      | Cps.If0(s,k1,k2) => 
        let val x1 = freshVal()
            val x2 = freshVal()
            val x3 = freshVal()
            val e1 = freshEnv()
            val e2 = freshEnv()
            val set = Set.add(s, Set.add(k1, Set.add(k2, Set.new())))
        in (Closure.LetVal{name=x3, 
                          value=Closure.Empty,
                          body=Closure.If0{ cond=s,
                                            thenn=Closure.ContApp{cont=k1, env=e1, arg=x1}, 
                                            elsee=Closure.ContApp{cont=k2, env=e2, arg=x2}}}, set)
        end
      | Cps.LetFix(f ,k ,s ,t1 ,t2) => 
        let val (t3, set1) = freeVarTerm t1
            val (t4, set2) = freeVarTerm t2
            val set = Set.union(Set.remove(f, Set.remove(k, Set.remove(s,set1))) ,Set.remove(f, set2))
            val e = freshEnv()
        in (Closure.LetFix{func=f, env=e, cont=k, arg=s, fbody=t3, body=t4, freevars=Set.toList([],set)}, set)
        end

and freeVarValue (v: Cps.v): Closure.v * Set.t =
    case v
     of Cps.Empty => (Closure.Empty, Set.new())
      | Cps.Num i => (Closure.Num(i), Set.new())
      | Cps.String x => 
        (Closure.String(x), Set.new())
      | Cps.Tuple(t) => (Closure.Tuple(t), Set.addAll(t, Set.new()))
      | Cps.Tag(i, s) => (Closure.Tag{label=i, name=s}, Set.add(s, Set.new()))
      | Cps.FuncVal(k,s,t) => 
      (let val (t', set) = freeVarTerm t
           val set1 = Set.remove(k, set)
           val set2 = Set.remove(s, set1)
           val e = freshEnv()
      in
      (Closure.FuncVal{env=e, cont=k, arg=s, fbody=t', freevars=Set.toList([],set2)}, set2)
      end)
                     
fun doit(t:Closure.t, n: int, env:string, xs:string list) =
    (*unfold all free vars in xs*)
    case xs
     of [] => convert t
      | x::xss =>
        Closure.Let{name=x, index=n, tuple=env
                  , body=doit (t, n+1, env, xss)}

(*Task2: finish be below function to perform the 
actual closure conversion*)
and convert(t:Closure.t):Closure.t =
    case t
     of Closure.LetVal{name
                     , value=Closure.FuncVal{env, cont
                                           , arg, fbody, freevars}
                     , body}=>
        (*let val x = fn env k y => t1
          in t2 *)
        let val x_code = freshVal ()
            val env' = freshEnv()
        in Closure.LetVal{name=x_code
                        (*release all the free variable*)
                        ,value=Closure.FuncVal{env=env, cont=cont, arg=arg
                                       , fbody=doit(fbody, 1, env, freevars)
                                       , freevars=[]}
                         (**)
                        ,body=Closure.LetVal{ name=env'
                                       ,value=Closure.Tuple(freevars)
                                       ,body=Closure.LetVal{name=name
                                                     ,value=Closure.Tuple [x_code, env']
                                                     ,body=convert body}}}
        end 
      | Closure.LetVal{name, value , body} => (*v: not FuncVal*) 
        Closure.LetVal{name=name, value=value , body=convert(body)}
      | Closure.Let{name, index, tuple, body} =>
        Closure.Let{name=name, index=index, tuple=tuple, body=convert(body)}
      | Closure.LetCont{cont, env, arg, fbody, body, freevars} =>
        let val k_code = freshCont()
            val env' = freshEnv()
            val contt = cont
        in Closure.LetCont{cont=k_code, env=env, arg=arg,
                           fbody=doit(fbody, 1, env, freevars),
                           body=Closure.LetVal{name=env', 
                                               value=Closure.Tuple(freevars),
                                               body=Closure.LetVal{name=contt,
                                                                   value=Closure.Tuple[k_code, env'], 
                                                                   body=convert(body)}},
                           freevars=[]}
        end
      | Closure.ContApp{cont, env, arg} =>
        Closure.ContApp{cont=cont, env=env, arg=arg}
        (*let val k_code = freshCont()
            val env' = freshEnv()
        in Closure.Let{name=k_code, 
                       index=1, 
                       tuple=cont, 
                       body=Closure.Let{name=env', 
                                        index=2, 
                                        tuple=cont,
                                        body=Closure.ContApp{cont=k_code, 
                                                             env=env', 
                                                             arg=arg}}
                      }
        end*)
      | Closure.FuncApp{func,cont,env,arg} =>
        let val f_code = freshVal()
        in  Closure.Let{name=f_code, index=1, tuple=func,
                       body=Closure.Let{name=env, index=2, tuple=func, 
                                        body=Closure.FuncApp{func=f_code, cont=cont, env=env, arg=arg}}}
        end
      | Closure.Case{cond, thenarg, thenn, elsearg, elsee} =>
        Closure.Case{cond=cond, thenarg=thenarg, thenn=convert(thenn), elsearg=elsearg, elsee=convert(elsee)}
      | Closure.LetPrim{name,opr,args,body} =>
        Closure.LetPrim{name=name,opr=opr,args=args,body=convert(body)}
      | Closure.If0{cond, thenn, elsee} =>
        (Closure.If0{ cond=cond,
                      thenn=convert(thenn), 
                      elsee=convert(elsee)})
      | Closure.LetFix{func, env, cont, arg, fbody, body, freevars} =>
        let val f_code = freshVal()
            val env' = freshEnv()
        in Closure.LetFix{func=f_code, 
                          env=env, 
                          cont=cont, 
                          arg=arg,
                          fbody=Closure.LetVal{name=func,
                                               value=Closure.Tuple [f_code, env],
                                               body=doit(fbody, 1, env, freevars)},
                          body=Closure.LetVal{name=env', 
                                              value=Closure.Tuple(freevars), 
                                              body=Closure.LetVal{name=func,
                                                                  value=Closure.Tuple[f_code, env'],
                                                                  body=convert(body)}},
                          freevars=[]}
        end
      | Closure.Exit(x)=> Closure.Exit(x)

fun trans t =
    let val (t1, set) = freeVarTerm (t)
        val t2 = convert t1
        (*val l = Set.toList([],set)*)
    in t2
    end
                    

end

