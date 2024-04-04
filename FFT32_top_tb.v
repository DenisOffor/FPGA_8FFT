module FFT32_top_tb #(parameter WORD_SIZE = 16, FRACTION = 8)
(
	output 		[WORD_SIZE-1:0] 		out0_re,
	output 		[WORD_SIZE-1:0] 		out0_im,
	output 		[WORD_SIZE-1:0] 		out1_re,
	output 		[WORD_SIZE-1:0] 		out1_im,
	output 		[WORD_SIZE-1:0] 		out2_re,
	output 		[WORD_SIZE-1:0] 		out2_im,
	output 		[WORD_SIZE-1:0] 		out3_re,
	output 		[WORD_SIZE-1:0] 		out3_im,
	output 		[WORD_SIZE-1:0] 		out4_re,
	output 		[WORD_SIZE-1:0] 		out4_im,
	output 		[WORD_SIZE-1:0] 		out5_re,
	output 		[WORD_SIZE-1:0] 		out5_im,
	output 		[WORD_SIZE-1:0] 		out6_re,
	output 		[WORD_SIZE-1:0] 		out6_im,
	output 		[WORD_SIZE-1:0] 		out7_re,
	output 		[WORD_SIZE-1:0] 		out7_im,
	output 		[WORD_SIZE-1:0] 		out8_re,
	output 		[WORD_SIZE-1:0] 		out8_im,
	output 		[WORD_SIZE-1:0] 		out9_re,
	output 		[WORD_SIZE-1:0] 		out9_im,
	output 		[WORD_SIZE-1:0] 		out10_re,
	output 		[WORD_SIZE-1:0] 		out10_im,
	output 		[WORD_SIZE-1:0] 		out11_re,
	output 		[WORD_SIZE-1:0] 		out11_im,
	output 		[WORD_SIZE-1:0] 		out12_re,
	output 		[WORD_SIZE-1:0] 		out12_im,
	output 		[WORD_SIZE-1:0] 		out13_re,
	output 		[WORD_SIZE-1:0] 		out13_im,
	output 		[WORD_SIZE-1:0] 		out14_re,
	output 		[WORD_SIZE-1:0] 		out14_im,
	output 		[WORD_SIZE-1:0] 		out15_re,
	//output 		[WORD_SIZE-1:0] 		out15_im,
	
	output 						o_FFT_cycle_done,
	output	[1:0]					w_mux_switcher,
	output							w_address_switcher,
	output							w_rst,
	output	[2:0]	w_STAGES,
	output						w_FFT16_cycle_done_delay
);

	reg clk = 0;
	reg rst = 0;
	reg [WORD_SIZE-1:0] in_1Hz_re, in_1Hz_im, in_2Hz_re, in_2Hz_im, in_4Hz_re, in_4Hz_im, in_8Hz_re, in_8Hz_im;
	
	initial begin
		//#10 rst = 1;
		//#100 rst = 0;
		//#0 in_1Hz_re = 16'b0000000101101010;
		//#0 in_1Hz_im = 16'b0000000011001001;
//
		//#0 in_2Hz_re = 16'b1111111010010110;
		//#0 in_2Hz_im = 16'b0000000011001001;
//
		//#0 in_4Hz_re = 16'b0000000101101010;
		//#0 in_4Hz_im = 16'b1111111100110111;
//
		//#0 in_8Hz_re = 16'b1111111010010110;
		//#0 in_8Hz_im = 16'b1111111100110111;
		
		//#0 in_1Hz_re = 16'b0000000100000000;
		//#0 in_1Hz_im = 16'b0000000100000000;
//
		//#0 in_2Hz_re = 16'b0000001000000000;
		//#0 in_2Hz_im = 16'b0000000100000000;
//
		//#0 in_4Hz_re = 16'b0000001100000000;
		//#0 in_4Hz_im = 16'b1111111100000000;
