module FFT_PE(X, Y, w_real, w_imag, fft_a, fft_b);
input        [31:0] X;
input        [31:0] Y;
input signed [17:0] w_real;
input signed [17:0] w_imag;
output       [31:0] fft_a;
output       [31:0] fft_b;

wire  signed [15:0] sub_a_c;
wire  signed [15:0] sub_d_b;
wire  signed [15:0] sub_b_d;
wire         [31:0] real_1;  //
wire         [31:0] real_2;  // Optimal
wire         [31:0] imag_1;  //
wire         [31:0] imag_2;  //

parameter n = 0; // 0~16

wire     [31 - n:0] real_tmp;
wire     [31 - n:0] imag_tmp;

assign fft_a[31:16] = X[31:16] + Y[31:16];
assign fft_a[15:0]  = X[15:0]  + Y[15:0];

assign sub_a_c = X[31:16] - Y[31:16];
assign sub_d_b = Y[15:0]  - X[15:0];   //Optimal by ~sub_b_d
assign sub_b_d = X[15:0]  - Y[15:0];

assign real_1 = sub_a_c * w_real;
assign real_2 = sub_d_b * w_imag;
assign imag_1 = sub_a_c * w_imag;
assign imag_2 = sub_b_d * w_real;

assign real_tmp = real_1[31:n] + real_2[31:n];
assign imag_tmp = imag_1[31:n] + imag_2[31:n];

assign fft_b[31:16] = real_tmp[31 - n:16 - n] + real_tmp[15 - n];
assign fft_b[15:0]  = imag_tmp[31 - n:16 - n] + imag_tmp[15 - n];

endmodule
