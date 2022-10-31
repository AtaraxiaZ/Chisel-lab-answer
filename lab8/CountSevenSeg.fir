circuit CountSevenSeg :
  module SevenSegDec :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<4>, out : UInt<7>}

    wire sevSeg : UInt
    sevSeg <= UInt<1>("h0")
    node _T = eq(UInt<1>("h0"), io.in) @[SevenSegDec.scala 13:15]
    when _T : @[SevenSegDec.scala 13:15]
      sevSeg <= UInt<6>("h3f") @[SevenSegDec.scala 14:20]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.in) @[SevenSegDec.scala 13:15]
      when _T_1 : @[SevenSegDec.scala 13:15]
        sevSeg <= UInt<3>("h6") @[SevenSegDec.scala 15:20]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.in) @[SevenSegDec.scala 13:15]
        when _T_2 : @[SevenSegDec.scala 13:15]
          sevSeg <= UInt<7>("h5b") @[SevenSegDec.scala 16:20]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.in) @[SevenSegDec.scala 13:15]
          when _T_3 : @[SevenSegDec.scala 13:15]
            sevSeg <= UInt<7>("h4f") @[SevenSegDec.scala 17:20]
          else :
            node _T_4 = eq(UInt<3>("h4"), io.in) @[SevenSegDec.scala 13:15]
            when _T_4 : @[SevenSegDec.scala 13:15]
              sevSeg <= UInt<7>("h66") @[SevenSegDec.scala 18:20]
            else :
              node _T_5 = eq(UInt<3>("h5"), io.in) @[SevenSegDec.scala 13:15]
              when _T_5 : @[SevenSegDec.scala 13:15]
                sevSeg <= UInt<7>("h6d") @[SevenSegDec.scala 19:20]
              else :
                node _T_6 = eq(UInt<3>("h6"), io.in) @[SevenSegDec.scala 13:15]
                when _T_6 : @[SevenSegDec.scala 13:15]
                  sevSeg <= UInt<7>("h7d") @[SevenSegDec.scala 20:20]
                else :
                  node _T_7 = eq(UInt<3>("h7"), io.in) @[SevenSegDec.scala 13:15]
                  when _T_7 : @[SevenSegDec.scala 13:15]
                    sevSeg <= UInt<3>("h7") @[SevenSegDec.scala 21:20]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), io.in) @[SevenSegDec.scala 13:15]
                    when _T_8 : @[SevenSegDec.scala 13:15]
                      sevSeg <= UInt<7>("h7f") @[SevenSegDec.scala 22:20]
                    else :
                      node _T_9 = eq(UInt<4>("h9"), io.in) @[SevenSegDec.scala 13:15]
                      when _T_9 : @[SevenSegDec.scala 13:15]
                        sevSeg <= UInt<7>("h6f") @[SevenSegDec.scala 23:20]
                      else :
                        node _T_10 = eq(UInt<4>("ha"), io.in) @[SevenSegDec.scala 13:15]
                        when _T_10 : @[SevenSegDec.scala 13:15]
                          sevSeg <= UInt<7>("h77") @[SevenSegDec.scala 24:21]
                        else :
                          node _T_11 = eq(UInt<4>("hb"), io.in) @[SevenSegDec.scala 13:15]
                          when _T_11 : @[SevenSegDec.scala 13:15]
                            sevSeg <= UInt<7>("h7c") @[SevenSegDec.scala 25:21]
                          else :
                            node _T_12 = eq(UInt<4>("hc"), io.in) @[SevenSegDec.scala 13:15]
                            when _T_12 : @[SevenSegDec.scala 13:15]
                              sevSeg <= UInt<6>("h39") @[SevenSegDec.scala 26:21]
                            else :
                              node _T_13 = eq(UInt<4>("hd"), io.in) @[SevenSegDec.scala 13:15]
                              when _T_13 : @[SevenSegDec.scala 13:15]
                                sevSeg <= UInt<7>("h5e") @[SevenSegDec.scala 27:21]
                              else :
                                node _T_14 = eq(UInt<4>("he"), io.in) @[SevenSegDec.scala 13:15]
                                when _T_14 : @[SevenSegDec.scala 13:15]
                                  sevSeg <= UInt<7>("h79") @[SevenSegDec.scala 28:21]
                                else :
                                  node _T_15 = eq(UInt<4>("hf"), io.in) @[SevenSegDec.scala 13:15]
                                  when _T_15 : @[SevenSegDec.scala 13:15]
                                    sevSeg <= UInt<7>("h71") @[SevenSegDec.scala 29:21]
    io.out <= sevSeg @[SevenSegDec.scala 32:10]

  module CountSevenSeg :
    input clock : Clock
    input reset : UInt<1>
    output io : { seg : UInt<7>, an : UInt<4>}

    reg cntReg : UInt, clock with :
      reset => (reset, UInt<26>("h2faf080")) @[CountSevenSeg.scala 12:23]
    reg segin : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[CountSevenSeg.scala 13:22]
    inst sevenseg of SevenSegDec @[CountSevenSeg.scala 17:24]
    sevenseg.clock <= clock
    sevenseg.reset <= reset
    io.seg <= sevenseg.io.out @[CountSevenSeg.scala 18:10]
    sevenseg.io.in <= segin @[CountSevenSeg.scala 19:18]
    node _T = eq(cntReg, UInt<1>("h0")) @[CountSevenSeg.scala 21:15]
    when _T : @[CountSevenSeg.scala 21:23]
      node _segin_T = add(segin, UInt<1>("h1")) @[CountSevenSeg.scala 22:20]
      node _segin_T_1 = tail(_segin_T, 1) @[CountSevenSeg.scala 22:20]
      segin <= _segin_T_1 @[CountSevenSeg.scala 22:11]
      cntReg <= UInt<26>("h2faf080") @[CountSevenSeg.scala 23:12]
    else :
      node _cntReg_T = sub(cntReg, UInt<1>("h1")) @[CountSevenSeg.scala 25:22]
      node _cntReg_T_1 = tail(_cntReg_T, 1) @[CountSevenSeg.scala 25:22]
      cntReg <= _cntReg_T_1 @[CountSevenSeg.scala 25:12]
    io.an <= UInt<4>("he") @[CountSevenSeg.scala 30:9]

