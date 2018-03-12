`include "FFT_PE.v"
module FFT(
           fir_valid,
           fir_d,
           clk,
           rst,
           fft_valid,
           fft_d0,
           fft_d1,
           fft_d2,
           fft_d3,
           fft_d4,
           fft_d5,
           fft_d6,
           fft_d7,
           fft_d8,
           fft_d9,
           fft_d10,
           fft_d11,
           fft_d12,
           fft_d13,
           fft_d14,
           fft_d15);
/*
00000      //The imag part of the reference table about COS(x)+i*SIN(x) value , 0: 000
39E09      //The imag part of the reference table about COS(x)+i*SIN(x) value , 1: -3.826752e-001
34AFC      //The imag part of the reference table about COS(x)+i*SIN(x) value , 2: -7.070923e-001
3137D      //The imag part of the reference table about COS(x)+i*SIN(x) value , 3: -9.238739e-001
30000      //The imag part of the reference table about COS(x)+i*SIN(x) value , 4: -01
3137D      //The imag part of the reference table about COS(x)+i*SIN(x) value , 5: -9.238739e-001
34AFC      //The imag part of the reference table about COS(x)+i*SIN(x) value , 6: -7.070923e-001
39E09      //The imag part of the reference table about COS(x)+i*SIN(x) value , 7: -3.826752e-001

061F7      //0.38268
0B504      //0.70709
0EC83      //0.92387
*/

parameter [35:0] w0 = {18'h10000, 18'h00000};
parameter [35:0] w1 = {18'h0EC83, 18'h39E09};
parameter [35:0] w2 = {18'h0B504, 18'h34AFC};
parameter [35:0] w3 = {18'h061F7, 18'h3137D};
parameter [35:0] w4 = {18'h00000, 18'h30000};
parameter [35:0] w5 = {18'h39E09, 18'h3137D};
parameter [35:0] w6 = {18'h34AFC, 18'h34AFC};
parameter [35:0] w7 = {18'h3137D, 18'h39E09};

input         fir_valid;
input  [15:0] fir_d;
input         clk;
input         rst;
output        fft_valid;
output [31:0] fft_d0;
output [31:0] fft_d1;
output [31:0] fft_d2;
output [31:0] fft_d3;
output [31:0] fft_d4;
output [31:0] fft_d5;
output [31:0] fft_d6;
output [31:0] fft_d7;
output [31:0] fft_d8;
output [31:0] fft_d9;
output [31:0] fft_d10;
output [31:0] fft_d11;
output [31:0] fft_d12;
output [31:0] fft_d13;
output [31:0] fft_d14;
output [31:0] fft_d15;

reg    [15:0] r_data1 [0:8];
reg    [31:0] r_data2 [0:12];
reg    [31:0] r_data3 [0:6];
reg    [31:0] r_data4 [0:3];
reg    [31:0] r_data5 [0:15];

reg    [35:0] r_w1    [0:7];
reg    [35:0] r_w2    [0:3];
reg    [35:0] r_w3    [0:1];

reg    [4:0]  cnt;
reg           start;

reg           flag1;
reg           flag2;
reg           flag3;
reg           flag4;

wire   [31:0] a1;
wire   [31:0] b1;
wire   [31:0] a2;
wire   [31:0] b2;
wire   [31:0] a3;
wire   [31:0] b3;
wire   [31:0] a4;
wire   [31:0] b4;

integer i;

always @(posedge clk) begin
    if (~fir_valid) cnt <= 5'b0;
    else cnt <= cnt + 5'b1;
end

always @(posedge clk) begin
    if (~fir_valid) start <= 1'b0;
    else if (&cnt[4:3]) start <= 1'b1;
end

assign fft_valid = start & (cnt[3:0] == 4'b0010);

always @(posedge clk) begin
    if (~fir_valid)
        for (i = 0; i < 9; i = i + 1)
            r_data1[i] <= 16'b0;
    else begin
        r_data1[8] <= fir_d;
        for (i = 0; i < 8; i = i + 1)
            r_data1[i] <= r_data1[i + 1];
    end
end

always @(posedge clk) begin
    if (~fir_valid)
        for (i = 0; i < 13; i = i + 1)
            r_data2[i] <= 32'b0;
    else if (flag1) begin
        r_data2[4]  <= a1;
        r_data2[12] <= b1;
        for (i = 0; i < 4; i = i + 1)
            r_data2[i] <= r_data2[i + 1];
        for (i = 5; i < 12; i = i + 1)
            r_data2[i] <= r_data2[i + 1];
    end
    else begin
        r_data2[12] <= b1;
        for (i = 0; i < 12; i = i + 1)
            r_data2[i] <= r_data2[i + 1];
    end
end

always @(posedge clk) begin
    if (~fir_valid)
        for (i = 0; i < 7; i = i + 1)
            r_data3[i] <= 32'b0;
    else if (flag2) begin
        r_data3[2] <= a2;
        r_data3[6] <= b2;
        for (i = 0; i < 2; i = i + 1)
            r_data3[i] <= r_data3[i + 1];
        for (i = 3; i < 6; i = i + 1)
            r_data3[i] <= r_data3[i + 1];
    end
    else begin
        r_data3[6] <= b2;
        for (i = 0; i < 6; i = i + 1)
            r_data3[i] <= r_data3[i + 1];
    end
end

always @(posedge clk) begin
    if (~fir_valid)
        for (i = 0; i < 4; i = i + 1)
            r_data4[i] <= 32'b0;
    else if (flag3) begin
        r_data4[1] <= a3;
        r_data4[3] <= b3;
        for (i = 0; i < 1; i = i + 1)
            r_data4[i] <= r_data4[i + 1];
        for (i = 2; i < 3; i = i + 1)
            r_data4[i] <= r_data4[i + 1];
    end
    else begin
        r_data4[3] <= b3;
        for (i = 0; i < 3; i = i + 1)
            r_data4[i] <= r_data4[i + 1];
    end
end

always @(posedge clk) begin
    if (~fir_valid)
        for (i = 0; i < 16; i = i + 1)
            r_data5[i] <= 32'b0;
    else if (flag4) begin
        r_data5[14] <= a4;
        r_data5[15] <= b4;
        for (i = 0; i < 14; i = i + 1)
            r_data5[i] <= r_data5[i + 1];
    end
    else begin
        r_data5[15] <= b4;
        for (i = 0; i < 15; i = i + 1)
            r_data5[i] <= r_data5[i + 1];
    end
end

always @(posedge clk) begin
    if (~fir_valid) begin
        r_w1[0] <= w0;
        r_w1[1] <= w1;
        r_w1[2] <= w2;
        r_w1[3] <= w3;
        r_w1[4] <= w4;
        r_w1[5] <= w5;
        r_w1[6] <= w6;
        r_w1[7] <= w7;
    end
    else begin
        r_w1[7] <= r_w1[0];
        for (i = 0; i < 7; i = i + 1)
            r_w1[i] <= r_w1[i + 1];
    end
end

always @(posedge clk) begin
    if (~fir_valid) begin
        r_w2[0] <= w0;
        r_w2[1] <= w2;
        r_w2[2] <= w4;
        r_w2[3] <= w6;
    end
    else begin
        r_w2[3] <= r_w2[0];
        for (i = 0; i < 3; i = i + 1)
            r_w2[i] <= r_w2[i + 1];
    end
end

always @(posedge clk) begin
    if (~fir_valid) begin
        r_w3[0] <= w0;
        r_w3[1] <= w4;
    end
    else begin
        r_w3[1] <= r_w3[0];
        r_w3[0] <= r_w3[1];
    end
end

FFT_PE pe1(
           .X({r_data1[0], 16'b0}), 
           .Y({r_data1[8], 16'b0}), 
           .w_real(r_w1[7][35:18]),
           .w_imag(r_w1[7][17:0]),
           .fft_a(a1),
           .fft_b(b1));

FFT_PE pe2(
           .X({r_data2[0]}), 
           .Y({r_data2[4]}), 
           .w_real(r_w2[2][35:18]),
           .w_imag(r_w2[2][17:0]),
           .fft_a(a2),
           .fft_b(b2));

FFT_PE pe3(
           .X({r_data3[0]}), 
           .Y({r_data3[2]}), 
           .w_real(r_w3[1][35:18]),
           .w_imag(r_w3[1][17:0]),
           .fft_a(a3),
           .fft_b(b3));

FFT_PE pe4(
           .X({r_data4[0]}), 
           .Y({r_data4[1]}), 
           .w_real(w0[35:18]),
           .w_imag(w0[17:0]),
           .fft_a(a4),
           .fft_b(b4));

always @(cnt) begin
    case (cnt[3:0])
        4'b0000: flag1 = 1'b1;
        4'b1001: flag1 = 1'b1;
        4'b1010: flag1 = 1'b1;
        4'b1011: flag1 = 1'b1;
        4'b1100: flag1 = 1'b1;
        4'b1101: flag1 = 1'b1;
        4'b1110: flag1 = 1'b1;
        4'b1111: flag1 = 1'b1;
        default: flag1 = 1'b0;
    endcase

    case (cnt[3:0])
        4'b0000: flag2 = 1'b1;
        4'b0001: flag2 = 1'b1;
        4'b0110: flag2 = 1'b1;
        4'b0111: flag2 = 1'b1;
        4'b1000: flag2 = 1'b1;
        4'b1001: flag2 = 1'b1;
        4'b1110: flag2 = 1'b1;
        4'b1111: flag2 = 1'b1;
        default: flag2 = 1'b0;
    endcase
    
    case (cnt[3:0])
        4'b0001: flag3 = 1'b1;
        4'b0010: flag3 = 1'b1;
        4'b0101: flag3 = 1'b1;
        4'b0110: flag3 = 1'b1;
        4'b1001: flag3 = 1'b1;
        4'b1010: flag3 = 1'b1;
        4'b1101: flag3 = 1'b1;
        4'b1110: flag3 = 1'b1;
        default: flag3 = 1'b0;
    endcase

    case (cnt[3:0])
        4'b0001: flag4 = 1'b1;
        4'b0011: flag4 = 1'b1;
        4'b0101: flag4 = 1'b1;
        4'b0111: flag4 = 1'b1;
        4'b1001: flag4 = 1'b1;
        4'b1011: flag4 = 1'b1;
        4'b1101: flag4 = 1'b1;
        4'b1111: flag4 = 1'b1;
        default: flag4 = 1'b0;
    endcase
end

assign fft_d0  = r_data5[0];
assign fft_d1  = r_data5[8];
assign fft_d2  = r_data5[4];
assign fft_d3  = r_data5[12];
assign fft_d4  = r_data5[2];
assign fft_d5  = r_data5[10];
assign fft_d6  = r_data5[6];
assign fft_d7  = r_data5[14];
assign fft_d8  = r_data5[1];
assign fft_d9  = r_data5[9];
assign fft_d10 = r_data5[5];
assign fft_d11 = r_data5[13];
assign fft_d12 = r_data5[3];
assign fft_d13 = r_data5[11];
assign fft_d14 = r_data5[7];
assign fft_d15 = r_data5[15];


endmodule
