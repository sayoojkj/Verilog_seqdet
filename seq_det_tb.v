`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2023 19:09:07
// Design Name: 
// Module Name: seq_det_tb
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


module seq_test;
  reg clk,x,rst;
  wire z;
  seq_det dut(clk,x,rst,z);
  always #5 clk=~clk;
  initial begin
    $dumpfile("seqrst.vcd");
    $dumpvars(0);
    clk=1'b0;
    rst=1'b1;
    #5 rst=1'b0;
  end
  initial begin
    #2 x=0; #10 x=1; #10 x=1; #10 x=0;
      #10 x=1; #10 x=1; #10 x=0; #10 x=1;
  	  #10 $finish;
  end
  initial begin
    $monitor("x = %b, z = %b", x, z);
  end
endmodule