structure Cps: CPS =
struct

type cont = string
type func = string

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
      | _ => raise NoRule
end               
 
datatype t
  = LetVal of string * v * t 
  | Let of string * int * string * t 
  | LetCont of cont * string * t * t  
  | ContApp of cont * string   
  | FuncApp of func * cont * string  
  | Case of string * cont * cont  
  | LetPrim of string * PrimOp.t * string list * t
  | If0 of string *  cont * cont
  | LetFix of func * cont * string * t * t 
  | Exit of string  
     and v
       = Empty
       | Num of int
       | String of string 
       | Tuple of string list 
       | Tag of int * string  
       | FuncVal of cont * string * t

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

fun dumpv (t: v, space : int) =
    case t
     of Empty => print "()"
      | Num i => print (Int.toString(i))
      | String s =>
        let val _ = print ("\""^s^"\"") in () end
      | Tuple l =>
        let val _ = print("(")
            val _ = printArgs l;
        in print(")")
        end
      | Tag (l, x) =>
        let val _ = print "In"
            val _ = print (Int.toString l)
            val _ = print (" " ^ x)
        in () 
        end
      | FuncVal (k, x, tBody) =>
        let val _ = print ("fn (" ^ k ^", " ^ x ^ ") => \n")
            val _ = dumpt (tBody, space +1)
            val _ = print "\n"
        in () 
        end


and dumpt (t: t, space: int) =
    (*print with indent*)
    case t
     of LetVal(x, vBody, tBody) =>
        let val _ = printSpace space
            val _ = print ("let val " ^ x ^ " = ")
            val _ = dumpv (vBody, space +1)
            val _ = print "\n"
            val _ = printSpace space
            val _ = print "in\n"
            val _ = dumpt (tBody, space +1)
            val _ = print "\n"
            val _ = printSpace space
            val _ = print "end\n"
        in ()
        end
      | Let(x, l, y, tBody) =>
        let val _ = printSpace space
            val _ = print ("let val " ^ x ^ " = #")
            val _ = print (Int.toString l)
            val _ = print (" " ^ y ^ "\n")
            val _ = printSpace space
            val _ = print ("in\n")
            val _ = dumpt (tBody, space +1)
            val _ = print "\n"
            val _ = printSpace space
            val _ = print "end\n"
        in ()
        end
      | LetCont(k, x, letBody, inBody) =>
        let val _ = printSpace space
            val _ = print ("let fun " ^ k ^ " " ^ x ^ " =\n")
            val _ = dumpt (letBody, space +1)
            val _ = print "\n"
            val _ = printSpace space
            val _ = print "in\n"
            val _ = dumpt (inBody, space +1)
            val _ = print "\n"
            val _ = printSpace space
            val _ = print "end\n" 
        in ()
        end
      | ContApp(k, x) =>
        let val _ = printSpace space
            val _ = print (k ^ " " ^ x ^ "\n")
        in ()
        end
      | FuncApp(f, k, x) =>
        let val _ = printSpace space
            val _ = print (f ^ " (" ^ k ^ ", " ^ x ^ ")\n")
        in () end
      | Case(x, k1, k2) =>
        let val _ = printSpace space
            val _ = print ("case " ^ x ^ " of In1 z1 => " ^ k1 ^ " z1 | In2 z2 => " ^ k2 ^ " z2\n")
        in ()
        end
      | Exit x => 
        let val _ = printSpace space
        in print ("exit " ^ x)
        end
      | LetPrim (x, PrimOp.Print, [s], t) =>
        let val _ = printSpace space
            val _ = print ("let val " ^ x ^ " = print "^s^"\n in\n")
            val _ = dumpt (t, space +1)
            val _ = print "\n"
            val _ = printSpace space
            val _ = print "end\n"
        in ()
        end
      | LetPrim (x, option, [x1, x2], t) =>
        let val _ = printSpace space
            val _ = print ("let val " ^ x ^ " = "^x1)
            val _ = PrimOp.pp option
            val _ = print (x2^"\n")
            val _ = printSpace space
            val _ = print ("in\n")
            val _ = dumpt (t, space +1)
            val _ = print "\n"
            val _ = printSpace space
            val _ = print "end\n"
        in ()
        end
      | LetFix (f, k, x, fbody, e) =>
        let val _ = printSpace space
            val _ = print ("let fun " ^ f ^ "("^k^", "^x^") = (\n")
            val _ = dumpt (fbody, space +1)
            val _ = printSpace (space+1)
            val _ = print ")\n"
            val _ = printSpace space
            val _ = print ("in\n")
            val _ = dumpt (e, space +1)
            val _ = print "\n"
            val _ = printSpace space
            val _ = print "end\n"
        in ()
        end
      | If0 (x, k1, k2) =>
        let val _ = printSpace space
            val _ = print ("if " ^ x ^ "= 0 then " ^ k1 ^ "() else " ^ k2 ^ "()\n")
        in ()
        end
      | LetPrim (x, PrimOp.Int2String, [s], t) =>
        let val _ = printSpace space
            val _ = print ("let val " ^ x ^ " = Int.toString "^s^"\n in\n")
            val _ = dumpt (t, space +1)
            val _ = print "\n"
            val _ = printSpace space
            val _ = print "end\n"
        in ()
        end
      | _ => raise NoRule


fun pp ( t) = 
    let val _ = out := NONE
    in  dumpt(t, 0)
    end

fun dump2file (t: t, fname: string) =
    let val out' = TextIO.openOut (fname)
        val _ = out:= SOME out'
        val _ = print ("datatype ('a, 'b) s = In1 of 'a | In2 of 'b\n")
        val _ = print ("fun exit x = ()\n")
        val _ = print ("val cps_code =\n")
        val _ = dumpt(t, 0)
        val _ = TextIO.flushOut (out')
        val _ = out := NONE
        val _ = TextIO.closeOut(out')
    in ()
    end

end

