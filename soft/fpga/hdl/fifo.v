/* -*- tab-width: 4 -*- */

module fifo(clk, reset, data_in, data_out, read, write, empty, full);

   parameter DATA_WIDTH = 32;
   parameter ADDR_WIDTH = 2;
   parameter DEPTH = 1 << ADDR_WIDTH;

   input                  clk;
   input 				  reset;
   input                  read;
   input 				  write;
   input [DATA_WIDTH-1:0] data_in;

   output [DATA_WIDTH-1:0] data_out;
   output 				   empty;
   output 				   full;

   reg [DATA_WIDTH-1:0]    mem[0:DEPTH-1];
   reg [ADDR_WIDTH-1:0]    start = 0;
   reg [ADDR_WIDTH-1:0]    end_ = 0;

   /* last fifo change: 1=toward full, 0=toward empty */
   reg 					   dir = 0;

   wire 				   eq;

   assign eq = (start == end_);
   assign empty = eq & !dir;
   assign full = eq & dir;
   assign data_out = mem[start];

   always @(posedge clk)
     begin
		 if (reset) begin
			 start <= 0;
			 end_ <= 0;
			 dir <= 0;
		 end else begin
			 if (read & !empty) begin
				 start <= start + 1;
			 end
			 if (write & !full) begin
				 end_ <= end_ + 1;
				 mem[end_] <= data_in;
			 end
			 dir <= (dir | write) & (dir | !read) & (write | !read);
		 end
     end

endmodule // fifo
