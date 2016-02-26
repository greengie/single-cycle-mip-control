module mux-in5bit
	(
	input select_in,
	input [4:0] a,
	input [4:0] b,
	output reg [4:0] out
	);
	
	always @(*)
		begin
			out= 5'b00000;
			if(select_in)
				begin
					out = b;
				end
			else
				begin
					out = a;
				end
		end
endmodule