structure Flat: FLAT =
struct

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

structure Exp =
struct
datatype t
  = Call of {func: string
           , args: string list}
  | If0 of {cond: string
          , thenn: t
          , elsee: t}
  | Case of {cond: string
           , thenarg: string
           , thenn: t
           , elsearg: string
           , elsee: t} (*keep x1&x2 for now*)
  | Exit of string

fun dump2file (t) = (*Exercise 2, task 2*)
    case t
     of Call {func, args} =>
       ( print func
       ; print " ("
       ; printlist (args, print, ", ", false)
       ; print ")")
      | If0 {cond, thenn, elsee} =>
      ( print (" if " ^ cond ^ " = 0 then "); 
        dump2file (thenn);
        dump2file (elsee))
      | Case {cond, thenarg, thenn, elsearg, elsee} =>
      ( print ("case " ^ cond ^ " of In1 " ^ thenarg ^ " => "); 
        dump2file (thenn);
        print(" | In2 " ^ elsearg ^ " => " );
        dump2file (elsee))
      | Exit x => print "exit (0)"

end (* Exp *)

structure Binding =
struct

datatype t
  = Empty
  | Proj of int * string
  | Num of int
  | String of string
  | Tuple of string list
  | Prim of PrimOp.t * string list 
  | Tag of int * string            
             
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

fun dump2file t = (*Exercise 2, task 1*)
    case t
     of Empty => print "()"
      | Proj (i, x) => print (concat [ x, "[", Int.toString i, "]"])
      | String s => print (concat ["\"", convertString s, "\""])
      | Num (i) => print (Int.toString(i))
      | Tuple l => (print "["; printArgs l; print "]")
      | Tag(label, name) => 
        let val _ = print "In"
            val _ = print (Int.toString label)
            val _ = print (" " ^ name)
        in () 
        end
      | Prim(opr, args) => 
        (case opr
              of PrimOp.Print => (case args
                                    of x::[] => 
                                                print (" print " ^ x))
              | PrimOp.Int2String => (case args
                                        of x::[] => 
                                            print (" Int2String " ^ x))
              | PrimOp.Add => (case args
                        of y::ys => 
                             (print y; 
                              print " + "; 
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
end(* Binding *)

structure Function =
struct

datatype t
  = T of {name: string
        , args: string list
        , bindings: (string * Binding.t) list
        , body: Exp.t}

fun dump2file (T{name, args, bindings, body}) =
    let val _ = print (String.concat ["void ", name, "("])
        val _ = if List.length(args) = 0
                then ()
                else print ("void *")
        val _ = printlist (args, print, ", void *", false)
        val _ = print (")\n{\n")
        val _ = printlist (bindings
                         , (fn (x, b) => (print "  void *"
                                        ; print x
                                        ; print " = (void *)"
                                        ; Binding.dump2file b))
                         , ";\n"
                         , true)
        val _ = print "\n  "
        val _ = Exp.dump2file body
        val _ = print ";\n}\n\n"
    in  ()
    end 
end (* Function *)

structure Program =
struct

datatype t
  = T of {main: Function.t
        , funcs: Function.t list}
       
fun dump2file (T{main, funcs}, fname) =  
    let val out' = TextIO.openOut (fname)
        val _ = out:= SOME out'
        val _ = print "// Compiler auto-generated.\n\n"
        val _ = printlist (funcs, Function.dump2file, "\n", true)
        val _ = Function.dump2file main
        val _ = TextIO.flushOut (out')
        val _ = out := NONE
        val _ = TextIO.closeOut(out')
    in ()
    end

end (* Program *)

end (* Flat *)
