流程:Abstract syntax tree->Continuation Passing Style->Flat->Closure implementation->hoist the func—>C Language representation(with a tiny GC)

实验编译结果说明：

测试用例：m_hello,m0,m1,m2,m3,m4,fac,print2string

编译环境：Clang

编译通过：m_hello,m0,m1,m2,m3,m4,

编译不通过：fac,print2string(都是两个error，出错原因相同，Contapp的arg没有声明，未解决)