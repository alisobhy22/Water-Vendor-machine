module Debouncer (input clk, input in, output out);
wire q1,q2,q3;
//DFF d1 (.clk(clk), .in(in), .out(q1));
//DFF d2 (.clk(clk), .in(q1), .out(q2));
//DFF d3 (.clk(clk), .in(q2), .out(q3));
DFF d1 (clk,in,q1);
DFF d2 (clk,q1,q2);
DFF d3 (clk,q2,q3);

assign out = q1&q2&q3;
endmodule