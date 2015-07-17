datatype ('a, 'b) s = In1 of 'a | In2 of 'b
fun exit x = ()
val cps_code =
let val x_173 = fn (k_74, x) => 
        k_74 x


in
    let val x_174 = "hello"
    in
        let fun k_73 x_172 =
            exit x_172
        in
            x_173 (k_73, x_174)

        end

    end

end
