module control
(
	input [5:0] opcode_in,
	input [5:0] ALUOp_in,
	output reg RegDst,
	output reg PCSrc,
	output reg MemRead,
	output reg MemtoReg,
	output reg [5:0] ALUOp_out,
	output reg MemWrite,
	output reg ALUSrc,
	output reg RegWrite,
);

	
	
	always @(*)
		begin
			case(opcode_in)
				begin
				    6'b000000: begin // add,addu,and,break,div,divu,jalr,jr,mfhi,mflo,mthi,mtlo,mult,multu,nor,or,sll,sslv,slt,sltu,sra,srav,srl,srlv,sub,subu,syscall,xor
			            RegDst <= 1'b1;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b0;
			            MemToReg <= 1'b0;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b0;
			            RegWrite <= 1'b1;
			            if ( ALUOp_in == 6'b000000 ) begin
			            	ALUOp_out <= ALUOp_in;
			            end else begin
			            	ALUOp_out <= 6'b100000 ;
			              	end
			         end
			        6'b001000: begin //addi
			        	RegDst <= 1'b0;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b0;
			            MemToReg <= 1'b0;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b1;
			            RegWrite <= 1'b1;
			            ALUOp_out <= 6'b100000;
			        end
			        6'b001001: begin //addiu
			        	RegDst <= 1'b0;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b0;
			            MemToReg <= 1'b0;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b1;
			            RegWrite <= 1'b1;
			            ALUOp_out <= 6'b100000;
			        end
			        6'b001100: begin // andi
			        	RegDst <= 1'b0;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b0;
			            MemToReg <= 1'b0;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b1;
			            RegWrite <= 1'b1;
			            ALUOp_out <= 6'b100100;
			        end
			        6'b000100: begin // beq
			        	RegDst <= 1'bx;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b0;
			            MemToReg <= 1'bx;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b0;
			            RegWrite <= 1'b0;	
			        end
			        6'b000111: begin //bgtz
			        	RegDst <= 1'bx;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b0;
			            MemToReg <= 1'bx;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b0;
			            RegWrite <= 1'b0;
			        end
			        6'b000110: begin // blez
			        	RegDst <= 1'bx;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b0;
			            MemToReg <= 1'bx;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b0;
			            RegWrite <= 1'b0;
			        end
			        6'b000101: begin // bne
			        	RegDst <= 1'bx;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b0;
			            MemToReg <= 1'bx;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b0;
			            RegWrite <= 1'b0;
			        end
			        6'b100000: begin // lb
			        	RegDst <= 1'b0;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b1;
			            MemToReg <= 1'b1;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b0;
			            RegWrite <= 1'b1;
			            ALUOp_out <= 6'b100000;
			        end
			        6'b100100: begin // lbu
			        	RegDst <= 1'b0;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b1;
			            MemToReg <= 1'b1;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b0;
			            RegWrite <= 1'b1;
			            ALUOp_out <= 6'b100000;
			        end
			        6'b100001: begin // lh
			        	RegDst <= 1'b0;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b1;
			            MemToReg <= 1'b1;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b0;
			            RegWrite <= 1'b1;
			            ALUOp_out <= 6'b100000;
			        end
			        6'b100101: begin // lhu
			        	RegDst <= 1'b0;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b1;
			            MemToReg <= 1'b1;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b0;
			            RegWrite <= 1'b1;
			            ALUOp_out <= 6'b100000;
			        end
			        6'b100011: begin // lw
			        	RegDst <= 1'b0;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b1;
			            MemToReg <= 1'b1;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b1;
			            RegWrite <= 1'b1;
			            ALUOp_out <= 6'b100000;
			        end
			        6'b001101: begin // ori
			        	RegDst <= 1'b0;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b0;
			            MemToReg <= 1'b0;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b0;
			            RegWrite <= 1'b1;
			            ALUOp_out <= 6'b100101;
			        end
			        6'b101000: begin // sb
			        	RegDst <= 1'bx;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b0;
			            MemToReg <= 1'bx;
			            MemWrite <= 1'b1;
			            ALUSrc <= 1'b1;
			            RegWrite <= 1'b0;
			            ALUOp_out <= 6'b100000;
			        end
			        6'b001010: begin // slti
			        	RegDst <= 1'b0;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b0;
			            MemToReg <= 1'b0;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b0;
			            RegWrite <= 1'b1;
			            ALUOp_out <= 6'b101000;
			        end
			        6'b001011: begin // sltiu
			        	RegDst <= 1'b0;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b0;
			            MemToReg <= 1'b0;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b0;
			            RegWrite <= 1'b1;
			            ALUOp_out <= 6'b101000;
			        end
			        6'b101001: begin // sh
			        	RegDst <= 1'bx;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b0;
			            MemToReg <= 1'bx;
			            MemWrite <= 1'b1;
			            ALUSrc <= 1'b1;
			            RegWrite <= 1'b0;
			            ALUOp_out <= 6'b100000;
			        end
			        6'b101011: begin // sw
			        	RegDst <= 1'bx;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b0;
			            MemToReg <= 1'bx;
			            MemWrite <= 1'b1;
			            ALUSrc <= 1'b1;
			            RegWrite <= 1'b0;
			            ALUOp_out <= 6'b100000;
			        end
			        6'b001110: begin // xori
			        	RegDst <= 1'b0;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b0;
			            MemToReg <= 1'b0;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b1;
			            RegWrite <= 1'b1;
			            ALUOp_out <= 6'b100000;
			        end
			        6'b000010: begin // j
			        	RegDst <= 1'b0;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b0;
			            MemToReg <= 1'b0;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b0;
			            RegWrite <= 1'b0;
			        end
			        6'b000011: begin // jal
			        	RegDst <= 1'b0;
			            PCSrc <= 1'b0;
			            MemRead <= 1'b0;
			            MemToReg <= 1'b0;
			            MemWrite <= 1'b0;
			            ALUSrc <= 1'b0;
			            RegWrite <= 1'b0;
			        end

			    end    
		    endcase
		end
endmodule

