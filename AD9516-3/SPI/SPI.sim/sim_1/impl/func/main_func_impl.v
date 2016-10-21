// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Thu Sep 08 17:13:05 2016
// Host        : DESKTOP-JNGMG9L running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/fortu/Desktop/Vivado/SPI/SPI.sim/sim_1/impl/func/main_func_impl.v
// Design      : main
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku040-ffva1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module AD9516
   (spi_clk_OBUF,
    spi_cs_OBUF,
    spi_mout_OBUF);
  output spi_clk_OBUF;
  output spi_cs_OBUF;
  output spi_mout_OBUF;

  wire ZERO;
  wire ZERO_1;
  wire ZERO_26;

  assign spi_clk_OBUF = ZERO_26;
  assign spi_cs_OBUF = ZERO_1;
  assign spi_mout_OBUF = ZERO;
  GND GND_1
       (.G(ZERO));
  GND GND_2
       (.G(ZERO_1));
  GND GND_27
       (.G(ZERO_26));
endmodule

(* ECO_CHECKSUM = "bfdb9c25" *) 
(* NotValidForBitStream *)
module main
   (clk_in_p,
    clk_in_n,
    spi_clk,
    spi_mout,
    spi_cs);
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) input clk_in_p;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) input clk_in_n;
  output spi_clk;
  output spi_mout;
  output spi_cs;

  wire spi_clk;
  wire spi_clk_OBUF;
  wire spi_cs;
  wire spi_cs_OBUF;
  wire spi_mout;
  wire spi_mout_OBUF;

  AD9516 spi
       (.spi_clk_OBUF(spi_clk_OBUF),
        .spi_cs_OBUF(spi_cs_OBUF),
        .spi_mout_OBUF(spi_mout_OBUF));
  OBUF spi_clk_OBUF_inst
       (.I(spi_clk_OBUF),
        .O(spi_clk));
  OBUF spi_cs_OBUF_inst
       (.I(spi_cs_OBUF),
        .O(spi_cs));
  OBUF spi_mout_OBUF_inst
       (.I(spi_mout_OBUF),
        .O(spi_mout));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
