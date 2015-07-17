datatype ('a, 'b) s = In1 of 'a | In2 of 'b
fun exit x = ()
val cps_code =
let val x_165 = "z"
in
    let val x_164 = In1 x_165
    in
        let fun k_148 (e_301, x_161) =
            let val x_164 = #1 e_301
            in
                exit x_161

            end

        in
            let val e_302 = [x_164]
            in
                let val k_70 = [k_148, e_302]
                in
                    let fun k_149 (e_300, x_162) =
                        let val x_164 = #1 e_300
                        in
                            let val k_70 = #2 e_300
                            in
                                let val x_167 = "A"
                                in
                                    let val x_168 = "AA"
                                    in
                                        let val x_166 = [x_167, x_168]
                                        in
                                            let val k_146 = #1 k_70
                                            in
                                                let val e_295 = #2 k_70
                                                in
                                                    let val k_150 = #1 k_146
                                                    in
                                                        let val e_304 = #2 k_146
                                                        in
                                                            k_150 (e_304, x_166)

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
                        let val e_303 = [x_164, k_70]
                        in
                            let val k_71 = [k_149, e_303]
                            in
                                let fun k_151 (e_299, x_163) =
                                    let val k_71 = #1 e_299
                                    in
                                        let val x_164 = #2 e_299
                                        in
                                            let val k_70 = #3 e_299
                                            in
                                                let val x_170 = "B"
                                                in
                                                    let val x_171 = "BB"
                                                    in
                                                        let val x_169 = [x_170, x_171]
                                                        in
                                                            let val k_147 = #1 k_70
                                                            in
                                                                let val e_296 = #2 k_70
                                                                in
                                                                    let val k_152 = #1 k_147
                                                                    in
                                                                        let val e_306 = #2 k_147
                                                                        in
                                                                            k_152 (e_306, x_169)

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
                                    let val e_305 = [k_71, x_164, k_70]
                                    in
                                        let val k_72 = [k_151, e_305]
                                        in
                                            case x_164 of In1 x_66 =>                                                 let val k_153 = #1 k_71
                                                in
                                                    let val e_307 = #2 k_71
                                                    in
                                                        k_153 (e_307, x_66)

                                                    end

                                                end
| In2 x_67 =>                                                 let val k_154 = #1 k_72
                                                in
                                                    let val e_308 = #2 k_72
                                                    in
                                                        k_154 (e_308, x_67)

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
