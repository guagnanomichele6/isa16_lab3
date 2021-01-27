rm -rf ./work
rm -f ./vsim.wlf

source /software/scripts/init_msim6.2g

vlib work
vcom -93 -work ./work ../tb/clock_gen.vhd
vcom -93 -work ./work ../tb/DATA_MEM.vhd
vcom -93 -work ./work ../tb/INSTR_MEM_abs.vhd
vlog -work ./work ../netlist_abs/RISCV_pipeline_abs.v
vlog -work ./work ../tb/tb_riscv_abs.v

vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp /tb_riscv_abs/UUT=../netlist_abs/RISCV_pipeline_abs.sdf work.tb_riscv_abs

