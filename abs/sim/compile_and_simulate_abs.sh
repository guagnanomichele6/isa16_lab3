rm -rf ./work
rm -f ./vsim.wlf
rm -f ./transcript

source /software/scripts/init_msim6.2g

vlib work
vcom -93 -work work ../../src/common/ADDER.vhd
vcom -93 -work work ../../src/common/SUBTRACTOR.vhd
vcom -93 -work work ../../src/common/PC_REG.vhd
vcom -93 -work work ../../src/common/REG_FILE.vhd
vcom -93 -work work ../../src/common/ImmGen.vhd
vcom -93 -work work ../../src/abs/ALU_CONTROL_abs.vhd
vcom -93 -work work ../../src/common/CONTROL.vhd
vcom -93 -work work ../../src/abs/ALU_abs.vhd
vcom -93 -work work ../../src/common/DECODE.vhd
vcom -93 -work work ../../src/abs/EXECUTE_abs.vhd
vcom -93 -work work ../../src/common/FETCH.vhd
vcom -93 -work work ../../src/common/MEM.vhd
vcom -93 -work work ../../src/common/WB.vhd
vcom -93 -work work ../../src/abs/RISCV_pipeline_abs.vhd

vcom -93 -work work ../tb/clock_gen_abs.vhd
vcom -93 -work work ../tb/DATA_MEM.vhd
vcom -93 -work work ../tb/INSTR_MEM_abs.vhd

vlog -work ./work ../tb/tb_riscv_abs.v

vsim -t 10ps work.tb_riscv_abs

# Run follwing commands on ModelSim
# do wave_abs.do
# run 3 us
