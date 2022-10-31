circuit Delay :
  module Delay :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<8>
    output io_dout : UInt<8>

    reg res_REG : UInt<8>, clock with :
      reset => (UInt<1>("h0"), res_REG) @[Delay.scala 14:25]
    reg res_REG_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), res_REG_1) @[Delay.scala 14:17]
    node res = res_REG_1 @[Delay.scala 9:17 14:7]
    io_dout <= res @[Delay.scala 18:11]
    res_REG <= io_din @[Delay.scala 14:25]
    res_REG_1 <= res_REG @[Delay.scala 14:17]
