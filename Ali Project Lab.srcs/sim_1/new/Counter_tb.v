module Counter_tb();
reg clk;
reg reset;

wire out;

Counter c(.clk(clk),.reset(reset),.out(out));

always #5 clk = ~clk;
initial begin
clk = 0;
#5
reset = 1;
#1
reset = 0;

end
endmodule