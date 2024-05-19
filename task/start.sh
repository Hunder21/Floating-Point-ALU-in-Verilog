#! /bin/bash
vlib work
if ! vlog Addition-Subtraction.v FloatAdder.sv Priority\ Encoder.v tb.sv 
    then
    echo "COMPILATION ERROR"
    exit 1
    fi
vsim -voptargs=+acc work.testbench -do questa.tcl