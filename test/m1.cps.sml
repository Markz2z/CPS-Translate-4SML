datatype ('a, 'b) s = In1 of 'a | In2 of 'b
fun exit x = ()
val cps_code =
let val x_156 = fn (k_69, x) => 
        let val x_157 = #1 x
        in
            k_69 x_157

        end


in
    let val x_159 = "a"
    in
        let val x_160 = "b"
        in
            let val x_158 = (x_159, x_160)
            in
                let fun k_68 x_155 =
                    exit x_155
                in
                    x_156 (k_68, x_158)

                end

            end

        end

    end

end
