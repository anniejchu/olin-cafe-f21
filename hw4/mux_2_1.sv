module mux_2_1(d0, d1, s, y);
    
input logic d0, d1;
input logic s;
output logic y;

assign y = (s) ? d1:d0;

endmodule