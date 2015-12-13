
/*
 https://forums.xilinx.com/t5/Synthesis/How-to-enable-the-new-parser-for-XST-in-ISE-12-1/td-p/133272
 */

module pmsre(clk, reset, data_in, data_out, addr, read, write,
	     m_enable, m_reset, m_dir, m_step, m_fault, m_stop, irq);

   parameter MOTORS = 3;

   localparam POS_REGADDR  = 4'b0000;
   localparam INC_REGADDR  = 4'b0001;
   localparam LEN_REGADDR  = 4'b0010;
   localparam CUR_REGADDR  = 4'b0011;
   localparam DONE_REGADDR = 4'b0100;
   localparam STAT_REGADDR = 4'b0101;
   localparam CTRL_REGADDR = 4'b0110;

   input 	clk;
   input 	reset;
   input [31:0] data_in;
   input [6:0] 	addr;
   input 	read;
   input 	write;
   input [MOTORS-1:0] m_fault;
   input [MOTORS*2-1:0] m_stop;

   output reg [31:0] data_out;
   output [MOTORS-1:0] m_enable;
   output [MOTORS-1:0] m_reset;
   output [MOTORS-1:0] m_dir;
   output [MOTORS-1:0] m_step;
   output 		irq;

   localparam S_IDLE = 2'b00;
   localparam S_RUN  = 2'b01;
   localparam S_DONE = 2'b10;
   reg [1:0]    state = S_IDLE;
   integer 	i;

   reg [31:0]  pos_r[MOTORS-1:0];
   reg [23:0]  inc_r[MOTORS-1:0];
   reg [MOTORS-1:0]   ctrl_men = 3'b000;
   reg [MOTORS*2-1:0] ctrl_stops = 6'b111111;
   reg 		      ctrl_firq = 1'b0;
   reg 		      ctrl_cirq = 1'b0;

   wire [23:0] len_r;
   wire [3:0]  id_r;

   wire [23:0] inc_cur[MOTORS-1:0];
   wire [23:0] len_cur;
   wire [3:0]  id_cur;
   wire        cmd_pop;
   wire        cmd_push;
   wire        cmd_empty;

   wire [23:0] len_done;
   wire [3:0]  id_done;
   wire        done_pop;
   wire        done_push;
   wire        done_empty;
   wire        stop;

   reg [23:0] 			len_dec;

   assign cmd_push = (addr[6:3] == LEN_REGADDR) & write;
   assign done_pop = (addr[6:3] == DONE_REGADDR) & read;
   assign done = (state == S_DONE);
   assign len_r = data_in[23:0];
   assign id_r = data_in[27:24];

   assign m_enable = ~ctrl_men[2:0];
   assign m_reset = 3'b111;
   assign m_step = { pos_r[2][22], pos_r[1][22], pos_r[0][22] };
   assign m_dir = { inc_cur[2][23], inc_cur[1][23], inc_cur[0][23] };
   assign stop = |(ctrl_stops & m_stop[5:0] & { m_dir, ~m_dir });
   assign fault = |(~m_fault & ctrl_men);

   assign irq = (ctrl_cirq & !done_empty) | (ctrl_firq & fault);

   fifo #(.DATA_WIDTH(/* incs */ MOTORS * 24 + /* len */ 24 + /* id */ 4),
	  .ADDR_WIDTH(2))
     fifo_cmd(.clk(clk),
	      .reset(reset),
	      .data_in({inc_r[0], inc_r[1], inc_r[2], len_r, id_r}),
	      .data_out({inc_cur[0], inc_cur[1], inc_cur[2], len_cur, id_cur}),
	      .read(done),
	      .write(cmd_push),
	      .empty(cmd_empty));

   fifo #(.DATA_WIDTH(/* len */ 24 + /* id */ 4),
	  .ADDR_WIDTH(2))
     fifo_done(.clk(clk),
	      .reset(reset),
	      .data_in({len_dec, id_cur}),
	      .data_out({len_done, id_done}),
	      .read(done_pop),
	      .write(done),
	      .empty(done_empty));

   always @(posedge clk)
     begin
	 if (write) begin
	     case (addr[6:3])
	       POS_REGADDR: if (state == S_IDLE)
		 pos_r[addr[2:0]] <= data_in;
	       INC_REGADDR: inc_r[addr[2:0]] <= data_in[23:0];
	       CTRL_REGADDR: begin
		   ctrl_men <= data_in[2:0];
		   ctrl_stops <= { data_in[18:16], data_in[10:8] };
		   ctrl_firq <= data_in[24];
		   ctrl_cirq <= data_in[25];
	       end
	     endcase
	 end

	 if (reset) begin
	     state <= S_IDLE;
	     ctrl_stops <= 6'b111111;
	     ctrl_men <= 3'b000;
	     ctrl_firq <= 0;
	     ctrl_cirq <= 0;
	 end else
	   case (state)
	     S_IDLE: if (!cmd_empty) begin
		 state <= S_RUN;
		 len_dec <= len_cur;
	     end
	     S_RUN: begin
		 if (len_dec == 0 || fault || stop) begin
		     state <= S_DONE;
		 end else begin
		     len_dec <= len_dec - 1;
		     pos_r[0] <= pos_r[0] + {{8{inc_cur[0][23]}}, inc_cur[0]};
		     pos_r[1] <= pos_r[1] + {{8{inc_cur[1][23]}}, inc_cur[1]};
		     pos_r[2] <= pos_r[2] + {{8{inc_cur[2][23]}}, inc_cur[2]};
		 end
	     end
	     S_DONE: begin
		 state <= S_IDLE;
	     end
	 endcase
     end

   always @*
     begin
	 data_out <= 0;
	 case (addr[6:3])
	   POS_REGADDR: data_out <= pos_r[addr[2:0]];
	   INC_REGADDR: data_out <= inc_r[addr[2:0]];
	   CUR_REGADDR: data_out <= { state, id_cur, len_dec };
	   DONE_REGADDR: data_out <= { ~done_empty, id_done, len_done };
	   STAT_REGADDR: data_out <= { 6'b011000, cmd_empty, done_empty,
				       5'b00000, m_stop[5:3],
				       5'b00000, m_stop[2:0],
				       5'b00000, m_fault };
	   CTRL_REGADDR: data_out <= { 6'b000000, ctrl_cirq, ctrl_firq,
				       5'b00000, ctrl_stops[5:3],
				       5'b00000, ctrl_stops[2:0],
				       5'b00000, ctrl_men };
	 endcase
     end

endmodule
