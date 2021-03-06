# add wave -noupdate -divider MEMs
# add wave -noupdate -radix decimal /tb_riscv_abs/DM/mem_d
# add wave -noupdate -divider UUT
# add wave -noupdate /tb_riscv_abs/UUT/*

add wave -noupdate /tb_riscv_abs/CLK_i
add wave -noupdate /tb_riscv_abs/RST_N_i
add wave -noupdate /CG/end_sim
add wave -noupdate -divider PC
# add wave -noupdate -radix hexadecimal /tb_riscv_abs/UUT/PC_OUT
# add wave -noupdate -radix hexadecimal /tb_riscv_abs/UUT/PC_1
add wave -noupdate -radix hexadecimal /tb_riscv_abs/UUT/PC_1_OUT
add wave -noupdate -radix hexadecimal /tb_riscv_abs/UUT/PC_2
add wave -noupdate -divider INSTR
add wave -noupdate -radix hexadecimal /tb_riscv_abs/UUT/INSTRUCTION
# add wave -noupdate -radix hexadecimal /tb_riscv_abs/UUT/INSTRUCTION_OUT
add wave -noupdate -radix hexadecimal /tb_riscv_abs/UUT/INSTRUCTION_1
add wave -noupdate -divider IMEM
add wave -noupdate -radix hexadecimal /tb_riscv_abs/IM/*
add wave -noupdate -divider DMEM
add wave -noupdate -radix decimal /tb_riscv_abs/DM/*
add wave -noupdate -divider MEMEs
# add wave -noupdate -radix decimal /tb_riscv_abs/UUT/ID_STAGE/RF/MEM
add wave -noupdate -radix decimal /tb_riscv_abs/DM/mem_d
add wave -noupdate /tb_riscv_abs/UUT/MEMWRITE
add wave -noupdate /tb_riscv_abs/UUT/MEMWRITE_1
# add wave -noupdate /tb_riscv_abs/UUT/MEMWRITE_2
add wave -noupdate /tb_riscv_abs/UUT/MEMWRITE_OUT
# add wave -noupdate -divider ALU
# add wave -noupdate /tb_riscv_abs/UUT/EX_STAGE/ALU_DP/A
# add wave -noupdate /tb_riscv_abs/UUT/EX_STAGE/ALU_DP/B
# add wave -noupdate /tb_riscv_abs/UUT/EX_STAGE/ALU_DP/ALU_OPERATION
# add wave -noupdate /tb_riscv_abs/UUT/EX_STAGE/ALU_DP/ZERO
# add wave -noupdate /tb_riscv_abs/UUT/EX_STAGE/ALU_DP/ALU_RESULT
# add wave -noupdate /tb_riscv_abs/UUT/EX_STAGE/ALU_DP/ALU_RESULT_PROV
# add wave -noupdate /tb_riscv_abs/UUT/EX_STAGE/ALU_DP/ALU_RESULT_PROV_1
# add wave -noupdate /tb_riscv_abs/UUT/EX_STAGE/ALU_DP/ALU_RESULT_PROV_2
# add wave -noupdate /tb_riscv_abs/UUT/EX_STAGE/ALU_DP/ALU_RESULT_PROV_3
# add wave -noupdate /tb_riscv_abs/UUT/EX_STAGE/ALU_DP/ALU_RESULT_PROV_4
# add wave -noupdate /tb_riscv_abs/UUT/EX_STAGE/ALU_DP/ALU_RESULT_PROV_5
# add wave -noupdate /tb_riscv_abs/UUT/EX_STAGE/ALU_DP/ALU_RESULT_PROV_6
# add wave -noupdate /tb_riscv_abs/UUT/EX_STAGE/ALU_DP/ALU_RESULT_PROV_7
# add wave -noupdate /tb_riscv_abs/UUT/EX_STAGE/ALU_DP/MASK
# add wave -noupdate /tb_riscv_abs/UUT/EX_STAGE/ALU_DP/TMP_ABS
# add wave -noupdate /tb_riscv_abs/UUT/EX_STAGE/ALU_DP/SHIFT
# add wave -noupdate /tb_riscv_abs/UUT/EX_STAGE/ALU_DP/ZERO1
# add wave -noupdate /tb_riscv_abs/UUT/EX_STAGE/ALU_DP/ZERO2


