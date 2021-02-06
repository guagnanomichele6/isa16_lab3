# cd "C:/Users/anto7/Documents/GitHub/isa16_lab3/sim"

vlib work
vcom -work work {../src/common/ADDER.vhd}
vcom -work work {../src/no_abs/ALU.vhd}
vcom -work work {../src/no_abs/ALU_CONTROL.vhd}
vcom -work work {../src/common/CONTROL.vhd}
vcom -work work {../src/common/DECODE.vhd}
vcom -work work {../src/no_abs/EXECUTE.vhd}
vcom -work work {../src/common/FETCH.vhd}
vcom -work work {../src/common/ImmGen.vhd}
vcom -work work {../src/common/MEM.vhd}
vcom -work work {../src/common/PC_REG.vhd}
vcom -work work {../src/common/REG_FILE.vhd}
vcom -work work {../src/no_abs/RISCV_pipeline.vhd}
vcom -work work {../src/common/SUBTRACTOR.vhd}
vcom -work work {../src/common/WB.vhd}

vcom -work work {../tb/clock_gen.vhd}
vcom -work work {../tb/DATA_MEM.vhd}
vcom -work work {../tb/INSTR_MEM.vhd}

vlog -work work {../tb/tb_riscv.v}

vsim work.tb_riscv

do wave.do

configure wave -timelineunits ns
update
run 2.6 us