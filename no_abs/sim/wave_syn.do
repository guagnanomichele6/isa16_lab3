add wave -noupdate /tb_riscv/CLK_i
add wave -noupdate /tb_riscv/RST_N_i
add wave -noupdate -divider CG
add wave -noupdate /CG/*
add wave -noupdate -divider MEMs
add wave -noupdate -radix decimal /tb_riscv/DM/mem_d
add wave -noupdate -divider UUT
add wave -noupdate /tb_riscv/UUT/*
