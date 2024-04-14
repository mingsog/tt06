`include "defines.v"
module inputbuf(
    input wire clk,
    input wire rst,
    input wire [`DATABUS] data_in,
    input wire valid, // one element is ready

    output wire ready, // one line is ready
    output reg[`DATABUS] data1,
    output reg[`DATABUS] data2,
    output reg[`DATABUS] data3,
    output reg[`DATABUS] data4
);

reg[2:0] cnt;
reg cnt0;
assign ready = (cnt[2]==1'b1)&(cnt0==0);
assign data_clip = (data_in == 3)? 2 : data_in;

always @(posedge clk) begin
    if (rst==`RstEnable) begin
        cnt <= 3'b000;
    end
    else if((valid==1'b1) && (cnt!=3'b100)) begin
        cnt <= cnt + 3'b001;
    end else if(valid==1'b1 && cnt==3'b100)begin
        cnt <= 3'b001;
    end else begin
        cnt <= cnt;
    end
end

always @(posedge clk) begin
    if (rst==`RstEnable) begin
        data1 <= `NONDATA;
        data2 <= `NONDATA;
        data3 <= `NONDATA;
        data4 <= `NONDATA;
    end else if (valid==1'b1) begin
        case (cnt)
            3'b000:begin
                data1 <= data_clip;
                data2 <= data2;
                data3 <= data3;
                data4 <= data4;     
            end
            3'b001:begin
                data1 <= data1;
                data2 <= data_clip;
                data3 <= data3;
                data4 <= data4;
            end
            3'b010:begin
                data1 <= data1;
                data2 <= data2;
                data3 <= data_clip;
                data4 <= data4;                
            end
            3'b011:begin
                data1 <= data1;
                data2 <= data2;
                data3 <= data3;
                data4 <= data_clip;
            end
            3'b100:begin
                data1 <= data_clip;
                data2 <= data2;
                data3 <= data3;
                data4 <= data4; 
            end
            default: begin
                data1 <= data1;
                data2 <= data2;
                data3 <= data3;
                data4 <= data4; 
            end
        endcase
    end else begin
        data1 <= data1;
        data2 <= data2;
        data3 <= data3;
        data4 <= data4; 
    end
    
end

always @(posedge clk) begin
    if (rst==`RstEnable) begin
        cnt0 <= 1'b0;
    end
    else begin
        cnt0 <= cnt[2];
    end
end

endmodule