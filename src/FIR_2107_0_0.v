`timescale 1ns/10ps
module FIR(
           data_valid, 
           data, 
           clk, 
           rst,
           fir_valid,
           fir_d);

`include "./dat/FIR_coefficient.dat"

input             data_valid;
input      [15:0] data;
input             clk;
input             rst;
output            fir_valid;
output     [15:0] fir_d;

reg signed [15:0] r_data;
reg        [20:0] r_accum_fwd       [0:31];
reg        [20:0] r_accum_bwd       [0:15];
reg        [31:0] data_mul          [0:15];
wire       [20:0] w_out;
reg               fir_valid;
reg        [5:0]  cnt;

integer       i;

always @(posedge clk) begin
    if (~data_valid) cnt <= 6'b0;
    else cnt <= cnt + 6'b1;
end

always @(posedge clk) begin
    if (rst) fir_valid <= 1'b0;
    else     fir_valid <= cnt[5] & cnt[0] | fir_valid;
end

always @(posedge clk) begin
    if (~data_valid) r_data <= 16'b0;
    else r_data <= data;
end

always @(*) begin
    data_mul[0]  = r_data * FIR_C00;
    data_mul[1]  = r_data * FIR_C01;
    data_mul[2]  = r_data * FIR_C02;
    data_mul[3]  = r_data * FIR_C03;
    data_mul[4]  = r_data * FIR_C04;
    data_mul[5]  = r_data * FIR_C05;
    data_mul[6]  = r_data * FIR_C06;
    data_mul[7]  = r_data * FIR_C07;
    data_mul[8]  = r_data * FIR_C08;
    data_mul[9]  = r_data * FIR_C09;
    data_mul[10] = r_data * FIR_C10;
    data_mul[11] = r_data * FIR_C11;
    data_mul[12] = r_data * FIR_C12;
    data_mul[13] = r_data * FIR_C13;
    data_mul[14] = r_data * FIR_C14;
    data_mul[15] = r_data * FIR_C15;
end 

always @(posedge clk) begin
    if (~data_valid) begin
        for (i = 0; i < 32; i = i + 1) begin
            r_accum_fwd[i]       <= 21'b0;
        end
    end
    else begin
        r_accum_fwd[0]          <= data_mul[0][31:11];
        for (i = 1; i < 16; i = i + 1) begin
            r_accum_fwd[i]       <= r_accum_fwd[i - 1] + data_mul[i][31:11];
        end
        for (i = 16; i < 32; i = i + 1) begin
            r_accum_fwd[i]       <= r_accum_fwd[i - 1];
        end
    end
end

always @(posedge clk) begin
    if (~data_valid) begin
        for (i = 0; i < 16; i = i + 1) begin
            r_accum_bwd[i]       <= 21'b0;
         end
    end
    else begin
        r_accum_bwd[15]          <= data_mul[15][31:11];
        for (i = 0; i < 15; i = i + 1) begin
            r_accum_bwd[i]       <= r_accum_bwd[i + 1] + data_mul[i][31:11];
        end
    end
end

assign w_out   = r_accum_bwd[0] + r_accum_fwd[31];
assign fir_d   = w_out[20:5] + w_out[4];

endmodule
