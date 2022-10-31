import chisel3._
import chiseltest._ 
import org.scalatest.flatspec.AnyFlatSpec

class Mux5Spec extends AnyFlatSpec with ChiselScalatestTester {
  "Mux5" should "pass" in{
    test(new Mux5) { dut =>
      for(n <- 0 to 7){
        dut.io.a.poke(1.U)
        dut.io.b.poke(2.U)
        dut.io.c.poke(3.U)
        dut.io.d.poke(4.U)
        dut.clock.step(1)
        dut.io.sel.poke(n.U)
        println("Result is: " + dut.io.y.peek().toString)
        dut.io.y.expect((n+1).U)
      }
    }
  }
}