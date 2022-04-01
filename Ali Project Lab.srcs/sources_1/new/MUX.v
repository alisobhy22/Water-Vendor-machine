module MUX(input [6:0]sec1,sec2,min1,min2, input [1:0] sel , output reg [6:0] inseg );

always @(*) begin
case(sel)
2'b00:inseg=sec1;
2'b01:inseg=sec2;
2'b10:inseg=min1;
2'b11:inseg=min2;
endcase
end
endmodule
module mux_4_to_1(i,y,sel);
input [3:0]i;
input [1:0]sel;
output y;
assign y=(sel[1])?((sel[0])?i[3]:i[2]):((sel[0])?i[1]:i[0]);
endmodule


module mux4x1_7bits (i0, i1, i2, i3, y, sel);
    input  [6:0]i0, i1, i2, i3 ;
    input  [1:0] sel;
    output [6:0]y;
assign y=(sel[1])?((sel[0])? i3: i2):((sel[0])?i1 : i0);

endmodule