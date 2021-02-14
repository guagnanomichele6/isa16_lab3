# add wave -noupdate -divider MEMs
# add wave -noupdate -radix decimal /tb_riscv/DM/mem_d
# add wave -noupdate -divider UUT
# add wave -noupdate /tb_riscv/UUT/*

add wave -noupdate /tb_riscv/CLK_i
add wave -noupdate /tb_riscv/RST_N_i
add wave -noupdate /CG/end_sim
add wave -noupdate -divider PC
# add wave -noupdate -radix hexadecimal /tb_riscv/UUT/PC_OUT
# add wave -noupdate -radix hexadecimal /tb_riscv/UUT/PC_1
add wave -noupdate -radix hexadecimal /tb_riscv/UUT/PC_1_OUT
add wave -noupdate -radix hexadecimal /tb_riscv/UUT/PC_2
add wave -noupdate -divider INSTR
add wave -noupdate -radix hexadecimal /tb_riscv/UUT/INSTRUCTION
# add wave -noupdate -radix hexadecimal /tb_riscv/UUT/INSTRUCTION_OUT
add wave -noupdate -radix hexadecimal /tb_riscv/UUT/INSTRUCTION_1
add wave -noupdate -divider IMEM
add wave -noupdate -radix hexadecimal /tb_riscv/IM/*
add wave -noupdate -divider DMEM
add wave -noupdate -radix decimal /tb_riscv/DM/*
add wave -noupdate -divider MEMEs
# add wave -noupdate -radix decimal /tb_riscv/UUT/ID_STAGE/RF/MEM
add wave -noupdate -radix decimal /tb_riscv/DM/mem_d
add wave -noupdate /tb_riscv/UUT/MEMWRITE
add wave -noupdate /tb_riscv/UUT/MEMWRITE_1
# add wave -noupdate /tb_riscv/UUT/MEMWRITE_2
add wave -noupdate /tb_riscv/UUT/MEMWRITE_OUT
# add wave -noupdate -divider ALU
# add wave -noupdate /tb_riscv/UUT/EX_STAGE/ALU_DP/A
# add wave -noupdate /tb_riscv/UUT/EX_STAGE/ALU_DP/B
# add wave -noupdate /tb_riscv/UUT/EX_STAGE/ALU_DP/ALU_OPERATION
# add wave -noupdate /tb_riscv/UUT/EX_STAGE/ALU_DP/ZERO
# add wave -noupdate /tb_riscv/UUT/EX_STAGE/ALU_DP/ALU_RESULT
# add wave -noupdate /tb_riscv/UUT/EX_STAGE/ALU_DP/ALU_RESULT_PROV
# add wave -noupdate /tb_riscv/UUT/EX_STAGE/ALU_DP/ALU_RESULT_PROV_1
# add wave -noupdate /tb_riscv/UUT/EX_STAGE/ALU_DP/ALU_RESULT_PROV_2
# add wave -noupdate /tb_riscv/UUT/EX_STAGE/ALU_DP/ALU_RESULT_PROV_3
# add wave -noupdate /tb_riscv/UUT/EX_STAGE/ALU_DP/ALU_RESULT_PROV_4
# add wave -noupdate /tb_riscv/UUT/EX_STAGE/ALU_DP/ALU_RESULT_PROV_5
# add wave -noupdate /tb_riscv/UUT/EX_STAGE/ALU_DP/ALU_RESULT_PROV_6
# add wave -noupdate /tb_riscv/UUT/EX_STAGE/ALU_DP/SHIFT
# add wave -noupdate /tb_riscv/UUT/EX_STAGE/ALU_DP/ZERO1
# add wave -noupdate /tb_riscv/UUT/EX_STAGE/ALU_DP/ZERO2

