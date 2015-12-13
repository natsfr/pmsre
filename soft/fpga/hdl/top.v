`timescale 1ns / 1ps

module top(
	   input 	clk_8mhz,
	   input 	mosi, 
	   input 	sck,
	   input 	cs,
	   input [2:0] 	m_fault,
	   input [5:0] 	m_stop,

	   inout 	miso,

	   output 	irq,
	   output [2:0] m_enable,
	   output [2:0] m_reset,
	   output [2:0] m_dir,
	   output [2:0] m_step
	   );

   wire [7:0] 		rx_data;
   wire 		spi_valid;
   wire 		spi_select;
   wire [7:0] 		spi_out;
   wire 		reset;
   wire 		miso_;

   assign miso = cs ? 1'bz : miso_;
   assign reset = 0;

   spi_slave #(.SIZE(8)) spi(
			     .clk(clk_8mhz),
			     .sck(sck),
			     .mosi(mosi),
			     .cs(cs),
			     .data_in(spi_out),
			     .data_valid(spi_valid),
			     .miso(miso_),
			     .data_out(rx_data),
			     .cs_d(spi_select)
			     );

   wire 		sig_read, sig_write;
   wire [6:0] 		ram_addr;
   wire [31:0] 		data_read;
   wire [31:0] 		data_write;

   bus_fsm superbus(
		    .clk(clk_8mhz),
		    .spi_in(rx_data),
		    .spi_cs(spi_select),
		    .spi_valid(spi_valid),
		    .ram_in(data_read),
		    .ram_addr(ram_addr),
		    .ram_out(data_write),
		    .ram_read(sig_read),
		    .ram_write(sig_write),
		    .spi_out(spi_out)
		    );

   pmsre pmsre(
	       .clk(clk_8mhz),
	       .reset(reset),
	       .data_in(data_write),
	       .data_out(data_read),
	       .addr(ram_addr),
	       .read(sig_read),
	       .write(sig_write),
	       .m_enable(m_enable),
	       .m_reset(m_reset),
	       .m_dir(m_dir),
	       .m_step(m_step),
	       .m_fault(m_fault),
	       .m_stop(m_stop),
	       .irq(irq)
	       );

endmodule
