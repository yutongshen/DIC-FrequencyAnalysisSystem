module ANA(
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
           fft_d15,
           clk,
           rst,
           done,
           freq);

input              fft_valid;
input       [31:0] fft_d0;
input       [31:0] fft_d1;
input       [31:0] fft_d2;
input       [31:0] fft_d3;
input       [31:0] fft_d4;
input       [31:0] fft_d5;
input       [31:0] fft_d6;
input       [31:0] fft_d7;
input       [31:0] fft_d8;
input       [31:0] fft_d9;
input       [31:0] fft_d10;
input       [31:0] fft_d11;
input       [31:0] fft_d12;
input       [31:0] fft_d13;
input       [31:0] fft_d14;
input       [31:0] fft_d15;
input              clk;
input              rst;
output             done;
output      [3:0]  freq;

wire signed [15:0] a;
wire signed [15:0] b;
wire        [31:0] s1;
wire        [31:0] s2;
wire        [31:0] square_sum;
wire        [31:0] tmp;
wire               flag;
reg         [31:0] r_data [0:15];
reg         [31:0] r_max;
reg         [3:0]  _freq;
reg         [3:0]  cnt;
reg         [1:0]  ref;
reg                start;


integer i;

always @(posedge clk) begin
    if (rst) 
        for (i = 0; i < 16; i = i + 1) 
            r_data[i] <= 32'b0;
    else if (fft_valid) begin
        r_data[0]  <= fft_d0;
        r_data[1]  <= fft_d1;
        r_data[2]  <= fft_d2;
        r_data[3]  <= fft_d3;
        r_data[4]  <= fft_d4;
        r_data[5]  <= fft_d5;
        r_data[6]  <= fft_d6;
        r_data[7]  <= fft_d7;
        r_data[8]  <= fft_d8;
        r_data[9]  <= fft_d9;
        r_data[10] <= fft_d10;
        r_data[11] <= fft_d11;
        r_data[12] <= fft_d12;
        r_data[13] <= fft_d13;
        r_data[14] <= fft_d14;
        r_data[15] <= fft_d15;
    end
    else
        for (i = 0; i < 15; i = i + 1) 
            r_data[i] <= r_data[i + 1];
        r_data[15] <= 32'b0;
end

always @(posedge clk) begin
    if (rst | fft_valid) r_max <= 32'b0;
    else if (flag) r_max <= square_sum;
end

always @(posedge clk) begin
    if (rst | fft_valid) cnt <= 4'b0;
    else cnt <= cnt + 4'b1;
end

always @(posedge clk) begin
    if (rst) ref <= 2'b0;
    else if (fft_valid) ref <= ref + 2'b1;
end

always @(posedge clk) begin
    if (rst) start <= 1'b0;
    else if (ref[1]) start <= 1'b1;
end

always @(posedge clk) begin
    if (rst) _freq <= 4'b0;
    else if (flag) _freq <= cnt;
end

assign freq = 4'bz;
assign done = 1'b1;

assign a = r_data[0][31:16];
assign b = r_data[0][15:0];
assign s1 = a * a;
assign s2 = b * b;
assign square_sum = s1 + s2;
assign tmp = r_max - square_sum;
assign flag = tmp[31];

assign _done = start & (cnt == 4'b0);

endmodule
