rm -rf ./work
rm -f ./vsim.wlf
rm -f ./transcript

source /software/scripts/init_msim6.2g

vlib work
vcom -93 -work ./work ../tb/clock_gen_abs.vhd
vcom -93 -work ./work ../tb/DATA_MEM.vhd
vcom -93 -work ./work ../tb/INSTR_MEM_abs.vhd
vlog -work ./work ../netlist/RISCV_pipeline_abs.v
vlog -work ./work ../tb/tb_riscv_abs.v

vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp /tb_riscv_abs/UUT=../netlist/RISCV_pipeline_abs.sdf -t 10ps work.tb_riscv_abs

# Run follwing commands on ModelSim
# vcd file ../vcd/RISCV_pipeline_syn_abs.vcd
# vcd add /tb_riscv_abs/UUT/*
# do wave_syn_abs.do
# add wave tb_riscv_abs/UUT/*
# run 3 us
