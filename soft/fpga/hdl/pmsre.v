
/*
 https://forums.xilinx.com/t5/Synthesis/How-to-enable-the-new-parser-for-XST-in-ISE-12-1/td-p/133272
 */

module pmsre(clk, reset, data_in, data_out, addr, read, write,
	     m_enable, m_reset, m_dir, m_step, m_fault, m_stop, em_stop, irq);

   parameter MOTORS = 3;

   localparam POS_REGADDR  = 4'b0000;
   localparam INC_REGADDR  = 4'b0001;
   localparam LEN_REGADDR  = 4'b0010;
   localparam CUR_REGADDR  = 4'b0011;
   localparam DONE_REGADDR = 4'b0100;
   localparam STAT_REGADDR = 4'b0101;
   localparam CTRL_REGADDR = 4'b0110;
   localparam INFO_REGADDR = 4'b0111;

   input 	clk;
   input 	reset;
   input [31:0] data_in;
   input [6:0] 	addr;
   input 	read;
   input 	write;
   input [MOTORS-1:0] m_fault;
   input [MOTORS*2-1:0] m_stop;
   input 		em_stop;

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

   reg [23:0]  pos_r[MOTORS-1:0];
   reg [24:0]  inc_r[MOTORS-1:0];
   reg [MOTORS-1:0]   ctrl_men = 3'b000;
   reg [MOTORS*2-1:0] ctrl_stops = 6'b111111;
   reg 		      ctrl_firq = 1'b0;
   reg 		      ctrl_cirq = 1'b0;
   reg                ctrl_zero = 1'b0;
   reg                ctrl_flush = 1'b0;

   wire [23:0] len_r;
   wire [3:0]  id_r;
   wire [3:0]  speed_r;

   wire [24:0] inc_cur[MOTORS-1:0];
   wire [23:0] len_cur;
   wire [3:0]  id_cur;
   wire [3:0]  speed_cur;

   wire        cmd_pop;
   wire        cmd_push;
   wire        cmd_empty;

   wire [23:0] len_done;
   wire [3:0]  id_done;
   wire        flush_done;
   wire        done_pop;
   wire        done_push;
   wire        done_empty;
   wire        stop;

   reg [23:0]  len_dec;
   reg 	       flush = 0;
   reg [15:0]  scaler = 0;

   assign cmd_push = (addr[6:3] == LEN_REGADDR) & write;
   assign done_pop = (addr[6:3] == DONE_REGADDR) & read;
   assign done = (state == S_DONE);
   assign len_r = data_in[23:0];
   assign id_r = data_in[27:24];
   assign speed_r = data_in[31:28];

   assign m_enable = ~ctrl_men[2:0];
   assign m_reset = ctrl_men[2:0];
   assign m_step = { pos_r[2][23], pos_r[1][23], pos_r[0][23] };
   assign m_dir = { inc_cur[2][24], inc_cur[1][24], inc_cur[0][24] };
   assign move = { |inc_cur[2], |inc_cur[1], |inc_cur[0] };
   assign stop = |(ctrl_stops & m_stop[5:0] & { m_dir, move & ~m_dir });
   assign fault = |(~m_fault & ctrl_men);

   assign irq = (ctrl_cirq & !done_empty) | (ctrl_firq & fault);

   fifo #(.DATA_WIDTH(/* incs */ MOTORS * 25 + /* speed */ 4 + /* len */ 24 + /* id */ 4),
	  .ADDR_WIDTH(2))
     fifo_cmd(.clk(clk),
	      .reset(reset),
	      .data_in({inc_r[0], inc_r[1], inc_r[2], speed_r, len_r, id_r}),
	      .data_out({inc_cur[0], inc_cur[1], inc_cur[2], speed_cur, len_cur, id_cur}),
	      .read(done),
	      .write(cmd_push),
	      .empty(cmd_empty));

   fifo #(.DATA_WIDTH(/* len */ 25 + /* id */ 4 + /* flush */ 1),
	  .ADDR_WIDTH(2))
     fifo_done(.clk(clk),
	      .reset(reset),
	      .data_in({len_dec, id_cur, flush}),
	      .data_out({len_done, id_done, flush_done}),
	      .read(done_pop),
	      .write(done),
	      .empty(done_empty),
	      .full(done_full));

   always @(posedge clk)
     begin
	 if (write) begin
	     case (addr[6:3])
	       POS_REGADDR: if (state == S_IDLE)
		 pos_r[addr[2:0]] <= data_in;
	       INC_REGADDR: inc_r[addr[2:0]] <= data_in[24:0];
	       CTRL_REGADDR: begin
		   ctrl_men <= data_in[2:0];
		   ctrl_stops <= { data_in[18:16], data_in[10:8] };
		   ctrl_firq <= data_in[24];
		   ctrl_cirq <= data_in[25];
		   ctrl_flush <= data_in[30];
		   ctrl_zero <= data_in[31];
	       end
	     endcase
	 end

	 if (reset) begin
	     state <= S_IDLE;
	     ctrl_stops <= 6'b111111;
	     ctrl_men <= 3'b000;
	     ctrl_firq <= 0;
	     ctrl_cirq <= 0;
	     ctrl_zero <= 0;
	     flush <= 0;
	     scaler <= 0;
	 end else
	   scaler <= scaler + 1;
	   case (state)
	     S_IDLE: begin
		 len_dec <= len_cur;
		 if (!cmd_empty && !done_full) begin
		     if (flush)
		       state <= S_DONE;
		     else
		       state <= S_RUN;
		 end else if (cmd_empty && done_empty) begin
		     flush <= 0;
		 end
	     end
	     S_RUN: begin
		 if (fault || stop || ctrl_flush || em_stop) begin
		     flush <= 1;
		     state <= S_DONE;
		 end else if (len_dec == 0)
		     state <= S_DONE;
		 else if ((scaler << speed_cur) == 16'b0) begin
		     len_dec <= len_dec - 1;
		     pos_r[0] <= pos_r[0] + inc_cur[0][23:0];
		     pos_r[1] <= pos_r[1] + inc_cur[1][23:0];
		     pos_r[2] <= pos_r[2] + inc_cur[2][23:0];
		 end
	     end
	     S_DONE: begin
		 state <= S_IDLE;
		 if (ctrl_zero) begin
		     pos_r[0] <= 0;
		     pos_r[1] <= 0;
		     pos_r[2] <= 0;
		 end
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
	   DONE_REGADDR: data_out <= { ~done_empty, 2'b00, flush_done, id_done, len_done };
	   STAT_REGADDR: data_out <= { 5'b00000, em_stop, cmd_empty, done_empty,
				       5'b00000, m_stop[5:3],
				       5'b00000, m_stop[2:0],
				       5'b00000, ~m_fault };
	   CTRL_REGADDR: data_out <= { ctrl_zero, ctrl_flush, 4'b0000, ctrl_cirq, ctrl_firq,
				       5'b00000, ctrl_stops[5:3],
				       5'b00000, ctrl_stops[2:0],
				       5'b00000, ctrl_men };
	   INFO_REGADDR: data_out <= { 8'b00000001, 8'b00000010, 8'h50, 8'h4d };
	 endcase
     end

endmodule
