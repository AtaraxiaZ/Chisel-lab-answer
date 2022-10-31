circuit CountSevenSeg :
  module SevenSegDec :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<4>
    output io_out : UInt<7>

    node _T = eq(UInt<1>("h0"), io_in) @[SevenSegDec.scala 13:15]
    node _T_1 = eq(UInt<1>("h1"), io_in) @[SevenSegDec.scala 13:15]
    node _T_2 = eq(UInt<2>("h2"), io_in) @[SevenSegDec.scala 13:15]
    node _T_3 = eq(UInt<2>("h3"), io_in) @[SevenSegDec.scala 13:15]
    node _T_4 = eq(UInt<3>("h4"), io_in) @[SevenSegDec.scala 13:15]
    node _T_5 = eq(UInt<3>("h5"), io_in) @[SevenSegDec.scala 13:15]
    node _T_6 = eq(UInt<3>("h6"), io_in) @[SevenSegDec.scala 13:15]
    node _T_7 = eq(UInt<3>("h7"), io_in) @[SevenSegDec.scala 13:15]
    node _T_8 = eq(UInt<4>("h8"), io_in) @[SevenSegDec.scala 13:15]
    node _T_9 = eq(UInt<4>("h9"), io_in) @[SevenSegDec.scala 13:15]
    node _T_10 = eq(UInt<4>("ha"), io_in) @[SevenSegDec.scala 13:15]
    node _T_11 = eq(UInt<4>("hb"), io_in) @[SevenSegDec.scala 13:15]
    node _T_12 = eq(UInt<4>("hc"), io_in) @[SevenSegDec.scala 13:15]
    node _T_13 = eq(UInt<4>("hd"), io_in) @[SevenSegDec.scala 13:15]
    node _T_14 = eq(UInt<4>("he"), io_in) @[SevenSegDec.scala 13:15]
    node _T_15 = eq(UInt<4>("hf"), io_in) @[SevenSegDec.scala 13:15]
    node _GEN_0 = mux(_T_15, UInt<7>("h71"), UInt<1>("h0")) @[SevenSegDec.scala 13:15 29:21]
    node _GEN_1 = mux(_T_14, UInt<7>("h79"), _GEN_0) @[SevenSegDec.scala 13:15 28:21]
    node _GEN_2 = mux(_T_13, UInt<7>("h5e"), _GEN_1) @[SevenSegDec.scala 13:15 27:21]
    node _GEN_3 = mux(_T_12, UInt<6>("h39"), _GEN_2) @[SevenSegDec.scala 13:15 26:21]
    node _GEN_4 = mux(_T_11, UInt<7>("h7c"), _GEN_3) @[SevenSegDec.scala 13:15 25:21]
    node _GEN_5 = mux(_T_10, UInt<7>("h77"), _GEN_4) @[SevenSegDec.scala 13:15 24:21]
    node _GEN_6 = mux(_T_9, UInt<7>("h6f"), _GEN_5) @[SevenSegDec.scala 13:15 23:20]
    node _GEN_7 = mux(_T_8, UInt<7>("h7f"), _GEN_6) @[SevenSegDec.scala 13:15 22:20]
    node _GEN_8 = mux(_T_7, UInt<3>("h7"), _GEN_7) @[SevenSegDec.scala 13:15 21:20]
    node _GEN_9 = mux(_T_6, UInt<7>("h7d"), _GEN_8) @[SevenSegDec.scala 13:15 20:20]
    node _GEN_10 = mux(_T_5, UInt<7>("h6d"), _GEN_9) @[SevenSegDec.scala 13:15 19:20]
    node _GEN_11 = mux(_T_4, UInt<7>("h66"), _GEN_10) @[SevenSegDec.scala 13:15 18:20]
    node _GEN_12 = mux(_T_3, UInt<7>("h4f"), _GEN_11) @[SevenSegDec.scala 13:15 17:20]
    node _GEN_13 = mux(_T_2, UInt<7>("h5b"), _GEN_12) @[SevenSegDec.scala 13:15 16:20]
    node _GEN_14 = mux(_T_1, UInt<3>("h6"), _GEN_13) @[SevenSegDec.scala 13:15 15:20]
    node _GEN_15 = mux(_T, UInt<6>("h3f"), _GEN_14) @[SevenSegDec.scala 13:15 14:20]
    node sevSeg = _GEN_15
    io_out <= sevSeg @[SevenSegDec.scala 32:10]

  module CountSevenSeg :
    input clock : Clock
    input reset : UInt<1>
    output io_seg : UInt<7>
    output io_an : UInt<4>

    inst sevenseg of SevenSegDec @[CountSevenSeg.scala 18:24]
    reg cntReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[CountSevenSeg.scala 13:23]
    reg segin : UInt<4>, clock with :
      reset => (UInt<1>("h0"), segin) @[CountSevenSeg.scala 14:22]
    node _T = eq(cntReg, UInt<1>("h0")) @[CountSevenSeg.scala 22:15]
    node _segin_T = add(segin, UInt<1>("h1")) @[CountSevenSeg.scala 23:20]
    node _segin_T_1 = tail(_segin_T, 1) @[CountSevenSeg.scala 23:20]
    node _cntReg_T = sub(cntReg, UInt<1>("h1")) @[CountSevenSeg.scala 26:22]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[CountSevenSeg.scala 26:22]
    node _GEN_0 = mux(_T, _segin_T_1, segin) @[CountSevenSeg.scala 22:23 23:11 14:22]
    node _GEN_1 = mux(_T, UInt<2>("h2"), _cntReg_T_1) @[CountSevenSeg.scala 22:23 24:12 26:12]
    io_seg <= sevenseg.io_out @[CountSevenSeg.scala 19:10]
    io_an <= UInt<4>("he") @[CountSevenSeg.scala 31:9]
    cntReg <= mux(reset, UInt<2>("h2"), _GEN_1) @[CountSevenSeg.scala 13:{23,23}]
    segin <= mux(reset, UInt<4>("h0"), _GEN_0) @[CountSevenSeg.scala 14:{22,22}]
    sevenseg.clock <= clock
    sevenseg.reset <= reset
    sevenseg.io_in <= segin @[CountSevenSeg.scala 20:18]
