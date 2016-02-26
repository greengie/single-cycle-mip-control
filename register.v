module reg_file
	(
	input 				clk,
	input 				reset,
	input [4:0] 	read_reg1,
	input [4:0] 	read_reg2,
	input [4:0] 	write_reg,
	input 					write_en,
	input [31:0] 	write_data,
	output reg [31:0] 	read_data1,
	output reg [31:0]	read_data2	
	);

	reg [31:0] reg_file [31:0];
	interger i; 
	
	// asynchronous reads
	always @(*)
		begin
			read_data1 = reg_file[read_reg1];
			read_data2 = reg_file[read_reg2];
		end
	
	// synchronous writes; handles $zero register
	always @(posedge clk)
		begin
			if(reset)
				begin
					for(i=0; i < 32;i=i+1)begin
						reg_file[i] <= 0;
					end
				end
			else if(write_en)
				begin
					if(write_reg != 0)
						begin
							reg_file[write_reg] <= write_data;
						end
				end
		end
endmodule