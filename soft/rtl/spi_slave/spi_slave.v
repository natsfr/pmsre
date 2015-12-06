module spi_slave(clk,reset,sck,mosi,cs,data_in,data_valid,miso,data_out,cs_d);
					
parameter SIZE = 8;

input clk;
input reset;
input sck;
input mosi;
input cs;
input [SIZE-1:0] data_in;

output reg data_valid = 0;
output miso;
output reg [SIZE-1:0] data_out;
output reg cs_d = 0;

reg [2:0] sck_edge = 3'd0;
reg mosi_d = 0;

reg [4:0]counter = 5'b0;

reg [SIZE-1:0] data_out_q = 0;
reg [SIZE-1:0] data_in_q = 0;

wire r_edge, f_edge;

assign r_edge = (sck_edge == 3'b001);
assign f_edge = (sck_edge == 3'b110);

always @(posedge clk)
begin
	if(reset) begin

	end else begin
		sck_edge <= {sck_edge[1:0], sck};
		mosi_d <= mosi;
		cs_d <= cs;
	end
end

reg nop = 0;

assign miso = data_in_q[7];

always @(posedge clk)
begin
	if(cs == 1'b0) begin
		case(sck_edge)
			3'b001: begin // Rising EDGE
						data_out_q = {data_out_q[SIZE-2:0], mosi_d};
						if(counter == SIZE-1) begin
							counter = 5'b0;
							data_out = data_out_q;
							data_valid = 1'b1;
						end else begin
							counter = counter + 5'b1;
							data_valid = 1'b0;
						end
					end
			3'b110: begin // Falling EDGE
						data_in_q = {data_in_q[SIZE-2:0], 1'b0};
						if((counter == 0) && data_valid) begin
							data_in_q = data_in;
						end
					end
			default: nop = 1'b1;
		endcase
	end else begin
		counter = 5'd0;
		data_out_q = 0;
		data_out = 0;
	end
end

endmodule