datatype ('a, 'b) s = In1 of 'a | In2 of 'b
fun exit x = ()
val cps_code =
let val x_165 = "z"
in
    let val x_164 = In1 x_165
    in
        let fun k_70 x_161 =
            exit x_161
        in
            let fun k_71 x_162 =
                let val x_167 = "A"
                in
                    let val x_168 = "AA"
                    in
                        let val x_166 = (x_167, x_168)
                        in
                            k_70 x_166

                        end

                    end

                end

            in
                let fun k_72 x_163 =
                    let val x_170 = "B"
                    in
                        let val x_171 = "BB"
                        in
                            let val x_169 = (x_170, x_171)
                            in
                                k_70 x_169

                            end

                        end

                    end

                in
                    case x_164 of In1 z1 => k_71 z1 | In2 z2 => k_72 z2

                end

            end

        end

    end

end
