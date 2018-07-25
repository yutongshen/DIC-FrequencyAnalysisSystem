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

reg signed [15:0] r_data     [0:31];
reg        [20:0] r_data_mul [0:31];
reg        [31:0] data_mul   [0:31];
reg        [20:0] r_out;
reg               fir_valid;
reg        [5:0]  cnt;


integer       i;

always @(posedge clk) begin
    if (~data_valid) cnt <= 6'b0;
    else cnt <= cnt + 6'b1;
end

always @(posedge clk) begin
    if (rst) fir_valid <= 1'b0;
    else     fir_valid <= cnt[5] & cnt[1] | fir_valid;
end

always @(posedge clk) begin
    if (~data_valid) begin
        for (i = 0; i < 32; i = i + 1)
            r_data[i] <= 16'b0;
    end
    else begin
        r_data[0] <= data;
        for (i = 1; i < 32; i = i + 1)
            r_data[i] <= r_data[i - 1];
    end
end

always @(*) begin
    data_mul[0]  = r_data[0]  * FIR_C00;
    data_mul[1]  = r_data[1]  * FIR_C01;
    data_mul[2]  = r_data[2]  * FIR_C02;
    data_mul[3]  = r_data[3]  * FIR_C03;
    data_mul[4]  = r_data[4]  * FIR_C04;
    data_mul[5]  = r_data[5]  * FIR_C05;
    data_mul[6]  = r_data[6]  * FIR_C06;
    data_mul[7]  = r_data[7]  * FIR_C07;
    data_mul[8]  = r_data[8]  * FIR_C08;
    data_mul[9]  = r_data[9]  * FIR_C09;
    data_mul[10] = r_data[10] * FIR_C10;
    data_mul[11] = r_data[11] * FIR_C11;
    data_mul[12] = r_data[12] * FIR_C12;
    data_mul[13] = r_data[13] * FIR_C13;
    data_mul[14] = r_data[14] * FIR_C14;
    data_mul[15] = r_data[15] * FIR_C15;
    data_mul[16] = r_data[16] * FIR_C16;
    data_mul[17] = r_data[17] * FIR_C17;
    data_mul[18] = r_data[18] * FIR_C18;
    data_mul[19] = r_data[19] * FIR_C19;
    data_mul[20] = r_data[20] * FIR_C20;
    data_mul[21] = r_data[21] * FIR_C21;
    data_mul[22] = r_data[22] * FIR_C22;
    data_mul[23] = r_data[23] * FIR_C23;
    data_mul[24] = r_data[24] * FIR_C24;
    data_mul[25] = r_data[25] * FIR_C25;
    data_mul[26] = r_data[26] * FIR_C26;
    data_mul[27] = r_data[27] * FIR_C27;
    data_mul[28] = r_data[28] * FIR_C28;
    data_mul[29] = r_data[29] * FIR_C29;
    data_mul[30] = r_data[30] * FIR_C30;
    data_mul[31] = r_data[31] * FIR_C31;
end

always @(posedge clk) begin
    if (~data_valid) begin
        for (i = 0; i < 32; i = i + 1)
            r_data_mul[i] <= 21'b0;
    end
    else begin
        for (i = 0; i < 32; i = i + 1)
            r_data_mul[i] <= data_mul[i][31:11] + data_mul[i][10];
    end
end

always @(posedge clk) begin
    r_out <= (((((r_data_mul[0] + r_data_mul[1]) + (r_data_mul[2] + r_data_mul[3])) + 
             ((r_data_mul[4] + r_data_mul[5]) + (r_data_mul[6] + r_data_mul[7]))) +
             (((r_data_mul[8] + r_data_mul[9]) + (r_data_mul[10] + r_data_mul[11])) + 
             ((r_data_mul[12] + r_data_mul[13]) + (r_data_mul[14] + r_data_mul[15])))) +
             ((((r_data_mul[16] + r_data_mul[17]) + (r_data_mul[18] + r_data_mul[19])) + 
             ((r_data_mul[20] + r_data_mul[21]) + (r_data_mul[22] + r_data_mul[23]))) +
             (((r_data_mul[24] + r_data_mul[25]) + (r_data_mul[26] + r_data_mul[27])) + 
             ((r_data_mul[28] + r_data_mul[29]) + (r_data_mul[30] + r_data_mul[31])))));
end

assign fir_d = r_out[20:5];

endmodule
