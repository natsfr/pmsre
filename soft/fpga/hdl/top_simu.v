`timescale 1ns / 1ps

module top_simu;
   parameter ARR_SIZE = 80;
   parameter [ARR_SIZE-1:0] mosi_pattern =
//     .       .       .       .       .       .       .       .       .       .       .
   80'b10000000111111110000000011111111000000000000000000000000000000000000000000000000;
//    1, 0, 0, 0, 0, 0, 0, 0,
//    1, 0, 1, 0, 1, 0, 1, 0,
//    1, 1, 0, 0, 1, 1, 0, 0,
//    1, 1, 1, 1, 0, 0, 0, 0,
//    0, 1, 0, 1, 0, 1, 0, 1


   reg 	 clk = 0;
   reg 	 reset = 1;
   reg 	 mosi = 0;
   reg 	 sck = 0;
   reg 	 fpga_cs = 1;
   reg [2:0] m_fault;

   wire      irq;
   wire      miso;
   wire [2:0] m_enable;
   wire [2:0] m_reset;
   wire [2:0] m_dir;
   wire [2:0] m_step;

   always #10 clk = ~clk;

   top fpga(.clk_8mhz(clk),
	    .mosi(mosi),
	    .sck(sck),
	    .fpga_cs(fpga_cs),
	    .m_fault(m_fault),
	    .irq(irq),
	    .miso(miso),
	    .m_enable(m_enable),
	    .m_reset(m_reset),
	    .m_dir(m_dir),
	    .m_step(m_step)
	    );

   integer    i;

   initial begin
       $dumpfile("pmsre.vcd");
       $dumpvars(0, top_simu);

       #1000;
       reset = 0;
       #1000;
       fpga_cs = 0;
       #100;

       for (i = ARR_SIZE-1; i >= 0; i = i - 1) begin
	   mosi = mosi_pattern[i];
	   sck = 0;
	   #100;
	   sck = 1;
	   #100;
       end

       #1000;
       fpga_cs = 1;
       #1000;

       $stop;
       $finish;

   end // initial begin

endmodule // top_simu
