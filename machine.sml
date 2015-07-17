structure Machine: MACHINE =
struct

exception TODO 

val out: TextIO.outstream option ref = ref NONE
fun print (s) =
    case !out 
     of SOME out' => 
        TextIO.output(out', s)
      | NONE => 
        TextIO.output(TextIO.stdOut, s)

fun 'a printlist (l: 'a list, p: 'a->unit, sep: string, afterlast: bool) =
    let fun doit l =
            case l
             of [] => ()
              | [x] => (p x; if afterlast then print sep else ())
              | x::xs => (p x; print sep; doit xs)
    in  doit l
    end

structure PrimOp =
struct
datatype t
  = Add
  | Sub
  | Times
  | Print
  | Int2String
    
end (* Prim *)


structure Binding =
struct

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
             
fun convertString s =
    let fun doit (l, r) =
            case l
             of [] => r
              | (#"\n")::xs => doit (xs, (#"n")::(#"\\")::r)
              | x::xs => doit (xs, x::r)
    in  implode (rev (doit (explode s, [])))
    end

fun printArgs (l: string list) =
    case l
     of [] => ()
      | x::[] => print x
      | x::xs => 
        let val _ = print x
            val _ = print(", ")
        in printArgs xs
        end

(*Excercise 5, task 1.*)
fun dump2file' t =
    case t
     of Null => print "0"
      | String s => print (concat ["(int *)\"", convertString s, "\""])
      | Num i => print (Int.toString i)
      | Fetch(i, s) => print ("(int *) (" ^ "(int **)" ^ s ^ ")" ^ "[" ^ (Int.toString i) ^ "]")
      | AllocTuple {numFields} => print ("allocTuple(" ^ (Int.toString numFields) ^ ")")
      | AllocTag{tag} => print ("allocTag(" ^ (Int.toString tag) ^ ")")
      | Prim(opr, args) =>
        (case opr
              of PrimOp.Print => (case args
                                    of x::[] => 
                                                print (" ml_print(" ^ x ^ ");"))
              | PrimOp.Int2String => (case args
                                        of x::[] => 
                                            print (" ml_int2string(" ^ x ^ ");"))
              | PrimOp.Add => (case args
                        of y::ys => 
                             (print ("(int)" ^ y); 
                              print " + (int)"; 
                              printArgs(ys)))
              | PrimOp.Sub => (case args
                        of y::ys => 
                             (print y; 
                              print " - "; 
                              printArgs(ys)))
              | PrimOp.Times => (case args
                        of y::ys => 
                             (print y;
                              print " * "; 
                              printArgs(ys)))
            )

fun dump2file t =
    case t
     of Bind {var, binding} =>
        (print "int * "; print var; print " = "; dump2file' binding)
      | Init {dst, index, src} =>
        (print dst; print"[(int)"; print (Int.toString index); print "] = (int)"; print src)

end (* Binding *)



structure Block =
struct
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
            
(*Excercise 5, task 2.*)
fun dump2file' (e: exp) =
    case e
     of Exit x => (print "ml_exit ("; print x; print ");")
      | Call {func, arg} => print ("((void * (*)())" ^ func ^ ")(" ^ arg ^ ");")
      | If0 {cond,thenn,elsee} => (print ("if (" ^ cond ^ "=0)\n{"); dump2file(thenn); print ("}\nelse\n{"); dump2file(elsee); print"}")
      | Case {cond, thenarg, thenn, elsearg, elsee} => 
      (print ("if(" ^ cond ^ "[0]==1){\n"); print ("int *" ^ thenarg ^ " = (int *)(" ^ cond ^ "[1]);\n");
       dump2file(thenn); print "}\n"; 
       print ("  else if(" ^ cond ^ "[0]==2){\n");print ("int *" ^ elsearg ^ " = (int *)(" ^ cond ^ "[1]);\n"); 
       dump2file(elsee); print "}")

and dump2file (Block{bindings, exp}) =
    let val _ = printlist (bindings
                         , fn b => (print "  "; Binding.dump2file b)
                         , ";\n"
                         , true)
        val _ = print "\n  "
        val _ = dump2file' exp
        val _ = print "\n  "
    in ()
    end

end (* Block *)


structure Function =
struct

datatype t
  = T of {name: string
        , arg: string
        , bindings: Binding.t list
        , body: Block.t}

fun dump2file (T{name, arg, bindings, body}) =
    let val _ = print (String.concat ["void ", name, "("])
        val _ = if arg=""
                then () 
                else (print "void *"; print arg)
        val _ = print (")\n{\n")
        val _ = printlist (bindings
                         , fn b => (print "  "; Binding.dump2file b)
                         , ";\n"
                         , true)
        val _ = print "\n  "
        val _ = Block.dump2file body
        val _ = print "\n}\n\n"
    in  ()
    end 
end (* Function *)
         
structure Program =
struct

datatype t
  = T of {main: Function.t
        , funcs: Function.t list}
       
fun dumpincludes () =
    print "#include <stdio.h>\n#include <stdlib.h>\n#include \"runtime.h\"\n\n"

fun dumpmain () =
    print ("int main ()\n{\n  ml_main ();\n  return 0;\n}\n\n")

fun dump2file (T{main, funcs}, fname) =  
    let val out' = TextIO.openOut (fname)
        val _ = out:= SOME out'
        val _ = print "// Compiler auto-generated.\n\n"
        val _ = dumpincludes()
        val _ = print ("void ml_exit (void *x)\n{\n  exit (0);\n}\n\n")
        val _ = printlist (funcs, Function.dump2file, "\n", true)
        val _ = Function.dump2file main
        val _ = dumpmain ()
        val _ = TextIO.flushOut (out')
        val _ = out := NONE
        val _ = TextIO.closeOut(out')
    in ()
    end

end (* Program *)

end (* Flat *)
