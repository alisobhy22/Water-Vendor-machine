module Display(input clk,RxD, output [6:0] mux_out, output [3:0] decoder_out,output [7:0] RxData,output pour);

    wire clk_out1, clk_out2;
    wire [6:0] ssd_out1, ssd_out2, ssd_out3, ssd_out4;
    wire [1:0] count;
    wire [2:0]B;
    wire[2:0] Be;
    wire [2:0] Bs;
    wire [2:0] Bd;
    wire [4:0] am;
    wire [3:0] digit1_am,digit2_am,digit1_count,digit2_count;
    wire reset,resets,resetd;
    wire water_reset;
    wire [4:0]counter;
    UART #(8'd97)U1 (clk, RxD,out1, B[0]);
    UART #(8'd98)U2 (clk, RxD,out2, B[1]);
    UART #(8'd99)U3 (clk, RxD,out3, B[2]);
    UART #(8'd114)U5 (clk, RxD,out5, reset);
    
    synch ss1(clk_out2,B[0],Bs[0]);
    synch ss2(clk_out2,B[1],Bs[1]);
    synch ss3(clk_out2,B[2],Bs[2]);
    synch ss4(clk_out2,reset,resets);
    
    Debouncer d1(clk_out2,Bs[0],Bd[0]);
    Debouncer d2(clk_out2,Bs[1],Bd[1]);
    Debouncer d3(clk_out2,Bs[2],Bd[2]);
    Debouncer d4(clk_out2,resets,resetd);

    Edge_Detector e1(clk,0,Bd[0],Be[0]);
    Edge_Detector e2(clk,0,Bd[1],Be[1]);
    Edge_Detector e3(clk,0,Bd[2],Be[2]);
    
    
  Clock_Divider #(500000) cd1(clk, 0, clk_out2);    //100 hz
  Clock_Divider #(50000000) cd2 (clk, 0, clk_out1);  // 1 hz
  
  water_calculator wc1 (clk,Be,water_reset,pour,am);
  Counter c(clk_out1,resetd,water_reset,counter);
  Splitter sp(am,digit1_am,digit2_am);
  Splitter sp2(counter,digit1_count,digit2_count);
       
    BCD s1 (digit1_am, ssd_out1);
    BCD s3 (digit2_am, ssd_out2);
    BCD s2 (digit1_count, ssd_out3);
    BCD s4 (digit2_count, ssd_out4);


    Binary_Counter  #(2) nc(clk_out2, rst, 0, 0, count );    
    Decoder decod (count, decoder_out);
    MUX our_mux (ssd_out1, ssd_out2, ssd_out3, ssd_out4, count, mux_out);
endmodule