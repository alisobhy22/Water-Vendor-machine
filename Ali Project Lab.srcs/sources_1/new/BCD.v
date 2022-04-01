module BCD (in, temp);
input wire [3:0] in;
//input wire en;
output reg [6:0] temp;
//assign in = 4'b0000; 

            always @(*) begin
            //if (en==1) begin
                case(in)
                    4'b0000:
                    temp = 7'b0000001;
                    4'b0001:
                    temp = 7'b1001111;
                    4'b0010:
                    temp = 7'b0010010;
                    4'b0011:
                    temp = 7'b0000110;
                    4'b0100:
                    temp = 7'b1001100;
                    4'b0101:
                    temp = 7'b0100100;
                    4'b0110:
                    temp = 7'b0100000;
                    4'b0111:
                    temp = 7'b0001111;
                    4'b1000:
                    temp = 7'b0000000;
                    4'b1001:
                    temp = 7'b0000100;
                    4'b1010:
                    temp = 7'b0001000;
                    4'b1011:
                    temp = 7'b1100000;
                    4'b1100:
                    temp = 7'b0110001;
                    4'b1101:
                    temp = 7'b1000010;
                    4'b1110:
                    temp = 7'b0110000;
                    4'b1111:
                    temp = 7'b0111000;
                
                endcase
           //end
end //for the always block
endmodule