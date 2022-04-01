//module water_calculator(input [2:0]B,output reg pour, output reg [4:0]am);

//reg [4:0]amount = 4'b0000;
//always @(B)
//begin

//    if(B[0] == 1)
//    begin
//        amount = amount + 10;
//    end
//    if(B[1] == 1)
//    begin
//        amount = amount + 5;
//    end
//    if(B[2] == 1)
//    begin
//        amount = amount + 1;
//    end
//    if(amount >= 20)
//    begin
//        amount = amount - 20;
//        pour = 1;
//    end
//    else
//    begin
//        pour = 0;
//    end

//am[4:0] = amount[4:0];
//end

//endmodule
module water_calculator(input clk,input [2:0]B,input reset,output reg enable,output reg[4:0] am);

reg locked = 1'b0;
reg unlocked = 1'b1;
reg[4:0] amount = 4'b0000;
reg state = 1'b0;
always @(posedge clk,posedge reset) 
begin

case(state)
locked:
        begin
            enable = 0;
            if(B[0] == 1)
                begin
                    amount = amount + 10;
                end
            if(B[1] == 1)
                begin
                    amount = amount + 5;
                end
            if(B[2] == 1)
                begin
                    amount = amount + 1;
                end
            if(amount >= 20) 
                begin
                    amount = amount - 20;
                    state = unlocked;
                end
        end 
unlocked:
    begin
        if(reset == 1)
            begin
                amount = 0;
                state = locked;
                enable = 0;
            end
            else
            begin
                state = unlocked;
                enable = 1;

            end
    end
endcase
am = amount;
end
endmodule