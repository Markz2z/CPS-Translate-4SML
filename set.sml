structure Set: SET =
struct

type t = string list

fun new () = []

fun contains (x, t) =
    case t
     of [] => false
      | y::ys =>
        if x=y
        then true
        else contains (x, ys)

fun add (x, t) =
    if contains (x, t)
    then t
    else x::t

fun union (t1, t2) =
    case t1
     of [] => t2
      | x::t =>
        if contains(x, t2)
        then union(t, t2)
        else union(t, add(x, t2))

fun remove (x, t) =
    case t
     of [] => t
      | y::ys =>
        if y=x
        then ys
        else y::remove(x, ys)

fun printSet(x: t) =
    case x
     of [] => print ""
      | y::ys => (print (y ^ " "); printSet(ys)) 

fun toList(l:string list, t: t) =
    case t
      of [] => l
      | y::ys => toList(y::l, ys)

fun addAll (l:string list, t: t) = l@t
  (* case l 
    of [] => t
     | x::xs => addAll(xs, add(x, t))*)

end
