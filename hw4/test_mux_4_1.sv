module test_mux_4_1;

logic d0, d1, d2, d3;
logic [1:0] s; 
wire y;

mux_4_1 UUT(.d0(d0), .d1(d1), .d2(d2), .d3(d3), .s(s), .y(y));

initial begin
  $dumpvars(0, UUT);
  $dumpfile("mux_4_1.vcd");

  $display("s d0 d1 d2 d3 | y");
  for (int i = 0; i < 64; i = i + 1) begin
    s[1] = i[5];
    s[0] = i[4];
    d3 = i[3];
    d2 = i[2];
    d1 = i[1];
    d0 = i[0];

    #1 $display("%b %b%b%b%b | %b", s, d0, d1, d2, d3, y);
  end
end


endmodule
