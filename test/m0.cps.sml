datatype ('a, 'b) s = In1 of 'a | In2 of 'b
fun exit x = ()
val cps_code =
let val x_153 = fn (k_67, x) => 
        let val x_154 = 99
        in
            k_67 x_154

        end


in
    exit x_153
end
