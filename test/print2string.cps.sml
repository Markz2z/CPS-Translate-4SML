datatype ('a, 'b) s = In1 of 'a | In2 of 'b
fun exit x = ()
val cps_code =
let fun f(k_83, x) = (
    let fun k_84 x_191 =
        k_83 x_191

    in
        let fun k_85 x_192 =
            let val x_194 = 0
            in
                k_84 x_194

            end

        in
            let fun k_86 x_193 =
                let val x_198 = 1
                in
                    let val x_197 = x-x_198
                    in
                        let fun k_87 x_196 =
                            let val x_195 = x+x_196
                            in
                                k_84 x_195

                            end

                        in
                            f (k_87, x_197)

                        end

                    end

                end

            in
                if x= 0 then k_85() else k_86()

            end

        end

    end
    )
in
    let val x_200 = 100
    in
        let fun k_88 x_199 =
            let val x_189 = Int.toString x_199
 in
                let val x_188 = print x_189
 in
                    exit x_188
                end

            end

        in
            f (k_88, x_200)

        end

    end

end
