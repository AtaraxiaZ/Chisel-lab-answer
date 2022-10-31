circuit Accu :
  module Accu :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<8>
    input io_setZero : UInt<1>
    output io_dout : UInt<8>

    reg accReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), accReg) @[Accu.scala 11:23]
    node _accReg_T = add(accReg, io_din) @[Accu.scala 18:22]
    node _accReg_T_1 = tail(_accReg_T, 1) @[Accu.scala 18:22]
    node _GEN_0 = mux(io_setZero, UInt<1>("h0"), _accReg_T_1) @[Accu.scala 15:19 16:12 18:12]
    node res = accReg @[Accu.scala 10:17 21:7]
    io_dout <= res @[Accu.scala 25:11]
    accReg <= mux(reset, UInt<8>("h0"), _GEN_0) @[Accu.scala 11:{23,23}]
