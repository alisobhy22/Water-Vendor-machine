module Clock_Divider #(parameter n=50000000) (input clk,rst, output clk_out);
reg [31:0]count;
reg clk_ou=0;

always @(posedge clk, posedge rst) begin
        if (rst == 1'b1)
       count <= 32'b0;
else if (count ==n-1)begin
       count <=32'b0;
   clk_ou<=~clk_ou;
end
else
     count<=count+1;
end
assign clk_out=clk_ou;
endmodule