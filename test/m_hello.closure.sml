datatype ('a, 'b) s = In1 of 'a | In2 of 'b
fun exit x = ()
val cps_code =
let val x_152 = "hello, world
"
in
    let val x_151 =  print x_152
 in
        exit x_151

    end
end
