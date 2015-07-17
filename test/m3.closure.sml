datatype ('a, 'b) s = In1 of 'a | In2 of 'b
fun exit x = ()
val cps_code =
let val x_68 = fn (e_310, k_74, x) => 
        let val k_155 = #1 k_74
        in
            let val e_309 = #2 k_74
            in
                let val k_156 = #1 k_155
                in
                    let val e_314 = #2 k_155
                    in
                        k_156 (e_314, x)

                    end

                end

            end

        end

    freevars=[]

in
    let val e_313 = []
    in
        let val x_173 = [x_68, e_313]
        in
            let val x_174 = "hello"
            in
                let fun k_157 (e_312, x_172) =
                    let val x_174 = #1 e_312
                    in
                        let val x_173 = #2 e_312
                        in
                            exit x_172

                        end

                    end

                in
                    let val e_315 = [x_174, x_173]
                    in
                        let val k_73 = [k_157, e_315]
                        in
                            let val x_69 = #1 x_173
                            in
                                let val e_316 = #2 x_173
                                in
                                    x_69 (k_73, e_316, x_174)

                                end

                            end
                        end
                    end

                end
            end
        end
    end
end
