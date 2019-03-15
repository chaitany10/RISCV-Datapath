//Siddharth Singh and Chaitany Pandiya
//17CO146 and 17CO112
//register using Verilog
//1 January 2019
`timescale 1ns/100ps
`include "dm.v"
module test_DM;
reg clock=1;
reg w=0;
reg [63:0]din;
wire [63:0]dout;
reg [2:0]addr;

DM d1(clock,w,addr,din,dout);
initial begin
$dumpfile("dm_tb.vcd");
$dumpvars(0,test_DM);
end
always
  begin
    #50 clock=~clock;
  end
initial begin
$display("Write operation to first memory,writing ABCD");
w=1;
din=16'hABCD;
addr=0;
#100;
$display("Write operation to second memory,writing EFEE");
w=1;
din=16'hEFEE;
addr=1;
#100;
$display("Write operation to fifth memory,writing 12345678");
w=1;
din=64'h12345678;
addr=4;
#100;
$display("Read operation to first memory");
w=0;
addr=0;
#100;
$display("Read operation to second memory");
w=0;
addr=1;
#100;
$display("Read operation to fifth memory");
w=0;
addr=4;
#100;
#800 $finish;
end


endmodule



