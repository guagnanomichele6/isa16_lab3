//`timescale 1ns

module tb_riscv_abs;

	wire CLK_i;
	wire RST_i;
	wire [63:0] DM_ADDRESS_i;
	wire [63:0] IM_ADDRESS_i;
	wire MEM_WRITE_i;
	wire MEM_READ_i;
	wire SMPL_STAT_i;
	wire [31:0] INSTR_i;
	wire [63:0] DATA_in;
	wire [63:0] DATA_out;

	clk_gen CG (
		.CLK(CLK_i),
		.RST(RST_i)
	);

	INSTR_MEM_abs IM (
		.ADDRESS(IM_ADDRESS_i),
		.INSTR(INSTR_i)
	);

	RISCV_pipeline_abs UUT (
		.CLK(CLK_i),
		.RST(RST_i),
   		.INSTRUCTION(INSTR_i),
   		.DM_READ_DATA(DATA_in),
   		.MEMWRITE_OUT(MEM_WRITE_i),
		.MEMREAD_OUT(MEM_READ_i),
		.DM_ADDRESS(DM_ADDRESS_i),
		.IM_ADDRESS(IM_ADDRESS_i),
   		.DM_WRITE_DATA(DATA_out)
   	);

	DATA_MEM DM (
		.WRITE_DATA(DATA_out),
		.MEM_READ(MEM_READ_i),
		.MEM_WRITE(MEM_WRITE_i),
		.ADDRESS(DM_ADDRESS_i),
		.READ_DATA(DATA_in)
	);

endmodule