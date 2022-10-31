import chisel3._

class Mux2 extends Module {
  val io = IO(new Bundle {
    val a = Input(Bool())
    val b = Input(Bool())
    val sel = Input(Bool())
    val y = Output(Bool())
  })

  val a = io.a
  val b = io.b
  val sel = io.sel
  val res = Wire(Bool())

  // ***** your code starts here *****
  res := Mux(sel, b, a)
  // res := (!sel & a) | (sel & b)
  // when(sel){
  //   res := b
  // }.otherwise{
  //   res := a
  // }

  // ***** your code ends here *****

  io.y := res
}


