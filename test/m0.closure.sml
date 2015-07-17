datatype ('a, 'b) s = In1 of 'a | In2 of 'b
fun exit x = ()
val cps_code =
let val x_63 = fn (e_284, k_67, x) => 
        let val x_154 = 99
        in
            let val k_141 = #1 k_67
            in
                let val e_283 = #2 k_67
                in
                    let val k_142 = #1 k_141
                    in
                        let val e_286 = #2 k_141
                        in
                            k_142 (e_286, x_154)

                        end

                    end

                end

            end
        end

    freevars=[]

in
    let val e_285 = []
    in
        let val x_153 = [x_63, e_285]
        in
            exit x_153
        end
    end
end
