module Splitter (input [14:0] result, output reg[3:0] digit1,output reg[3:0]digit2);
always @ (result) begin
digit1 = result[13:0] % 4'b1010;
digit2 = (result[13:0]/4'b1010) % 4'b1010;

end
endmodule