//`timescale 1ns

module tb_riscv;

	wire CLK_i;
	wire RST_i;
	wire [63:0] DM_ADDRESSE_i;
	wire [63:0] IM_ADDRESSE_i;
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

	INSTR_MEM IM (
		.ADDRESSE(IM_ADDRESSE_i),
		.INSTR(INSTR_i)
	);

	RISCV UUT (
		.CLK(CLK_i),
		.RST(RST_i),
   		.INSTRUCTION(INSTR_i),
   		.READ_DATA(DATA_in),
   		.MEM_WRITE(MEM_WRITE_i),
		.MEM_READ(MEM_READ_i),
		.DM_ADDRESSE(DM_ADDRESSE_i),
		.IM_ADDRESSE(IM_ADDRESSE_i),
   		.WRITE_DATA(DATA_out)
   	);

	DATA_MEM DM (
		.DATA_IN(DATA_out),
		.CLK(CLK_i),
		.MEM_WRITE(MEM_WRITE_i),
		.MEM_READ(MEM_READ_i),
		.ADDRESSE(DM_ADDRESSE_i),
		.DATA_OUT(DATA_in)
	);

endmodule