//Siddharth Singh and Chaitany Pandiya
//17CO146 and 17CO112
//register using Verilog
//1 January 2019
module IM_with_pc(output reg[31:0] q,input clock,reset);
parameter addr_width=4,ins_width=8;
  reg [addr_width-1:0] pc;
  reg [ins_width-1:0] ins_memory[2**addr_width-1:0];
  initial
    begin
      pc=0;
      ins_memory[0]=8'b00000000;
      ins_memory[1]=8'b00000001;
      ins_memory[2]=8'b00000010;
      ins_memory[3]=8'b00000011;
      ins_memory[4]=8'b00000100;
      ins_memory[5]=8'b00000101;
      ins_memory[6]=8'b00000110;
      ins_memory[7]=8'b00000111;
      ins_memory[8]=8'b00001000;
      ins_memory[9]=8'b00001001;
      ins_memory[10]=8'b00001010;
      ins_memory[11]=8'b00001011;
      ins_memory[12]=8'b00001100;
      ins_memory[13]=8'b00001101;
      ins_memory[14]=8'b00001110;
      ins_memory[15]=8'b00001111;
    end
  always @(posedge clock)
    begin
      //$display("Instruction in IM %d",ins_memory[pc]);
      pc=pc+4;
      if(reset)
      begin
        pc=0;
      end
      q[7:0]=ins_memory[pc];
      q[15:8]=ins_memory[pc+1];
      q[23:16]=ins_memory[pc+2];
      q[31:24]=ins_memory[pc+3];
    end
endmodule
