`include "adder.v"
`include "controller.v"
`include "mux.v"
`include "mux-in5.v"
`include "mux-in32"
`include "pc.v"
`include "register.v"
`include "signextender.v"
`include "alu.v"
`include "async_memory.v"
`include "data_memory.v"
`include "inst_rom.v"
`include "serial_buf.v"

module processor(
	input clock,
	input reset,
	input [7:0] serial_in,
	input serial_valid_in,
	input serial_ready_in,
	output serial_rden_out,
	output [7:0] serial_out,
	output serial_wren_out
);

	reg [31:0] pc_start;
	wire[32:0] add_4;
	wire[31:0] inst_out;
	wire[]

	inst_rom ir(.clock(clock),.reset(reset),.addr_in(pc_start),.data_out(inst_out));
	adder ad(.pc_in(pc_start),.sum_out(add_4));
	controller con(.opcode_in([31:25] inst_out),.ALUOp_in([5:0] inst_out),.RegDst());

	initial begin
		pc_start = 32'h003FFFFC;
	end

