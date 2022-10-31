import chisel3._
import chisel3.util._

class SevenSegDecoder extends Module {
  val io = IO(new Bundle {
    val sw = Input(UInt(4.W))
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
  })

  val sevSeg = WireInit(0.U(7.W))

  // ***** your code starts here *****

  switch(io.sw){
    is(0.U){sevSeg := 0x3f.U}
    is(1.U){sevSeg := 0x06.U}
    is(2.U){sevSeg := 0x5b.U}
    is(3.U){sevSeg := 0x4f.U}
    is(4.U){sevSeg := 0x66.U}
    is(5.U){sevSeg := 0x6d.U}
    is(6.U){sevSeg := 0x7d.U}
    is(7.U){sevSeg := 0x07.U}
    is(8.U){sevSeg := 0x7f.U}
    is(9.U){sevSeg := 0x6f.U}
    is(10.U){sevSeg := 0x77.U}
    is(11.U){sevSeg := 0x7c.U}
    is(12.U){sevSeg := 0x39.U}
    is(13.U){sevSeg := 0x5e.U}
    is(14.U){sevSeg := 0x79.U}
    is(15.U){sevSeg := 0x71.U}
  }

  // ***** your code ends here *****

  io.seg := ~sevSeg
  io.an := "b1110".U
}

// generate Verilog
object SevenSegDecoder extends App {
  emitVerilog(new SevenSegDecoder())
}


