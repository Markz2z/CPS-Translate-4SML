datatype ('a, 'b) s = In1 of 'a | In2 of 'b
fun exit x = ()
val cps_code =
let val x_70 = fn (e_320, k_75, x) => 
        let val x_71 = fn (e_318, k_76, y) => 
                let val x = #1 e_318
                in
                    let val k_158 = #1 k_76
                    in
                        let val e_317 = #2 k_76
                        in
                            let val k_160 = #1 k_158
                            in
                                let val e_323 = #2 k_158
                                in
                                    k_160 (e_323, x)

                                end

                            end

                        end

                    end

                end

            freevars=[]

        in
            let val e_322 = [x]
            in
                let val x_176 = [x_71, e_322]
                in
                    let val k_159 = #1 k_75
                    in
                        let val e_319 = #2 k_75
                        in
                            let val k_161 = #1 k_159
                            in
                                let val e_324 = #2 k_159
                                in
                                    k_161 (e_324, x_176)

                                end

                            end

                        end

                    end
                end
            end
        end

    freevars=[]

in
    let val e_321 = []
    in
        let val x_175 = [x_70, e_321]
        in
            exit x_175
        end
    end
end
