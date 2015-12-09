module ram (
clk,
addr,
data_in,
data_out,
read,
write
); 

parameter DATA_WIDTH = 32 ;
parameter ADDR_WIDTH = 5 ;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;
 
input                  clk;
input [ADDR_WIDTH-1:0] addr;
input                  read;
input                  write;

input [DATA_WIDTH-1:0]  data_in;

output reg [DATA_WIDTH-1:0] data_out ;

reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH-1];

always @ (posedge clk)
begin : MEM_WRITE
   if ( write ) begin
       mem[addr] = data_in;
   end
end

always @ (posedge clk)
begin : MEM_READ
  if (read) begin
    data_out = mem[addr];
  end
end

endmodule

