`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2021 11:29:38
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top#(parameter DATA_WIDTH = 32, LOC = 64, ADD_WIDTH = 4)(
input wclk,
input wen1,
input ren1,
input wen2,
input ren2,
input rclk,
input rst,
input  [DATA_WIDTH-1 :0]din,
output [DATA_WIDTH-1 :0]dout1,
output [DATA_WIDTH-1 :0]dout2,
output [DATA_WIDTH-1 :0]dout,
output pe
);

reg [DATA_WIDTH-1 :0]mem1[0:LOC-1];
reg [DATA_WIDTH-1 :0]mem2[0:LOC-1];
reg [ADD_WIDTH :0] wctr,rctr;

memory1 mema(
.ren(ren1),
.wen(wen1),
.wclk(wclk),
.din(din),
.rst(rst),
.dout1(dout1)
);

ltoh top(
.din(dout1),
.dout(dout2),
.wclk(wclk),
.rclk(rclk),
.pe(pe)
);

memory2 memb(
.ren(ren2),
.wen(wen2),
.rst(rst),
.rclk(rclk),
.din(dout2),
.dout(dout)
);

endmodule
