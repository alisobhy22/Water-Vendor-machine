module Binary_Counter #(parameter n=4)(input clk, reset, UpDown, Inc, output [n-1:0]count);

reg [n-1:0]temp=0;

always @(posedge clk, posedge reset) begin
 if (reset == 1)
 temp <= 3'd0; 
 else begin
    if((UpDown ==1)&&(Inc == 0) )
        temp <= temp-1;
    else if ((UpDown ==1)&&(Inc ==1))
             temp <= temp-2;
           
     else if((UpDown ==0)&&(Inc == 0))
        temp <= temp + 1;
        
     else
            temp <= temp + 2;
           
            end
end
assign count =temp;
endmodule