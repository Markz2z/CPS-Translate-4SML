signature TEMP =
sig
    val freshCont: unit -> string
    val freshEnv: unit -> string
    val freshVal: unit -> string
end