//
		//#0 in_8Hz_re = 16'b0000010000000000;
		//#0 in_8Hz_im = 16'b1111111100000000;
		
		#0 in_1Hz_re = 16'b0000000100000000;
		#0 in_1Hz_im = 16'b0000000011001001;

		#0 in_2Hz_re = 16'b0000001100000000;
		#0 in_2Hz_im = 16'b0000000011001001;

		#0 in_4Hz_re = 16'b0000010100000000;
		#0 in_4Hz_im = 16'b0000000011001001;

		#0 in_8Hz_re = 16'b0000001000000000;
		#0 in_8Hz_im = 16'b0000000011001001;
	end
	
	always @(*)
		#10 clk <= ~clk;
		
		
	FFT32_top #(.WORD_SIZE(WORD_SIZE), .FRACTION(FRACTION)) my_FFT32_top
	(
		.i_clk(clk),
		.i_rst(rst),
		.in0_re(in_1Hz_re),
		.in0_im(in_1Hz_im),
		.in1_re(in_2Hz_re),
		.in1_im(in_2Hz_im),
		.in2_re(0),
		.in2_im(0),
		.in3_re(in_4Hz_re),
		.in3_im(in_4Hz_im),
		.in4_re(0),
		.in4_im(0),
		.in5_re(0),
		.in5_im(0),
		.in6_re(0),
		.in6_im(0),
		.in7_re(in_8Hz_re),
		.in7_im(in_8Hz_im),
		.in8_re(0),
		.in8_im(0),
		.in9_re(0),
		.in9_im(0),
		.in10_re(0),
		.in10_im(0),
		.in11_re(0),
		.in11_im(0),
		.in12_re(0),
		.in12_im(0),
		.in13_re(0),
		.in13_im(0),
		.in14_re(0),
		.in14_im(0),
		.in15_re(0),
		.in15_im(0),
		.in16_re(0),
		.in16_im(0),
		.in17_re(0),
		.in17_im(0),
		.in18_re(0),
		.in18_im(0),
		.in19_re(0),
		.in19_im(0),
		.in20_re(0),
		.in20_im(0),
		.in21_re(0),
		.in21_im(0),
		.in22_re(0),
		.in22_im(0),
		.in23_re(0),
		.in23_im(0),
		.in24_re(0),
		.in24_im(0),
		.in25_re(0),
		.in25_im(0),
		.in26_re(0),
		.in26_im(0),
		.in27_re(0),
		.in27_im(0),
		.in28_re(0),
		.in28_im(0),
		.in29_re(0),
		.in29_im(0),
		.in30_re(0),
		.in30_im(0),
		.in31_re(0),
		.in31_im(0),
		
		.out0_re(out0_re),
		.out0_im(out0_im),
		.out1_re(out1_re),
		.out1_im(out1_im),
		.out2_re(out2_re),
		.out2_im(out2_im),
		.out3_re(out3_re),
		.out3_im(out3_im),
		.out4_re(out4_re),
		.out4_im(out4_im),
		.out5_re(out5_re),
		.out5_im(out5_im),
		.out6_re(out6_re),
		.out6_im(out6_im),
		.out7_re(out7_re),
		.out7_im(out7_im),
		.out8_re(out8_re),
		.out8_im(out8_im),
		.out9_re(out9_re),
		.out9_im(out9_im),
		.out10_re(out10_re),
		.out10_im(out10_im),
		.out11_re(out11_re),
		.out11_im(out11_im),
		.out12_re(out12_re),
		.out12_im(out12_im),
		.out13_re(out13_re),
		.out13_im(out13_im),
		.out14_re(out14_re),
		.out14_im(out14_im),
		.out15_re(out15_re),
		.out15_im(out15_im),
		.out16_re(),
		.out16_im(),
		.out17_re(),
		.out17_im(),
		.out18_re(),
		.out18_im(),
		.out19_re(),
		.out19_im(),
		.out20_re(),
		.out20_im(),
		.out21_re(),
		.out21_im(),
		.out22_re(),
		.out22_im(),
		.out23_re(),
		.out23_im(),
		.out24_re(),
		.out24_im(),
		.out25_re(),
		.out25_im(),
		.out26_re(),
		.out26_im(),
		.out27_re(),
		.out27_im(),
		.out28_re(),
		.out28_im(),
		.out29_re(),
		.out29_im(),
		.out30_re(),
		.out30_im(),
		.out31_re(),
		.out31_im(),
	
		.o_FFT_cycle_done(o_FFT_cycle_done),
		.w_mux_switcher(w_mux_switcher),
		.w_address_switcher(w_address_switcher),
		.w_rst(w_rst),
		.w_STAGES(w_STAGES),
		.w_FFT16_cycle_done_delay(w_FFT16_cycle_done_delay)
	
	); 
endmodule
