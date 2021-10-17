module mux_4_1(d0, d1, d2, d3, s, y);
    
input logic d0, d1, d2, d3;
input logic [1:0] s;
output logic y;

assign y  =  s[1] ? (s[0] ? d3 : d2) :(s[0] ? d1 : d0);

endmodule