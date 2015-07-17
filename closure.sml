structure Closure: CLOSURE =
struct

exception NoRule

(*util*)
val out: TextIO.outstream option ref = ref NONE
fun print (s) =
    case !out 
     of SOME out' => 
        TextIO.output(out', s)
      | NONE => 
        TextIO.output(TextIO.stdOut, s)

structure PrimOp =
struct
datatype t 
  = Print
  | Add
  | Sub
  | Times
  | Int2String
    
fun pp t = 
    case t 
     of Add => print "+"
      | Sub => print "-"
      | Times => print "*"
      | Print => print "print"
      | Int2String => print "Int2String"
end               

datatype t
  = LetVal of {name: string, value: v , body: t}
  | Let of {name: string, index: int, tuple: string, body: t} 
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
                    
(*util*)
fun printSpace (t: int) =
    if 0 = t
    then ()
    else let val _ = print "    "
         in printSpace (t-1)
         end

fun printArgs (l: string list) =
    (*print something like "a,b,c" *)
    case l
     of [] => ()
      | x::[] => print x
      | x::xs => 
        let val _ = print x
            val _ = print(", ")
        in printArgs xs
        end


(*Task3: finish function ppv to print a value,
 finish function pp0 to pretty print a term.
 Also print the free variables stored in the syntax tree.*)
fun ppv (t: v, space : int) =
    case t
     of Empty =>
        let val _ = print "()" in () end
      | Num i =>
        print (Int.toString(i))
      | FuncVal {env, cont, arg, fbody, freevars} =>
        let val _ = print ("fn ("^env^", "^cont^", "^arg^ ") => \n") 
            val _ = pp0 (fbody, space +1)
            val _ = print "\n"
            val _ = printSpace space
            val _ = print "freevars=["
            val _ = List.app (fn x => (print x; print ", ")) freevars
            val _ = print "]\n"    
        in () 
        end
      | String(s) => 
            print ("\"" ^ s ^ "\"")
      | Tuple(l) => 
        let val _ = print "[" 
            val _ = printArgs(l)
            val _ = print "]"
        in ()
        end
      | Tag{label,name} =>
        let val _ = print "In"
            val _ = print (Int.toString label)
            val _ = print (" " ^ name)
        in () 
        end

and pp0 (t: t, space: int) =
    case t
     of LetVal{name, value, body} =>
        let val _ = printSpace space
            val _ = print ("let val " ^ name ^ " = ")
            val _ = ppv (value, space +1)
            val _ = print "\n"
            val _ = printSpace space
            val _ = print "in\n"
            val _ = pp0 (body, space +1)
            val _ = printSpace space
            val _ = print "end\n"
        in ()
        end
      | Let{name, index, tuple, body} =>
        let val _ = printSpace space
            val _ = print ("let val " ^ name ^ " = #")
            val _ = print (Int.toString index)
            val _ = print (" " ^ tuple ^ "\n")
            val _ = printSpace space
            val _ = print ("in\n")
            val _ = pp0 (body, space +1)
            val _ = print "\n"
            val _ = printSpace space
            val _ = print "end\n"
        in ()
        end
      | LetCont{cont, env, arg, fbody, body, freevars} =>
        let val _ = printSpace space
            val _ = print ("let fun " ^ cont ^ " (" ^ env ^ ", " ^ arg ^ ") =\n")
            val _ = pp0 (fbody, space +1)
            val _ = print "\n"
            val _ = printSpace space
            val _ = print "in\n"
            val _ = pp0 (body, space +1)
            val _ = print "\n"
            val _ = printSpace space
            val _ = print "end\n" 
        in ()
        end
      | ContApp{cont, env, arg} =>
        let val _ = printSpace space
            val _ = print (cont ^ " (" ^ env ^ ", " ^ arg ^ ")\n")
        in ()
        end       
      | FuncApp{func, cont, env, arg} =>
        let val _ = printSpace space
            val _ = print (func ^ " (" ^ cont ^ ", " ^ env ^ ", " ^ arg ^ ")\n")
        in () 
        end
      | Case{cond, thenarg, thenn, elsearg, elsee} =>
        let val _ = printSpace space
            val _ = print ("case " ^ cond ^ " of In1 " ^ thenarg ^ " => ") 
            val _ = pp0(thenn, space + 1) 
            val _ = print("| In2 " ^ elsearg ^ " => " )
            val _ = pp0(elsee, space+1)
        in ()
        end
      | LetPrim{name, opr, args, body} =>
        let val _ = printSpace space
            val _ = print ("let val " ^ name ^ " = ")
        in  (case opr
              of PrimOp.Print => (case args
                                    of x::[] => 
                                                 (print (" print " ^ x);
                                                  print("\n in\n");
                                                  pp0 (body, space +1);
                                                  print "\n";
                                                  printSpace space;
                                                  print "end\n"))
              | PrimOp.Int2String => (case args
                                        of x::[] => 
                                            (print (" Int2String " ^ x);
                                             print("\n in\n");
                                             pp0 (body, space +1);
                                             print "\n";
                                             printSpace space;
                                             print "end\n"))
              | PrimOp.Add => (case args
                        of y::ys => 
                             (print y; 
                              PrimOp.pp(opr); 
                              printArgs(ys);
                              print("\n in\n");
                              pp0 (body, space +1);
                              print "\n";
                              printSpace space;
                              print "end\n"))
              | PrimOp.Sub => (case args
                        of y::ys => 
                             (print y; 
                              PrimOp.pp(opr); 
                              printArgs(ys);
                              print("\n in\n");
                              pp0 (body, space +1);
                              print "\n";
                              printSpace space;
                              print "end\n"))
              | PrimOp.Times => (case args
                          of y::ys => 
                               (print y; 
                                PrimOp.pp(opr); 
                                printArgs(ys);
                                print("\n in\n");
                                pp0 (body, space +1);
                                print "\n";
                                printSpace space;
                                print "end\n")))
        end
      | If0{cond, thenn, elsee} =>
        let val _ = printSpace space
            val _ = print ("if " ^ cond ^ "= 0 then ")
            val _ = pp0(thenn, space+1)
            val _ = print (" else ")
            val _ = pp0(elsee, space+1)
            val _ = print "\n"
        in ()
        end 
      | LetFix{func,env,cont,arg,fbody,body,freevars} =>
        let val _ = printSpace space
            val _ = print ("let fun " ^ func ^ "("^ cont ^", "^env^", "^arg^") = (\n")
            val _ = pp0 (fbody, space +1)
            val _ = printSpace (space+1)
            val _ = print ")\n"
            val _ = printSpace space
            val _ = print ("in\n")
            val _ = pp0 (body, space +1)
            val _ = print "\n"
            val _ = printSpace space
            val _ = print "end\n"
        in ()
        end       
      | Exit x => 
        let val _ = printSpace space
        in print ("exit " ^ x^"\n")
        end

fun pp ( t) = 
    let val _ = out := NONE
    in  pp0(t, 0)
    end

fun dump2file (t: t, fname: string) =
    let val out' = TextIO.openOut (fname)
        val _ = out:= SOME out'
        val _ = TextIO.output(out',"datatype ('a, 'b) s = In1 of 'a | In2 of 'b\n")
        val _ = TextIO.output(out',"fun exit x = ()\n")
        val _ = TextIO.output(out', "val cps_code =\n")
        val _ = pp0(t, 0)
        val _ = TextIO.flushOut (out')
        val _ = out := NONE
        val _ = TextIO.closeOut(out')
    in ()
    end

end

