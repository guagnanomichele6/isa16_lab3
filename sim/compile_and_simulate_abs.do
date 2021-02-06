# cd "C:/Users/anto7/Documents/GitHub/isa16_lab3/sim"

vlib work
vcom -work work {../src/common/ADDER.vhd}
vcom -work work {../src/abs/ALU_abs.vhd}
vcom -work work {../src/abs/ALU_CONTROL_abs.vhd}
vcom -work work {../src/common/CONTROL.vhd}
vcom -work work {../src/common/DECODE.vhd}
vcom -work work {../src/abs/EXECUTE_abs.vhd}
vcom -work work {../src/common/FETCH.vhd}
vcom -work work {../src/common/ImmGen.vhd}
vcom -work work {../src/common/MEM.vhd}
vcom -work work {../src/common/PC_REG.vhd}
vcom -work work {../src/common/REG_FILE.vhd}
vcom -work work {../src/abs/RISCV_pipeline_abs.vhd}
vcom -work work {../src/common/SUBTRACTOR.vhd}
vcom -work work {../src/common/WB.vhd}

vcom -work work {../tb/clock_gen.vhd}
vcom -work work {../tb/DATA_MEM.vhd}
vcom -work work {../tb/INSTR_MEM_abs.vhd}

vlog -work work {../tb/tb_riscv_abs.v}

vsim work.tb_riscv_abs

do wave_abs.do

configure wave -timelineunits ns
update
run 2.6 us