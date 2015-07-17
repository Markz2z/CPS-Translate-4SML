datatype ('a, 'b) s = In1 of 'a | In2 of 'b
fun exit x = ()
val cps_code =
let val x_175 = fn (k_75, x) => 
        let val x_176 = fn (k_76, y) => 
                k_76 x


        in
            k_75 x_176

        end


in
    exit x_175
end
