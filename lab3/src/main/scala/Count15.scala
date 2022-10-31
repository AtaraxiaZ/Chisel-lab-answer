import chisel3._

class Count15 extends Module {
  val io = IO(new Bundle {
    val dout = Output(UInt(8.W))
  })

  val res = Wire(UInt())
  val cntReg = RegInit(0.U(4.W))

  // ***** your code starts here *****

  cntReg := cntReg + 1.U
  
  res := cntReg// dummy code to make it compile

  // ***** your code ends here *****

  io.dout := res
}