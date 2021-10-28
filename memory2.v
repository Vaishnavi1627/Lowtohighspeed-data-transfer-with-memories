`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2021 11:52:39
// Design Name: 
// Module Name: memory1
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

module memory2#(parameter DATA_WIDTH = 32, LOC = 64, ADD_WIDTH = 4)(
input rclk,
input [DATA_WIDTH-1 :0]din,
input rst,
input ren,
input wen,
output reg [DATA_WIDTH-1 :0]dout
    );
    
reg [DATA_WIDTH-1 :0]mem2[0:LOC-1]; 
reg [ADD_WIDTH : 0] wctr2;
reg [ADD_WIDTH : 0] rctr2;

   
always@(posedge rclk)
begin
    if(rst)
        begin
         wctr2 <= 5'b0;
         rctr2 <= 5'b0;
         mem2[wctr2] <=  0;
         mem2[rctr2] <= 0;
         dout <= 'b0; 
        end
    else
     begin
                    if(wen)
                        begin
                             mem2[wctr2] <= din;
                             wctr2 <= wctr2 + 1;                 
                         end            
     end
 end    
 
 always@(posedge rclk)
     begin
     if(ren)
                         begin
                            dout <= mem2[rctr2];
                            rctr2 <= rctr2 + 1;                    
                         end                 
 end 
endmodule
