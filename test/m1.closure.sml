datatype ('a, 'b) s = In1 of 'a | In2 of 'b
fun exit x = ()
val cps_code =
let val x_64 = fn (e_288, k_69, x) => 
        let val x_157 = #1 x
        in
            let val k_143 = #1 k_69
            in
                let val e_287 = #2 k_69
                in
                    let val k_144 = #1 k_143
                    in
                        let val e_292 = #2 k_143
                        in
                            k_144 (e_292, x_157)

                        end

                    end

                end

            end

        end

    freevars=[]

in
    let val e_291 = []
    in
        let val x_156 = [x_64, e_291]
        in
            let val x_159 = "a"
            in
                let val x_160 = "b"
                in
                    let val x_158 = [x_159, x_160]
                    in
                        let fun k_145 (e_290, x_155) =
                            let val x_158 = #1 e_290
                            in
                                let val x_156 = #2 e_290
                                in
                                    exit x_155

                                end

                            end

                        in
                            let val e_293 = [x_158, x_156]
                            in
                                let val k_68 = [k_145, e_293]
                                in
                                    let val x_65 = #1 x_156
                                    in
                                        let val e_294 = #2 x_156
                                        in
                                            x_65 (k_68, e_294, x_158)

                                        end

                                    end
                                end
                            end

                        end
                    end
                end
            end
        end
    end
end
