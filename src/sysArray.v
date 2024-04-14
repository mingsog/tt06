`include "defines.v"
module sysArray(
    input wire clk,
    input wire rst,
    input conf,
    input wire[3:0] rin,
    input wire[3:0] cin,
    //display one line of the result each time
    output wire[6:0] segout0,
    output wire[6:0] segout1,
    output wire[6:0] segout2,
    output wire[6:0] segout3,
    output reg start, // light every calculate    
    output wire on // light when turn on
    );

    wire [`DATABUS] key_data;
    wire key_valid;
    keyboard kb(
        .clk(clk),
        .rst(rst),
        .rowin(rin),
        .colin(cin),
        .data(key_data),
        .valid(key_valid)
    );

    wire[`DATABUS] buf_data1;
    wire[`DATABUS] buf_data2;
    wire[`DATABUS] buf_data3;
    wire[`DATABUS] buf_data4;
    wire buf_ready;
    inputbuf buf0(
        .clk(clk),
        .rst(rst),
        .data_in(key_data),
        .valid(key_valid),
        .ready(buf_ready),
        .data1(buf_data1),
        .data2(buf_data2),
        .data3(buf_data3),
        .data4(buf_data4)
    );

    wire[`RESBUS] mm_res0;
    wire[`RESBUS] mm_res1;
    wire[`RESBUS] mm_res2;
    wire[`RESBUS] mm_res3;
    MatrixMultiplier mm(
        .clk(clk),
        .rst(rst),
        .start(buf_ready),
        .conf(conf),
        .data_in0(buf_data1),
        .data_in1(buf_data2),
        .data_in2(buf_data3),
        .data_in3(buf_data4),
        .result0(mm_res0),
        .result1(mm_res1),
        .result2(mm_res2),
        .result3(mm_res3)
    );

    segment seg0(.num_in(mm_res0[3:0]),.seg_display(segout0));
    segment seg1(.num_in(mm_res1[3:0]),.seg_display(segout1));
    segment seg2(.num_in(mm_res2[3:0]),.seg_display(segout2));
    segment seg3(.num_in(mm_res3[3:0]),.seg_display(segout3));
    
    assign on = 1'b1;
    always @(posedge clk) begin
        if(rst==`RstEnable) begin
            start<=1'b0;
        end
        else if(start!=buf_ready)begin
            start<=~start;
        end
        else begin
            start<=start;
        end
    end
    

endmodule
