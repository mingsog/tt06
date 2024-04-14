`include "defines.v"
module PE(
    input wire clk,
    input wire rst,
    input wire valid,       // keep the reg values if not valid
    input wire conf,        // write weight to PE when enable
    input wire[`DATABUS] in_north,
    input wire[`RESBUS] in_west,


    output wire[`RESBUS] out_east,
    output wire[`DATABUS] out_south
    );

    reg[`DATABUS] weight;
    reg[`RESBUS] result;
    reg[`DATABUS] data; //input data

    // write weight reg when conf==1
    always@(posedge clk) begin
        if(rst==`RstEnable) begin
            weight<=`NONDATA;
        end if(valid==1'b1 && conf==1'b1) begin // config the weight
            weight<=in_north;
        end else begin
            weight<=weight;
        end
    end

    // caculate the conduct of in_north and weight
    always@(posedge clk) begin
        if(rst==`RstEnable) begin
            data<=`NONDATA;
            result<=`NONRES;
        end else if(valid==1'b1 && conf==1'b0) begin
            data<=in_north;
            result<=in_north*weight+in_west;
        end else begin
            data<=data;
            result<=result;
        end//end if
    end

    assign out_east = (conf==1'b1)? `NONRES:result;
    assign out_south = ((conf==1'b1)? weight:data); 

endmodule
