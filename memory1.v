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


module memory1#(parameter DATA_WIDTH = 32, LOC = 64, ADD_WIDTH = 4)(
input wclk,
input [DATA_WIDTH-1 :0]din,
input rst,
input ren,
input wen,
output reg [DATA_WIDTH-1 :0]dout1
    );
    
reg [DATA_WIDTH-1 :0]mem1[0:LOC-1]; 
reg [ADD_WIDTH : 0] wctr;
reg [ADD_WIDTH : 0] rctr;

   
always@(posedge wclk)
begin
    if(rst)
        begin
         wctr <= 5'b0;
         rctr <= 5'b0;
         mem1[wctr] <=  0;
         mem1[rctr] <= 0;
         dout1 <= 'b0; 
        end
    else
     begin
                    if(wen)
                        begin
                             mem1[wctr] <= din;
                             wctr <= wctr + 1;                 
                         end            
     end
 end    
 
 always@(posedge wclk)
     begin
     if(ren)
                         begin
                            dout1 <= mem1[rctr];
                            rctr <= rctr + 1;                    
                         end                 
 end 
endmodule
