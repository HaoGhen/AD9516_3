module main(clk_in_p, clk_in_n,spi_clk,spi_mosi,spi_miso,spi_cs,led);
input clk_in_p;
input clk_in_n;
input  spi_miso;
output spi_clk;
output spi_cs;
output spi_mosi;
output[7:0] led;
wire _spi_clk;
wire clk_in;
wire spi_mi;

   IBUFDS #(
      .DQS_BIAS("FALSE")  // (FALSE, TRUE)
   )
   IBUFDS_inst (
      .O(clk_in),   // 1-bit output: Buffer output
      .I(clk_in_p),   // 1-bit input: Diff_p buffer input (connect directly to top-level port)
      .IB(clk_in_n)  // 1-bit input: Diff_n buffer input (connect directly to top-level port)
   );
   

FALSE_PLL pll(clk_in,ref_clk,_ref_clk);
AD9516    spi(ref_clk,_ref_clk,spi_clk,spi_mosi,spi_miso,spi_cs,led);
endmodule
