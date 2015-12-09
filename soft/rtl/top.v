`timescale 1ns / 1ps

module top(
    input clk,
    input mosi,    
    input sck,
    input cs,
	 output miso,
    output reg [7:0] led,
	 
	 output A10,
	 output A11,
	 output A12,
	 output C10,
	 output A8,
	 output A9
    );
	 
	 wire [7:0] rx_data;
	 wire valid;
	 wire clk_8mhz;
	 wire cs_d;
	
	wire [7:0] spi_out;
	
	clk_manag #(.mul(2), .div(12)) clk_divivded(.clk_in(clk), .clk_out(clk_8mhz));

	spi_slave #(.SIZE(8)) spi(.clk(clk_8mhz), .sck(sck), .mosi(mosi), .cs(cs), .data_in(spi_out), 
										.data_valid(valid), .miso(miso), .data_out(rx_data), .cs_d(cs_d));
	
	wire sig_read, sig_write;
	wire [7:0] ram_addr;
	wire [31:0] data_read;
	wire [31:0] data_write;
	
	bus_fsm superbus(.clk(clk_8mhz), .spi_in(rx_data), .spi_cs(cs_d), .spi_valid(valid), .ram_in(data_read),
									.ram_addr(ram_addr), .ram_out(data_write), .ram_read(sig_read), .ram_write(sig_write), 
									.spi_out(spi_out));
	
	ram ramconfig(.clk(clk_8mhz), .addr(ram_addr), .data_in(data_write), .data_out(data_read),
						.read(sig_read), .write(sig_write));
	
	always @(posedge clk_8mhz)
	begin
		if(valid) led <= rx_data;
	end
	
	assign A9 = clk_8mhz;
	assign A8 = valid;
	assign A10 = mosi;
	assign A11 = miso;
	assign A12 = sck;
	assign C10 = cs;
	
endmodule
