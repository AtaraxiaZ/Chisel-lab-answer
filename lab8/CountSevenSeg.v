module SevenSegDec(
  input  [3:0] io_in,
  output [6:0] io_out
);
  wire [6:0] _GEN_0 = 4'hf == io_in ? 7'h71 : 7'h0; // @[SevenSegDec.scala 13:15 29:21]
  wire [6:0] _GEN_1 = 4'he == io_in ? 7'h79 : _GEN_0; // @[SevenSegDec.scala 13:15 28:21]
  wire [6:0] _GEN_2 = 4'hd == io_in ? 7'h5e : _GEN_1; // @[SevenSegDec.scala 13:15 27:21]
  wire [6:0] _GEN_3 = 4'hc == io_in ? 7'h39 : _GEN_2; // @[SevenSegDec.scala 13:15 26:21]
  wire [6:0] _GEN_4 = 4'hb == io_in ? 7'h7c : _GEN_3; // @[SevenSegDec.scala 13:15 25:21]
  wire [6:0] _GEN_5 = 4'ha == io_in ? 7'h77 : _GEN_4; // @[SevenSegDec.scala 13:15 24:21]
  wire [6:0] _GEN_6 = 4'h9 == io_in ? 7'h6f : _GEN_5; // @[SevenSegDec.scala 13:15 23:20]
  wire [6:0] _GEN_7 = 4'h8 == io_in ? 7'h7f : _GEN_6; // @[SevenSegDec.scala 13:15 22:20]
  wire [6:0] _GEN_8 = 4'h7 == io_in ? 7'h7 : _GEN_7; // @[SevenSegDec.scala 13:15 21:20]
  wire [6:0] _GEN_9 = 4'h6 == io_in ? 7'h7d : _GEN_8; // @[SevenSegDec.scala 13:15 20:20]
  wire [6:0] _GEN_10 = 4'h5 == io_in ? 7'h6d : _GEN_9; // @[SevenSegDec.scala 13:15 19:20]
  wire [6:0] _GEN_11 = 4'h4 == io_in ? 7'h66 : _GEN_10; // @[SevenSegDec.scala 13:15 18:20]
  wire [6:0] _GEN_12 = 4'h3 == io_in ? 7'h4f : _GEN_11; // @[SevenSegDec.scala 13:15 17:20]
  wire [6:0] _GEN_13 = 4'h2 == io_in ? 7'h5b : _GEN_12; // @[SevenSegDec.scala 13:15 16:20]
  wire [6:0] _GEN_14 = 4'h1 == io_in ? 7'h6 : _GEN_13; // @[SevenSegDec.scala 13:15 15:20]
  assign io_out = 4'h0 == io_in ? 7'h3f : _GEN_14; // @[SevenSegDec.scala 13:15 14:20]
endmodule
module CountSevenSeg(
  input        clock,
  input        reset,
  output [6:0] io_seg,
  output [3:0] io_an
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] sevenseg_io_in; // @[CountSevenSeg.scala 17:24]
  wire [6:0] sevenseg_io_out; // @[CountSevenSeg.scala 17:24]
  reg [25:0] cntReg; // @[CountSevenSeg.scala 12:23]
  reg [3:0] segin; // @[CountSevenSeg.scala 13:22]
  wire [3:0] _segin_T_1 = segin + 4'h1; // @[CountSevenSeg.scala 22:20]
  wire [25:0] _cntReg_T_1 = cntReg - 26'h1; // @[CountSevenSeg.scala 25:22]
  SevenSegDec sevenseg ( // @[CountSevenSeg.scala 17:24]
    .io_in(sevenseg_io_in),
    .io_out(sevenseg_io_out)
  );
  assign io_seg = sevenseg_io_out; // @[CountSevenSeg.scala 18:10]
  assign io_an = 4'he; // @[CountSevenSeg.scala 30:9]
  assign sevenseg_io_in = segin; // @[CountSevenSeg.scala 19:18]
  always @(posedge clock) begin
    if (reset) begin // @[CountSevenSeg.scala 12:23]
      cntReg <= 26'h2faf080; // @[CountSevenSeg.scala 12:23]
    end else if (cntReg == 26'h0) begin // @[CountSevenSeg.scala 21:23]
      cntReg <= 26'h2faf080; // @[CountSevenSeg.scala 23:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[CountSevenSeg.scala 25:12]
    end
    if (reset) begin // @[CountSevenSeg.scala 13:22]
      segin <= 4'h0; // @[CountSevenSeg.scala 13:22]
    end else if (cntReg == 26'h0) begin // @[CountSevenSeg.scala 21:23]
      segin <= _segin_T_1; // @[CountSevenSeg.scala 22:11]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cntReg = _RAND_0[25:0];
  _RAND_1 = {1{`RANDOM}};
  segin = _RAND_1[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
