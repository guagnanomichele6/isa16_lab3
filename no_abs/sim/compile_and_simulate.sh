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
vcom -93 -work work ../../src/no_abs/ALU_CONTROL.vhd
vcom -93 -work work ../../src/common/CONTROL.vhd
vcom -93 -work work ../../src/no_abs/ALU.vhd
vcom -93 -work work ../../src/common/DECODE.vhd
vcom -93 -work work ../../src/no_abs/EXECUTE.vhd
vcom -93 -work work ../../src/common/FETCH.vhd
vcom -93 -work work ../../src/common/MEM.vhd
vcom -93 -work work ../../src/common/WB.vhd
vcom -93 -work work ../../src/no_abs/RISCV_pipeline.vhd

vcom -93 -work work ../tb/clock_gen.vhd
vcom -93 -work work ../tb/DATA_MEM.vhd
vcom -93 -work work ../tb/INSTR_MEM.vhd

vlog -work ./work ../tb/tb_riscv.v

vsim -t 10ps work.tb_riscv

# Run follwing commands on ModelSim
# do wave.do
# run 3 us
