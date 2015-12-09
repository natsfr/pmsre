`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:06:24 04/05/2015 
// Design Name: 
// Module Name:    clock_manager 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clk_manag(
input clk_in,
output clk_out
);

parameter mul = 28;
parameter div = 25;

DCM #(
.CLKDV_DIVIDE(),
.CLKFX_DIVIDE(div),
.CLKFX_MULTIPLY(mul),
.CLKIN_DIVIDE_BY_2("FALSE"),
.CLKIN_PERIOD(10.0),
.CLKOUT_PHASE_SHIFT("NONE"),
.CLK_FEEDBACK("1X"),
.DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"),
.DFS_FREQUENCY_MODE("LOW"),
.DLL_FREQUENCY_MODE("LOW"),
.DUTY_CYCLE_CORRECTION("TRUE"),
.PHASE_SHIFT(0),
.STARTUP_WAIT("FALSE")
) clkgen (
.CLK0(clk0_buf),
.CLK90(),
.CLK180(),
.CLK270(),
.CLK2X(),
.CLK2X180(),
.CLKDV(),
.CLKFX(clk_out_buf),
.CLKFX180(),
.LOCKED(/*locked_status*/),
.CLKFB(clk_fb_buf),
.CLKIN(clk_in),
.RST(/*global_reset*/1'b0),
.PSEN(1'b0)
);

BUFG b1(
.I(clk_out_buf),
.O(clk_out)
);

BUFG b_fb(
.I(clk0_buf),
.O(clk_fb_buf)
);

endmodule
