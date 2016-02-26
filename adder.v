module adder
	(
	input [31:0] pc_in,
	output reg [32:0] sum_out
	);
	
	always @(*)
		begin
			sum_out = pc_in + 4;
		end
endmodule