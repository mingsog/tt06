`include "defines.v"
`timescale 1ns / 1ns
module sysArray_tb();

    reg CLOCK_50;
    reg rst;
    initial begin
        rst=`RstEnable;
        #27 rst=`RstDisable;
      //  #25000 $stop;
    end
    
    initial begin
        CLOCK_50=1'b0;
        forever #10 CLOCK_50=~CLOCK_50;
    end
    
    reg [7:0] keyin1;
    wire conf;
    reg rconf;
    assign conf = rconf;
   
  

    initial begin
        keyin1=8'b0000_0000;
        #27 keyin1=8'b0001_0100;
        #35 keyin1=8'b0;
        #60 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        rconf=1'b1;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0100;
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0100;
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0100;
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0100;
        #35 keyin1=8'b0;
        #35 keyin1=8'b0;
        #60 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #60 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        rconf=1'b0;
        #60 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #60 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #60 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0100;//3
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0010_0001;//5
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #27 keyin1=8'b0010_0001;//5
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #35 keyin1=8'b0;
        #60 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #60 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #60 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        // round 2
        #35 keyin1=8'b0;
        #60 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #60 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #60 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #60 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0100;//3
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0010_0001;//5
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #27 keyin1=8'b0010_0001;//5
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #60 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #60 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #60 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #60 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0100;//3
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0010_0001;//5
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #27 keyin1=8'b0010_0001;//5
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #35 keyin1=8'b0;
        #60 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #60 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #60 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #35 keyin1=8'b0;
        #60 keyin1=8'b0001_0010;//2
        #35 keyin1=8'b0;
        #60 keyin1=8'b0100_0100;
        #35 keyin1=8'b0;
        #60 keyin1=8'b0100_0010;//0
        #27 keyin1=8'b0100_0010;//0
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
        #27 keyin1=8'b0001_0001;//1
        #35 keyin1=8'b0;
      //  #2500 $stop;
    end



    wire [3:0] cin1;
    wire [3:0] rin1;
    assign cin1=keyin1[3:0];
    assign rin1=keyin1[7:4];


    wire [6:0] seg0;
    wire [6:0] seg1;
    wire [6:0] seg2;
    wire [6:0] seg3;
    wire start;
    wire on;

    sysArray sysArray0(
      .clk(CLOCK_50),
      .rst(rst),
      .conf(conf),
      .rin(rin1),
      .cin(cin1),
      .segout0(seg0),
      .segout1(seg1),
      .segout2(seg2),
      .segout3(seg3),
      .on(on),
      .start(start)
    );

endmodule
