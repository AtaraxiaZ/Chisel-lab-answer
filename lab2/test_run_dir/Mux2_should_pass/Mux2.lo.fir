circuit Mux2 :
  module Mux2 :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<1>
    input io_b : UInt<1>
    input io_sel : UInt<1>
    output io_y : UInt<1>

    node _res_T = mux(io_sel, io_b, io_a) @[Mux2.scala 17:13]
    node res = _res_T @[Mux2.scala 14:17 17:7]
    io_y <= res @[Mux2.scala 27:8]
