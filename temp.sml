functor TempGen (val prefix: string) =
struct

val counter = ref 0
fun fresh ()=
    let val n = !counter
        val _ = counter :=(n+1)
    in String.concat [prefix, "_", Int.toString (n)]
    end
end (* functor TempGen *)

structure TempCont = TempGen (val prefix="k")
structure TempEnv = TempGen (val prefix="env")
structure TempVal = TempGen (val prefix="x")

structure Temp:> TEMP =
struct

val freshCont = TempCont.fresh
val freshEnv = TempEnv.fresh
val freshVal = TempVal.fresh
end (* Temp *)
