module DM#(parameter addr_width = 3,data_width = 64)
(
    input wire clk,
    input wire w,
    input wire [addr_width-1:0] addr,
    input wire [data_width-1:0] din,
    output reg [data_width-1:0] dout
);

reg [data_width-1:0] data_memory[2**addr_width-1:0];

always @(posedge clk)
begin
    if (w == 1) 
	begin
        data_memory[addr] = din;
	end
dout = data_memory[addr];

end

endmodule 
