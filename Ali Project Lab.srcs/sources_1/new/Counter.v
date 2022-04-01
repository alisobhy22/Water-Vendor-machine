module Counter (input clk, input reset, output out,output [4:0]count);

reg[4:0]temp = 0;
reg tout;

always @(posedge clk,posedge reset) begin
        temp = temp +1;
if(temp == 5'b11110)
begin
temp <= 3'd0;
tout = 1;
end
else if (reset == 1)
begin
 temp <= 3'd0; 
 tout = 1;
 end
else 
begin
tout = 0;
end
end
assign out = tout;
assign count = temp;
endmodule