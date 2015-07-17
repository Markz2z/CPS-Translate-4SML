structure MLAst: ML_AST =
struct
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
end

datatype t
  = Var of string
  | Empty 
  | Num of int
  | String of string
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

exception TODO

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

fun printList (l: t list) =
    (*print something like "t1,t2,t3" *)
    case l
     of [] => ()
      | x::[] => dumpt x
      | x::xs => 
        let val _ = dumpt x
            val _ = print(", ")
        in printList xs
        end

and dumpt t =
    case t
     of Var (x) => print(x)
      | Empty => print "()"
      | Num (x) => print(Int.toString x)
      | String (x) => print("\"x\"")
      | App(t1,t2) => (dumpt t1; print "("; dumpt t2; print ")")
      | FuncVal(x,e) => (print "fn "; print x; print " => "; dumpt e)
      | Tag(x,e) => (print "In"; print (Int.toString x); print " "; dumpt e)
      | LetVal(x,t1,t2) => (print "let val "; print x; print " = "; dumpt t1; print " in "; dumpt t2; print " end")
      | Tuple t => (print "("; printList t; print ")")
      | Proj(x,t) => (print "#"; print(Int.toString x); print " "; dumpt t)
      | Case(t1,s1,t2,s2,t3) => (print " case "; dumpt t1; print " of in"; print s1; print " => "; dumpt t2; print " | in"; print s2; print " => "; dumpt t3)
      | If0(t1,t2,t3) => (print " if "; dumpt t1;  print"=0 ";print " then "; dumpt t2; print " else "; dumpt t3)
      | LetFix(s1,s2,t1,t2) => (print " let fun "; print s1; print " "; print s2; print " = "; dumpt t1; print " in "; dumpt t2; print " end ")
      | Prims(s1,l1) => case s1
                					of PrimOp.Print => (case l1
                								               of x::[] => (print " print "; dumpt x))
                					 | PrimOp.Int2String => (case l1
                								                    of x::[] => (print " Int2String "; dumpt x))
                					 | PrimOp.Add => (case l1
          								  	               of x::xs => (dumpt x; print " + "; printList xs))
          						     | PrimOp.Sub => (case l1
          									                 of x::xs => (dumpt x; print " - "; printList xs))
                					 | PrimOp.Times => (case l1
          									                   of x::xs => (dumpt x; print " * "; printList xs))
									     


fun dump2file (t: t, fname: string) =
    let val out' = TextIO.openOut (fname)
        val _ = out:= SOME out'
        val _ = print("datatype ('a, 'b) s = In1 of 'a | In2 of 'b\n")
        val _ = print("val ml_code = ")
        val _ = dumpt(t)
        val _ = TextIO.flushOut (out')
        val _ = TextIO.closeOut(out')
    in ()
    end

fun pp (t: t) =
let val _ = out:= NONE
    val _ = dumpt(t)
    in print "\n"
    end
end
