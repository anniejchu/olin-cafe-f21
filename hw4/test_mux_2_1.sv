module test_mux_2_1;

logic d0, d1;
logic s; 
wire y;

mux_2_1 UUT(.d0(d0), .d1(d1), .s(s), .y(y));

initial begin
  $dumpvars(0, UUT);
  $dumpfile("mux_2_1.vcd");

  $display("s d0 d1| y");
  for (int i = 0; i < 8; i = i + 1) begin
    s = i[2];
    d1 = i[1];
    d0 = i[0];

    #1 $display("%b %b%b | %b", s, d0, d1, y);
  end
end


endmodule
