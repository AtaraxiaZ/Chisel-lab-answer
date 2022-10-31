import chisel3._
import chisel3.util._

class CountSevenSeg extends Module {
  val io = IO(new Bundle {
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
  })

  val CNT_MAX = (100000000 / 2).U
  // val CNT_MAX = (2).U // for simulation
  // val sevSeg = WireInit("b1111111".U(7.W))
  val cntReg = RegInit(CNT_MAX)
  val segin = RegInit(0.U(4.W))

  
  // *** your code starts here
  val sevenseg = Module(new SevenSegDec())
  io.seg := sevenseg.io.out
  sevenseg.io.in := segin

  when(cntReg === 0.U){
    segin := segin + 1.U
    cntReg := CNT_MAX
  }.otherwise(
    cntReg := cntReg - 1.U
  ) 

  // *** your code ends here

  io.an := "b1110".U
}

// generate Verilog
object CountSevenSeg extends App {
  emitVerilog(new CountSevenSeg())
}