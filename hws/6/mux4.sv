module mux4(in0,in1,in2,in3,switch,out);

//parameter definitions
parameter N = 1;
//port definitions
input  wire [N-1:0] in0;
input  wire [N-1:0] in1;
input  wire [N-1:0] in2;
input  wire [N-1:0] in3;
input  wire [1:0] switch;
output logic [N-1:0] out;

logic [N-1:0] mux0, mux1;
// make 4:1 out of 3 2:1 muxes.
always_comb mux0 = switch[0] ? in1 : in0;
always_comb mux1 = switch[0] ? in3 : in2;
always_comb out = switch[1] ? mux1 : mux0;

endmodule
