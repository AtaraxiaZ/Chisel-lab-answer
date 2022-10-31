circuit Count15 :
  module Count15 :
    input clock : Clock
    input reset : UInt<1>
    output io_dout : UInt<8>

    reg cntReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[Count15.scala 9:23]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[Count15.scala 13:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[Count15.scala 13:20]
    node res = cntReg @[Count15.scala 8:17 15:7]
    io_dout <= pad(res, 8) @[Count15.scala 19:11]
    cntReg <= mux(reset, UInt<4>("h0"), _cntReg_T_1) @[Count15.scala 13:10 9:{23,23}]
