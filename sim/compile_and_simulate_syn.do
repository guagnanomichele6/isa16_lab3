# cd "C:/Users/Anto/Documents/GitHub/isa16_lab3/sim"

vlib work
vcom -93 -work ./work ../tb/clk_gen.vhd
vcom -93 -work ./work ../tb/DATA_MEM.vhd
vcom -93 -work ./work ../tb/INSTR_MEM.vhd
vlog -work ./work ../netlist/RISCV_pipeline.v
vlog -work ./work ../tb/tb_riscv.v

vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp /tb_riscv/UUT=../netlist/RISCV_pipeline.sdf work.tb_riscv

vcd file ../vcd/RISCV_pipeline_syn.vcd
vcd add /tb_riscv/UUT/*

run 3 us
