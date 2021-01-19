# cd "C:/Users/Anto/Documents/GitHub/isa16_lab3/sim"

vlib work
vcom -work work {../src/ADDER.vhd}
vcom -work work {../src/ALU.vhd}
vcom -work work {../src/ALU_CONTROL.vhd}
vcom -work work {../src/COMPARATOR.vhd}
vcom -work work {../src/CONTROL.vhd}
vcom -work work {../src/DECODE.vhd}
vcom -work work {../src/EXECUTE.vhd}
vcom -work work {../src/FETCH.vhd}
vcom -work work {../src/ImmGen.vhd}
vcom -work work {../src/MEM.vhd}
vcom -work work {../src/PC_REG.vhd}
vcom -work work {../src/REG_FILE.vhd}
vcom -work work {../src/RISCV_pipeline.vhd}
vcom -work work {../src/SUBTRACTOR.vhd}
vcom -work work {../src/WB.vhd}

vcom -work work {../tb/clock_gen.vhd}
vcom -work work {../tb/DATA_MEM.vhd}
vcom -work work {../tb/INSTR_MEM.vhd}

vlog -work work {../tb/tb_riscv.v}

vsim work.tb_riscv

add wave -position insertpoint sim:/tb_riscv/*
add wave -position insertpoint sim:/tb_riscv/IM/*
add wave -position insertpoint sim:/tb_riscv/UUT/*
add wave -position insertpoint sim:/tb_riscv/DM/*

configure wave -timelineunits ns
update
run 800 ns