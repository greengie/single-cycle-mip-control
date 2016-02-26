module sign_extend
	(
	input [15:0] in,
	output reg [31:0] out
	);

	always @(*)
		begin
			if(in[15] == 0)
				begin
					out = {16'b0,in};
				end
			else if(in[15] == 1)
				begin
					out = {16'b1,in};
				end
		end
endmodule