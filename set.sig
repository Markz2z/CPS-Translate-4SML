signature SET =
sig
    type t

    val new: unit -> t
    val add: string * t -> t
    val union: t * t -> t
    val remove: string * t -> t
    val toList: string list * t -> string list
    val addAll: string list * t -> t
    val printSet: t -> unit
end
