signature CPS_CONVERT =
sig

    val trans: MLAst.t * (string -> Cps.t) -> Cps.t

end
