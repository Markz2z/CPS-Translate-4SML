structure CpsConvert: CPS_CONVERT =
struct

exception NoRule

val counter1 = ref 1
fun freshCont ()=
    let val n = !counter1
        val _ = counter1 :=(n+1)
    in "k_"^(Int.toString (n))
    end

val counter2 = ref 1
fun freshVal ()=
    let val n = !counter2
        val _ = counter2 :=(n+1)
    in "x_"^(Int.toString (n))
    end

fun transo (option: MLAst.PrimOp.t): Cps.PrimOp.t =
    case option 
     of MLAst.PrimOp.Add => Cps.PrimOp.Add
      | MLAst.PrimOp.Sub => Cps.PrimOp.Sub
      | MLAst.PrimOp.Times => Cps.PrimOp.Times
      | MLAst.PrimOp.Print => Cps.PrimOp.Print
      | MLAst.PrimOp.Int2String => Cps.PrimOp.Int2String

fun reverse(strs: string list,res: string list):string list =
  case strs
    of e::es => reverse(es,e::res)
     | [] => res

fun transTuple (ts: MLAst.t list, strs: string list, g: string list -> Cps.t): Cps.t =
     case ts
      of e::es => trans(e, fn x => transTuple(es,x::strs,g))
       | []    =>  g(reverse(strs,[]))

and trans (x: MLAst.t , k: string -> Cps.t) =
    case x of
        MLAst.Var v => k(v)
      | MLAst.Empty => 
        let val f = freshVal()
            in Cps.LetVal(f, Cps.Empty , k f)
        end
      | MLAst.Num i => 
        let val f = freshVal()
            in Cps.LetVal(f, Cps.Num(i) ,k f)
        end
      | MLAst.String str => 
        let val f = freshVal()
            in Cps.LetVal(f, Cps.String(str) , k f)
        end
      | MLAst.App(t1,t2) => 
        let val k1 = freshCont()
            val v = freshVal()
            val temp = fn z1 => trans(t2, fn z2 => Cps.LetCont(k1, v, k v, Cps.FuncApp(z1, k1, z2)))
            in trans(t1, temp)
        end
      | MLAst.Tuple(t) => 
        let val v = freshVal()
            in transTuple(t, [], fn l => Cps.LetVal(v, Cps.Tuple(l), k v))
        end
      | MLAst.Tag(i,t) => 
        let val v = freshVal()
            in 
            trans(t, fn z  => Cps.LetVal(v, Cps.Tag(i, z), k v))
        end
      | MLAst.Proj(i,t) =>
        let val v = freshVal()
            in 
            trans(t, fn z => Cps.Let(v, i, z, k v))
        end
      | MLAst.FuncVal(v,e) => 
        let val f = freshVal()
            val k1 = freshCont()
                in Cps.LetVal(f
                              , Cps.FuncVal(k1, v, trans(e 
                                                          ,fn z => 
                                                                  Cps.ContApp(k1, z)))
                                , k f)
        end
      | MLAst.LetVal(s,t1,t2) => 
        let val j = freshCont()
            val v = freshVal()
                in  Cps.LetCont(j, v, trans(t2, k), trans(t1, fn z => Cps.ContApp(j, z)))
        end
      | MLAst.Case(t1,s1,t2,s2,t3) => 
        let val k0 = freshCont()
            val x0 = freshVal()
            val k1 = freshCont()
            val x1 = freshVal()
            val k2 = freshCont()
            val x2 = freshVal()
            in trans(t1, fn z => 
                    Cps.LetCont(k0, x0, k x0, 
                           Cps.LetCont(k1, x1, trans(t2, fn z2 => Cps.ContApp(k0, z2)), 
                                  Cps.LetCont(k2, x2, trans(t3, fn z3 => Cps.ContApp(k0,z3)), Cps.Case(z,k1,k2))
                                      )
                               )
                    )
        end
      | MLAst.Prims(s1,l1) => 
        let val l2 = freshVal()
        in
          transTuple(l1, [], fn l3 => Cps.LetPrim(l2, transo(s1), l3, k l2))
        end
      | MLAst.LetFix(str1,str2,t1,t2) => 
        let val k1 = freshCont()
            val x1 = freshVal()
            in Cps.LetFix(str1, k1, str2, 
                              trans(t1, fn z => Cps.ContApp(k1,z)),
                                 trans(t2, k))
        end
      | MLAst.If0(t1,t2,t3) => 
        let val k0 = freshCont()
            val x0 = freshVal()
            val k1 = freshCont()
            val x1 = freshVal()
            val k2 = freshCont()
            val x2 = freshVal()
            in trans(t1, fn z0 => 
                  Cps.LetCont(k0,x0,k x0,
                        Cps.LetCont(k1,x1,trans(t2, fn z1 => Cps.ContApp(k0,z1)), 
                              Cps.LetCont(k2,x2,trans(t3, fn z2 => Cps.ContApp(k0,z2)),
                                          Cps.If0(z0,k1,k2)
                                         )
                                   )
                             ))
        end
     
end

