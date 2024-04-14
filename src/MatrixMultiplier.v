`include "defines.v"
module MatrixMultiplier(
    input wire clk,
    input wire rst,      // Synchronous reset
    //input wire new,      // start a new multiply(pipeline)
    input wire start,
    input wire conf,
    input wire[`DATABUS] data_in0,
    input wire[`DATABUS] data_in1,
    input wire[`DATABUS] data_in2,
    input wire[`DATABUS] data_in3,
    output wire[`RESBUS] result0,
    output wire[`RESBUS] result1,
    output wire[`RESBUS] result2,
    output wire[`RESBUS] result3
    );

    wire[`RESBUS] pe_east[0:15];
    wire[`DATABUS] pe_south[0:15];
    wire[`RESBUS] dum;
    wire rst0;
   // assign rst0 = rst&new;
    assign dum = `NONRES;

    PE pe_0(.clk(clk),.rst(rst),.valid(start),.conf(conf),.in_north(data_in0),.in_west(dum),.out_east(pe_east[0]),.out_south(pe_south[0]));
    PE pe_1(.clk(clk),.rst(rst),.valid(start),.conf(conf),.in_north(data_in1),.in_west(pe_east[0]),.out_east(pe_east[1]),.out_south(pe_south[1]));
    PE pe_2(.clk(clk),.rst(rst),.valid(start),.conf(conf),.in_north(data_in2),.in_west(pe_east[1]),.out_east(pe_east[2]),.out_south(pe_south[2]));
    PE pe_3(.clk(clk),.rst(rst),.valid(start),.conf(conf),.in_north(data_in3),.in_west(pe_east[2]),.out_east(pe_east[3]),.out_south(pe_south[3]));
    PE pe_4(.clk(clk),.rst(rst),.valid(start),.conf(conf),.in_north(pe_south[0]),.in_west(dum),.out_east(pe_east[4]),.out_south(pe_south[4]));
    PE pe_5(.clk(clk),.rst(rst),.valid(start),.conf(conf),.in_north(pe_south[1]),.in_west(pe_east[4]),.out_east(pe_east[5]),.out_south(pe_south[5]));
    PE pe_6(.clk(clk),.rst(rst),.valid(start),.conf(conf),.in_north(pe_south[2]),.in_west(pe_east[5]),.out_east(pe_east[6]),.out_south(pe_south[6]));
    PE pe_7(.clk(clk),.rst(rst),.valid(start),.conf(conf),.in_north(pe_south[3]),.in_west(pe_east[6]),.out_east(pe_east[7]),.out_south(pe_south[7]));
    PE pe_8(.clk(clk),.rst(rst),.valid(start),.conf(conf),.in_north(pe_south[4]),.in_west(dum),.out_east(pe_east[8]),.out_south(pe_south[8]));
    PE pe_9(.clk(clk),.rst(rst),.valid(start),.conf(conf),.in_north(pe_south[5]),.in_west(pe_east[8]),.out_east(pe_east[9]),.out_south(pe_south[9]));
    PE pe_10(.clk(clk),.rst(rst),.valid(start),.conf(conf),.in_north(pe_south[6]),.in_west(pe_east[9]),.out_east(pe_east[10]),.out_south(pe_south[10]));
    PE pe_11(.clk(clk),.rst(rst),.valid(start),.conf(conf),.in_north(pe_south[7]),.in_west(pe_east[10]),.out_east(pe_east[11]),.out_south(pe_south[11]));
    PE pe_12(.clk(clk),.rst(rst),.valid(start),.conf(conf),.in_north(pe_south[8]),.in_west(dum),.out_east(pe_east[12]),.out_south(pe_south[12]));
    PE pe_13(.clk(clk),.rst(rst),.valid(start),.conf(conf),.in_north(pe_south[9]),.in_west(pe_east[12]),.out_east(pe_east[13]),.out_south(pe_south[13]));
    PE pe_14(.clk(clk),.rst(rst),.valid(start),.conf(conf),.in_north(pe_south[10]),.in_west(pe_east[13]),.out_east(pe_east[14]),.out_south(pe_south[14]));
    PE pe_15(.clk(clk),.rst(rst),.valid(start),.conf(conf),.in_north(pe_south[11]),.in_west(pe_east[14]),.out_east(pe_east[15]),.out_south(pe_south[15]));

    assign result0 = pe_east[3];  
    assign result1 = pe_east[7];  
    assign result2 = pe_east[11]; 
    assign result3 = pe_east[15]; 

endmodule
