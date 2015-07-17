datatype ('a, 'b) s = In1 of 'a | In2 of 'b
fun exit x = ()
val cps_code =
let fun x_81(k_83, e_363, x) = (
    let val f = [x_81, e_363]
    in
        let fun k_178 (e_360, x_191) =
            let val x = #1 e_360
            in
                let val f = #2 e_360
                in
                    let val k_83 = #3 e_360
                    in
                        let val k_175 = #1 k_83
                        in
                            let val e_351 = #2 k_83
                            in
                                let val k_179 = #1 k_175
                                in
                                    let val e_366 = #2 k_175
                                    in
                                        k_179 (e_366, x_191)

                                    end

                                end

                            end

                        end

                    end

                end

            end

        in
            let val e_365 = [x, f, k_83]
            in
                let val k_84 = [k_178, e_365]
                in
                    let fun k_180 (e_359, x_192) =
                        let val x = #1 e_359
                        in
                            let val f = #2 e_359
                            in
                                let val k_84 = #3 e_359
                                in
                                    let val x_194 = 0
                                    in
                                        let val k_176 = #1 k_84
                                        in
                                            let val e_352 = #2 k_84
                                            in
                                                let val k_181 = #1 k_176
                                                in
                                                    let val e_368 = #2 k_176
                                                    in
                                                        k_181 (e_368, x_194)

                                                    end

                                                end

                                            end

                                        end
                                    end

                                end

                            end

                        end

                    in
                        let val e_367 = [x, f, k_84]
                        in
                            let val k_85 = [k_180, e_367]
                            in
                                let fun k_182 (e_358, x_193) =
                                    let val k_85 = #1 e_358
                                    in
                                        let val x = #2 e_358
                                        in
                                            let val f = #3 e_358
                                            in
                                                let val k_84 = #4 e_358
                                                in
                                                    let val x_198 = 1
                                                    in
                                                        let val x_197 = x-x_198
 in
                                                            let fun k_183 (e_355, x_196) =
                                                                let val x_197 = #1 e_355
                                                                in
                                                                    let val f = #2 e_355
                                                                    in
                                                                        let val k_84 = #3 e_355
                                                                        in
                                                                            let val x = #4 e_355
                                                                            in
                                                                                let val x_195 = x+x_196
 in
                                                                                    let val k_177 = #1 k_84
                                                                                    in
                                                                                        let val e_353 = #2 k_84
                                                                                        in
                                                                                            let val k_184 = #1 k_177
                                                                                            in
                                                                                                let val e_371 = #2 k_177
                                                                                                in
                                                                                                    k_184 (e_371, x_195)

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
                                                                let val e_370 = [x_197, f, k_84, x]
                                                                in
                                                                    let val k_87 = [k_183, e_370]
                                                                    in
                                                                        let val x_82 = #1 f
                                                                        in
                                                                            let val e_372 = #2 f
                                                                            in
                                                                                x_82 (k_87, e_372, x_197)

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
                                    let val e_369 = [k_85, x, f, k_84]
                                    in
                                        let val k_86 = [k_182, e_369]
                                        in
                                            let val x_80 = ()
                                            in
                                                if x= 0 then                                                     let val k_185 = #1 k_85
                                                    in
                                                        let val e_373 = #2 k_85
                                                        in
                                                            k_185 (e_373, x_78)

                                                        end

                                                    end
 else                                                     let val k_186 = #1 k_86
                                                    in
                                                        let val e_374 = #2 k_86
                                                        in
                                                            k_186 (e_374, x_79)

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
    let val e_364 = []
    in
        let val f = [x_81, e_364]
        in
            let val x_200 = 100
            in
                let fun k_187 (e_362, x_199) =
                    let val x_200 = #1 e_362
                    in
                        let val f = #2 e_362
                        in
                            let val x_189 =  Int2String x_199
 in
                                let val x_188 =  print x_189
 in
                                    exit x_188

                                end

                            end

                        end

                    end

                in
                    let val e_375 = [x_200, f]
                    in
                        let val k_88 = [k_187, e_375]
                        in
                            let val x_83 = #1 f
                            in
                                let val e_376 = #2 f
                                in
                                    x_83 (k_88, e_376, x_200)

                                end

                            end
                        end
                    end

                end
            end
        end
    end

end
