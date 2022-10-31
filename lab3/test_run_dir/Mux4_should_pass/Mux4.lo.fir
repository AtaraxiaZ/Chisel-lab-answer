circuit Mux4 :
  module Mux2 :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<1>
    input io_b : UInt<1>
    input io_sel : UInt<1>
    output io_y : UInt<1>

    node _T = eq(io_sel, UInt<1>("h1")) @[Mux2.scala 17:16]
    node _GEN_0 = mux(_T, io_b, io_a) @[Mux2.scala 17:25 18:10 16:8]
    io_y <= _GEN_0

  module Mux4 :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<1>
    input io_b : UInt<1>
    input io_c : UInt<1>
    input io_d : UInt<1>
    input io_sel : UInt<2>
    output io_y : UInt<1>

    inst mux2_1 of Mux2 @[Mux4.scala 23:22]
    inst mux2_2 of Mux2 @[Mux4.scala 24:22]
    inst mux2_3 of Mux2 @[Mux4.scala 25:22]
    node _mux2_1_io_sel_T = bits(io_sel, 0, 0) @[Mux4.scala 35:26]
    node _mux2_2_io_sel_T = bits(io_sel, 0, 0) @[Mux4.scala 36:26]
    node _mux2_3_io_sel_T = bits(io_sel, 1, 1) @[Mux4.scala 37:26]
    io_y <= mux2_3.io_y @[Mux4.scala 28:8]
    mux2_1.clock <= clock
    mux2_1.reset <= reset
    mux2_1.io_a <= io_a @[Mux4.scala 29:15]
    mux2_1.io_b <= io_b @[Mux4.scala 30:15]
    mux2_1.io_sel <= _mux2_1_io_sel_T @[Mux4.scala 35:17]
    mux2_2.clock <= clock
    mux2_2.reset <= reset
    mux2_2.io_a <= io_c @[Mux4.scala 31:15]
    mux2_2.io_b <= io_d @[Mux4.scala 32:15]
    mux2_2.io_sel <= _mux2_2_io_sel_T @[Mux4.scala 36:17]
    mux2_3.clock <= clock
    mux2_3.reset <= reset
    mux2_3.io_a <= mux2_1.io_y @[Mux4.scala 33:15]
    mux2_3.io_b <= mux2_2.io_y @[Mux4.scala 34:15]
    mux2_3.io_sel <= _mux2_3_io_sel_T @[Mux4.scala 37:17]
