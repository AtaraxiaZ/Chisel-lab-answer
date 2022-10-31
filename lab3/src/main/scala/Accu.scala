import chisel3._

class Accu extends Module {
  val io = IO(new Bundle {
    val din = Input(UInt(8.W))
    val setZero = Input(Bool())
    val dout = Output(UInt(8.W))
  })

  val res = Wire(UInt())
  val accReg = RegInit(0.U(8.W))

  // ***** your code starts here *****

  when(io.setZero){
    accReg := 0.U
  }.otherwise{
    accReg := accReg + io.din
  }

  res := accReg // dummy code to make it compile

  // ***** your code ends here *****

  io.dout := res
}