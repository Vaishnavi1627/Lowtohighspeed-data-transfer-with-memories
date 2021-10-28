`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 27.10.2021 10:28:06
// Design Name:
// Module Name: testbench
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


module testbench#(parameter DATA_WIDTH = 32, LOC = 64, ADD_WIDTH = 4)(  );
   
reg wclk;
reg wen1;
reg ren1;
reg wen2;
reg ren2;
reg rclk;
reg rst;
reg  [DATA_WIDTH-1 :0]din;
wire [DATA_WIDTH-1 :0]dout1;
wire [DATA_WIDTH-1 :0]dout2;
wire [DATA_WIDTH-1 :0]dout;
wire pe;

top tb(.wclk(wclk),.wen1(wen1),.ren1(ren1),.wen2(wen2),.ren2(ren2),.rclk(rclk),
.rst(rst),.din(din),.dout1(dout1),.dout2(dout2),.dout(dout),.pe(pe));

    initial
    begin
    #5     wclk =1'b0; rst = 1; wen1 = 0; ren1 = 0; wen2 =0; ren2 = 0; rcp = 5 ; wcp = 20;
    #5     rclk =1'b0;
    #50    rst = 0;
    #10    wen1 = 1;
    #30    ren1 = 1;
    #35    wen2 = 1;
    #45    ren2 = 1;    
    end
  
   
    initial
    begin
    wclk =1'b0;
//    #2
    rclk =1'b0; rcp = 5 ; wcp = 36;
    end
    
    real rcp,wcp;
    integer i,j;
    
    always@(pe)
    if(rst)
         rcp = rcp;
    
    else
       begin
            for(i = 0; i <100; i=i+1)
            begin
            @(posedge pe)
            rcp = rcp + 6;
            end
        end
    
    always@(pe)
    begin
        for(j = 0; j <100; j=j+1)
        begin
        @(posedge pe)
          wcp = wcp + 18;
        end
    end
   
    always #(wcp) wclk= ~wclk;
    always #(rcp)rclk= ~rclk;

 
//    always #27 wclk= ~wclk;
//    always #8  rclk= ~rclk;
   
    initial
    begin
        repeat (1000)
            @(posedge wclk)
            din = $random;
    end
   
endmodule

