#!/bin/bash

SET_FILE=.synopsys_dc.setup
if [ ! -f "./$SET_FILE" ]; then
	echo "$SET_FILE is not here!"
	exit
fi

rm -rf ./work/*
rm -f ./command.log
rm -f ./default.svf
rm -f ./elaborate.txt
rm -f ./filenames.log
rm -f ../netlist/RISCV_pipeline.sdf
rm -f ../netlist/RISCV_pipeline.v
rm -f ../netlist/RISCV_pipeline.sdc

source /software/scripts/init_synopsys_64.18
# dc_shell-xg-t -f ./syn_commands.txt
# design_vision &
