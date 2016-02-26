module mux-in32bit
	(
	input select_in,
	input [31:0] a,
	input [31:0] b,
	output reg [31:0] out
	);
	
	always @(*)
		begin
			out= 32'h00000000;
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