module bus_fsm(
			input clk,
			input [7:0] spi_in,
			input spi_cs,
			input spi_valid,
			input [31:0] ram_in,
			output reg [31:0] ram_out,
			output reg [6:0] ram_addr,
			output reg ram_read,
			output reg ram_write,
			output reg [7:0] spi_out);

	parameter IDLE  = 4'b1000;
	parameter RAM_R = 4'b1001;
	parameter RAM_W = 4'b1010;
	parameter R0 = 4'b0000;
	parameter R1 = 4'b0001;
	parameter R2 = 4'b0010;
	parameter R3 = 4'b0011;
	parameter W0 = 4'b0100;
	parameter W1 = 4'b0101;
	parameter W2 = 4'b0110;
	parameter W3 = 4'b0111;
	
	reg [3:0]state;
	
	reg valid_d = 0;
	
	reg [6:0] addr = 0;
	reg [31:0] out = 0;
	
	wire valid_strobe;
	assign valid_strobe = (!valid_d & spi_valid);

	always @(posedge clk)
	begin
		valid_d <= spi_valid;
		if(spi_cs) begin
			state <= IDLE;
		end else begin
				case(state)
					IDLE: 
					if(valid_strobe) begin
						state <= (spi_in[7]) ? W0 : RAM_R;
						addr <= spi_in[6:0];
					end
					RAM_R:
					begin
						state <= R0;
					end
					R0:
					if(valid_strobe) begin
						state <= R1;
					end
					R1:
					if(valid_strobe) begin
						state <= R2;
					end
					R2:
					if(valid_strobe) begin
						state <= R3;
					end
					R3:
					if(valid_strobe) begin
						state <= IDLE;
					end
					W0:
					if(valid_strobe) begin
						state <= W1;
						out[31:24] <= spi_in;
					end
					W1:
					if(valid_strobe) begin
						state <= W2;
						out[23:16] <= spi_in;
					end
					W2:
					if(valid_strobe) begin
						state <= W3;
						out[15:8] <= spi_in;
					end
					W3:
					if(valid_strobe) begin
						state <= RAM_W;
						out[7:0] <= spi_in;
					end
					RAM_W:
					begin
						state <= IDLE;
					end
				endcase
		end
	end
	
	always @*
	begin
		ram_read = 0;
		ram_write = 0;
		ram_addr = addr;
		ram_out = out;
		spi_out = 0;
		case(state)
			IDLE: begin
			end
			RAM_R: begin
				ram_read = 0;
			end
			R0: begin
				ram_read = 1;
				spi_out = ram_in[31:24];
			end
			R1: begin
				ram_read = 1;
				spi_out = ram_in[23:16];
			end
			R2: begin
				ram_read = 1;
				spi_out = ram_in[15:8];
			end
			R3: begin
				ram_read = 1;
				spi_out = ram_in[7:0];
			end
			RAM_W: begin
				ram_write = 1;
			end
		endcase
	end

endmodule
