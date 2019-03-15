//Siddharth Singh and Chaitany Pandiya
//17CO146 and 17CO112
//register using Verilog
//1 January 2019
`timescale 1ns/100ps
`include "IM_with_pc.v"
module test_IM;
initial
begin
    $dumpfile("IM_with_pc.vcd");
    $dumpvars(0,test_IM);
end
  wire [31:0] IMout;
  reg clock=1,reset=0;
  IM_with_pc IM(IMout,clock,reset);
  always
  begin
    #20 clock=~clock;
  end
  always
  begin
  #160 reset=~reset;
  end
initial
begin
#2000 $finish;
end
endmodule
