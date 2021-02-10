vcd file ../vcd/RISCV_pipeline_syn.vcd
vcd add /tb_riscv/UUT/*

do wave_syn.do

run 3 us
