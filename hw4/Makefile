# -Wall turns on all warnings
# -g2012 selects the 2012 version of iVerilog
IVERILOG=iverilog -Wall -g2012 -y ./ -I ./
VVP=vvp

# Look up .PHONY rules for Makefiles
.PHONY: clean

# Call this to clean up all your generated files
clean:
	rm -f *.bin *.vcd vivado*.log vivado*.jou vivado*.str

test_adder_1 : test_adder_1.sv adder_1.sv
	${IVERILOG} $^ -o test_adder_1.bin && ${VVP} test_adder_1.bin 

test_adder_n : test_adder_n.sv adder_1.sv adder_n.sv
	${IVERILOG} $^ -o test_adder_n.bin && ${VVP} test_adder_n.bin 

test_mux_4_1 : test_mux_4_1.sv mux_4_1.sv 
	${IVERILOG} $^ -o test_mux_4_1.bin && ${VVP} test_mux_4_1.bin 

test_mux_2_1 : test_mux_2_1.sv mux_2_1.sv 
	${IVERILOG} $^ -o test_mux_2_1.bin && ${VVP} test_mux_2_1.bin 
