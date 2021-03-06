#!/bin/bash

SET_FILE=.synopsys_dc.setup
if [ ! -f "./$SET_FILE" ]; then
	echo "$SET_FILE is not here!"
	exit
fi

rm -rf ./work
mkdir work
rm -f ./command.log
rm -f ./default.svf
rm -f ./elaborate.txt
rm -f ./filenames.log

source /software/scripts/init_synopsys_64.18
vcd2saif -input ../vcd/RISCV_pipeline_syn_abs.vcd -output ../saif/RISCV_pipeline_syn_abs.saif
dc_shell-xg-t -f ./syn_commands_power_report_abs.txt

