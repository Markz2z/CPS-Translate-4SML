datatype ('a, 'b) s = In1 of 'a | In2 of 'b
fun exit x = ()
val cps_code =
let fun x_75(k_77, e_337, x) = (
    let val f = [x_75, e_337]
    in
        let fun k_165 (e_334, x_178) =
            let val x = #1 e_334
            in
                let val f = #2 e_334
                in
                    let val k_77 = #3 e_334
                    in
                        let val k_162 = #1 k_77
                        in
                            let val e_325 = #2 k_77
                            in
                                let val k_166 = #1 k_162
                                in
                                    let val e_340 = #2 k_162
                                    in
                                        k_166 (e_340, x_178)

                                    end

                                end

                            end

                        end

                    end

                end

            end

        in
            let val e_339 = [x, f, k_77]
            in
                let val k_78 = [k_165, e_339]
                in
                    let fun k_167 (e_333, x_179) =
                        let val x = #1 e_333
                        in
                            let val f = #2 e_333
                            in
                                let val k_78 = #3 e_333
                                in
                                    let val x_181 = 0
                                    in
                                        let val k_163 = #1 k_78
                                        in
                                            let val e_326 = #2 k_78
                                            in
                                                let val k_168 = #1 k_163
                                                in
                                                    let val e_342 = #2 k_163
                                                    in
                                                        k_168 (e_342, x_181)

                                                    end

                                                end

                                            end

                                        end
                                    end

                                end

                            end

                        end

                    in
                        let val e_341 = [x, f, k_78]
                        in
                            let val k_79 = [k_167, e_341]
                            in
                                let fun k_169 (e_332, x_180) =
                                    let val k_79 = #1 e_332
                                    in
                                        let val x = #2 e_332
                                        in
                                            let val f = #3 e_332
                                            in
                                                let val k_78 = #4 e_332
                                                in
                                                    let val x_185 = 1
                                                    in
                                                        let val x_184 = x-x_185
 in
                                                            let fun k_170 (e_329, x_183) =
                                                                let val x_184 = #1 e_329
                                                                in
                                                                    let val f = #2 e_329
                                                                    in
                                                                        let val k_78 = #3 e_329
                                                                        in
                                                                            let val x = #4 e_329
                                                                            in
                                                                                let val x_182 = x+x_183
 in
                                                                                    let val k_164 = #1 k_78
                                                                                    in
                                                                                        let val e_327 = #2 k_78
                                                                                        in
                                                                                            let val k_171 = #1 k_164
                                                                                            in
                                                                                                let val e_345 = #2 k_164
                                                                                                in
                                                                                                    k_171 (e_345, x_182)

                                                                                                end

                                                                                            end

                                                                                        end

                                                                                    end

                                                                                end

                                                                            end

                                                                        end

                                                                    end

                                                                end

                                                            in
                                                                let val e_344 = [x_184, f, k_78, x]
                                                                in
                                                                    let val k_81 = [k_170, e_344]
                                                                    in
                                                                        let val x_76 = #1 f
                                                                        in
                                                                            let val e_346 = #2 f
                                                                            in
                                                                                x_76 (k_81, e_346, x_184)

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

                                in
                                    let val e_343 = [k_79, x, f, k_78]
                                    in
                                        let val k_80 = [k_169, e_343]
                                        in
                                            let val x_74 = ()
                                            in
                                                if x= 0 then                                                     let val k_172 = #1 k_79
                                                    in
                                                        let val e_347 = #2 k_79
                                                        in
                                                            k_172 (e_347, x_72)

                                                        end

                                                    end
 else                                                     let val k_173 = #1 k_80
                                                    in
                                                        let val e_348 = #2 k_80
                                                        in
                                                            k_173 (e_348, x_73)

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

        end
    end
    )
in
    let val e_338 = []
    in
        let val f = [x_75, e_338]
        in
            let val x_187 = 100
            in
                let fun k_174 (e_336, x_186) =
                    let val x_187 = #1 e_336
                    in
                        let val f = #2 e_336
                        in
                            exit x_186

                        end

                    end

                in
                    let val e_349 = [x_187, f]
                    in
                        let val k_82 = [k_174, e_349]
                        in
                            let val x_77 = #1 f
                            in
                                let val e_350 = #2 f
                                in
                                    x_77 (k_82, e_350, x_187)

                                end

                            end
                        end
                    end

                end
            end
        end
    end

end
