module shift_right_logical(in,shamt,out);
parameter N = 32; // only used as a constant! Don't feel like you need to a shifter for arbitrary N.

//port definitions
input  wire [N-1:0] in;    // A 32 bit input
input  wire [$clog2(N)-1:0] shamt; // Amount we shift by.
output logic [N-1:0] out;  // Output.

//concise method
//assign out = in >> shamt;

//
logic [N-1:0] inter0, inter1, inter2, inter3;

always_comb begin : shifty 
    inter0 = shamt[0] ? {1'b0, in[31:1]}: in;
    inter1 = shamt[1] ? {2'b0, inter0[31:2]}: inter0;
    inter2 = shamt[2] ? {4'b0, inter1[31:4]}: inter1;
    inter3 = shamt[3] ? {8'b0, inter2[31:8]}: inter2;
    out = shamt[4] ? {16'b0, inter3[31:16]}: inter3;
    

end


endmodule

