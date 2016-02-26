`define RESET_VAL 32'h003ffffc
module program_counter
	(
	input 				 		 clk,
	input 				 		 reset,
	input [31:0] 		 in,
	output reg [31:0] out
	);
		
	always @(posedge clk)
		begin
			if(reset)
				begin
					out <= `RESET_VAL;
				end
			else
				begin
					out <= in;
				end
		end
endmodule