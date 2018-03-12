`timescale 1ns/10ps
module FIR(
           data_valid, 
           data, 
           clk, 
           rst,
           fir_valid,
           fir_d);

//`include "./dat/FIR_coefficient.dat"
parameter signed [14:0] FIR_C00 = 15'h7F9E ;     //The FIR_coefficient value 0: -1.495361e-003
parameter signed [14:0] FIR_C01 = 15'h7F86 ;     //The FIR_coefficient value 1: -1.861572e-003
parameter signed [14:0] FIR_C02 = 15'h7FA7 ;     //The FIR_coefficient value 2: -1.358032e-003
parameter signed [14:0] FIR_C03 = 15'h003B ;    //The FIR_coefficient value 3: 9.002686e-004
parameter signed [14:0] FIR_C04 = 15'h014B ;    //The FIR_coefficient value 4: 5.050659e-003
parameter signed [14:0] FIR_C05 = 15'h024A ;    //The FIR_coefficient value 5: 8.941650e-003
parameter signed [14:0] FIR_C06 = 15'h0222 ;    //The FIR_coefficient value 6: 8.331299e-003
parameter signed [14:0] FIR_C07 = 15'h7FE4 ;     //The FIR_coefficient value 7: -4.272461e-004
parameter signed [14:0] FIR_C08 = 15'h7BC5 ;     //The FIR_coefficient value 8: -1.652527e-002
parameter signed [14:0] FIR_C09 = 15'h77CA ;     //The FIR_coefficient value 9: -3.207397e-002
parameter signed [14:0] FIR_C10 = 15'h774E ;     //The FIR_coefficient value 10: -3.396606e-002
parameter signed [14:0] FIR_C11 = 15'h7D74 ;     //The FIR_coefficient value 11: -9.948730e-003
parameter signed [14:0] FIR_C12 = 15'h0B1A ;    //The FIR_coefficient value 12: 4.336548e-002
parameter signed [14:0] FIR_C13 = 15'h1DAC ;    //The FIR_coefficient value 14: 1.159058e-001
parameter signed [14:0] FIR_C14 = 15'h2F9E ;    //The FIR_coefficient value 14: 1.860046e-001
parameter signed [14:0] FIR_C15 = 15'h3AA9 ;    //The FIR_coefficient value 14: 2.291412e-001

input             data_valid;
input      [15:0] data;
input             clk;
input             rst;
output            fir_valid;
output     [15:0] fir_d;

reg signed [15:0] r_data;
reg        [23:0] r_accum_fwd       [0:15];
reg        [23:0] r_accum_bwd       [0:15];
wire       [29:0] data_mul          [0:15];
wire       [23:0] w_out;
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

assign data_mul[0]  = r_data * FIR_C00;
assign data_mul[1]  = r_data * FIR_C01;
assign data_mul[2]  = r_data * FIR_C02;
assign data_mul[3]  = r_data * FIR_C03;
assign data_mul[4]  = r_data * FIR_C04;
assign data_mul[5]  = r_data * FIR_C05;
assign data_mul[6]  = r_data * FIR_C06;
assign data_mul[7]  = r_data * FIR_C07;
assign data_mul[8]  = r_data * FIR_C08;
assign data_mul[9]  = r_data * FIR_C09;
assign data_mul[10] = r_data * FIR_C10;
assign data_mul[11] = r_data * FIR_C11;
assign data_mul[12] = r_data * FIR_C12;
assign data_mul[13] = r_data * FIR_C13;
assign data_mul[14] = r_data * FIR_C14;
assign data_mul[15] = r_data * FIR_C15;

always @(posedge clk) begin
    if (~data_valid) begin
        for (i = 0; i < 16; i = i + 1) begin
            r_accum_fwd[i] <= 24'b0;
        end
    end
    else begin
        r_accum_fwd[0][23:22] <= {2{data_mul[0][29]}};
        r_accum_fwd[0][21:0]  <= data_mul[0][29:8];
        for (i = 1; i < 16; i = i + 1) begin
            r_accum_fwd[i] <= r_accum_fwd[i - 1] + {{2{data_mul[i][29]}}, data_mul[i][29:8]};
        end
    end
end

always @(posedge clk) begin
    if (~data_valid) begin
        for (i = 0; i < 16; i = i + 1) begin
            r_accum_bwd[i] <= 24'b0;
         end
    end
    else begin
        r_accum_bwd[15] <= r_accum_fwd[15] + {{2{data_mul[15][29]}}, data_mul[15][29:8]};
        for (i = 0; i < 15; i = i + 1) begin
            r_accum_bwd[i] <= r_accum_bwd[i + 1] + {{2{data_mul[i][29]}}, data_mul[i][29:8]};
        end
    end
end

assign fir_d = r_accum_bwd[0][23:8] + r_accum_bwd[0][23];

endmodule
