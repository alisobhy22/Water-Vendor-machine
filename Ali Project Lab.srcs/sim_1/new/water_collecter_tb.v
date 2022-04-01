module water_calculator_tb();


reg [2:0]B;
wire enable;
wire [4:0]am;
reg clk;
reg reset;
water_calculator wb(.clk(clk),.B(B),.reset(reset),.enable(enable),.am(am));

always #5 clk = ~clk;
initial begin
clk = 0;
reset = 0;
B[0] = 0;
#1;
B[1] = 0;
#1;
B[2] = 0;
#50;
B[1] = 1;
#10;
B[1] = 0;
#1;
B[0] = 1;
#10;
B[0] = 0;
#10;
B[0] = 1;
#10;
B[0] = 0;
#40 
reset = 1;
end




endmodule