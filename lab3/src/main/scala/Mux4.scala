import chisel3._

/**
  * Use Mux2 components to build a 4:1 multiplexer
  */

class Mux4 extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(1.W))
    val b = Input(UInt(1.W))
    val c = Input(UInt(1.W))
    val d = Input(UInt(1.W))
    val sel = Input(UInt(2.W))
    val y = Output(UInt(1.W))
  })

  // ***** your code starts here *****

  // create a Mux4 component out of Mux2 components
  // and connect the input and output ports.
  
  
  val mux2_1 = Module(new Mux2())
  val mux2_2 = Module(new Mux2())
  val mux2_3 = Module(new Mux2())

  // below is dummy code to make this example compile
  io.y := mux2_3.io.y
  mux2_1.io.a := io.a   
  mux2_1.io.b := io.b  
  mux2_2.io.a := io.c   
  mux2_2.io.b := io.d   
  mux2_3.io.a := mux2_1.io.y
  mux2_3.io.b := mux2_2.io.y
  mux2_1.io.sel := io.sel(0)
  mux2_2.io.sel := io.sel(0)
  mux2_3.io.sel := io.sel(1)

  // ***** your code ends here *****
}

object Mux4 extends App {
  println("Hello World, I will now generate the Verilog file!")
  emitVerilog(new Mux4())
}
