circuit Count6 :
  module Count6 :
    input clock : Clock
    input reset : UInt<1>
    output io_dout : UInt<8>

    reg cntReg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[Count6.scala 9:23]
    node _T = eq(cntReg, UInt<3>("h6")) @[Count6.scala 13:15]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[Count6.scala 16:22]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[Count6.scala 16:22]
    node _GEN_0 = mux(_T, UInt<1>("h0"), _cntReg_T_1) @[Count6.scala 13:23 14:12 16:12]
    node res = cntReg @[Count6.scala 8:17 19:7]
    io_dout <= pad(res, 8) @[Count6.scala 23:11]
    cntReg <= mux(reset, UInt<3>("h0"), _GEN_0) @[Count6.scala 9:{23,23}]
