# cd "C:/Users/Anto/Documents/GitHub/isa16_lab3/sim"

vlib work
vcom -93 -work ./work ../tb/clk_gen.vhd
vcom -93 -work ./work ../tb/DATA_MEM.vhd
vcom -93 -work ./work ../tb/INSTR_MEM_abs.vhd
vlog -work ./work ../netlist/RISCV_pipeline_abs.v
vlog -work ./work ../tb/tb_riscv_abs.v

vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp /tb_riscv_abs/UUT=../netlist_abs/RISCV_pipeline_abs.sdf work.tb_riscv_abs

vcd file ../vcd_abs/RISCV_pipeline_syn_abs.vcd
vcd add /tb_riscv_abs/UUT/*

run 3 us
