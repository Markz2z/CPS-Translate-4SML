datatype ('a, 'b) s = In1 of 'a | In2 of 'b
fun exit x = ()
val cps_code =
let fun f(k_77, x) = (
    let fun k_78 x_178 =
        k_77 x_178

    in
        let fun k_79 x_179 =
            let val x_181 = 0
            in
                k_78 x_181

            end

        in
            let fun k_80 x_180 =
                let val x_185 = 1
                in
                    let val x_184 = x-x_185
                    in
                        let fun k_81 x_183 =
                            let val x_182 = x+x_183
                            in
                                k_78 x_182

                            end

                        in
                            f (k_81, x_184)

                        end

                    end

                end

            in
                if x= 0 then k_79() else k_80()

            end

        end

    end
    )
in
    let val x_187 = 100
    in
        let fun k_82 x_186 =
            exit x_186
        in
            f (k_82, x_187)

        end

    end

end
