rm -rf ./work
rm -f ./vsim.wlf

source /software/scripts/init_msim6.2g

vlib work
vcom -93 -work ./work ../tb/clock_gen.vhd
vcom -93 -work ./work ../tb/DATA_MEM.vhd
vcom -93 -work ./work ../tb/INSTR_MEM.vhd
vlog -work ./work ../netlist/RISCV_pipeline.v
vlog -work ./work ../tb/tb_riscv.v

vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp /tb_riscv/UUT=../netlist/RISCV_pipeline.sdf work.tb_riscv

