module FFT_for_OFDM_tb #(parameter N = 16, Q = 8, STAGES = 4)
(
	output			[2*N-1:0]		out_instant,
	output							o_FFT_cycle_done,
	output			[STAGES-1:0]fft_out_switcher
);

	reg clk = 0;
	reg rst = 0;
	reg [N-1:0] in_1Hz, in_2Hz, in_4Hz, in_8Hz;
	
	initial begin		
		#10 rst = 1;
		#50 rst = 0;
		#0 in_1Hz = 16'b0000000100000000;
		//#0 i_in0_im = 16'b0000000011001001;
	
		#0 in_2Hz = 16'b0000000100000000;
		//#0 i_in1_im = 16'b0000000011001001;
	
		#0 in_4Hz = 16'b0000000000000000;
		//#0 i_twiddle_im = 16'b0000000011001001;
		
		#0 in_8Hz = 16'b0000000000000000;
		
	end
	
	always @(*)
		#10 clk <= ~clk;
	
	FFT_for_OFDM #(.N(N), .Q(Q), .STAGES(STAGES)) FFT_for_OFDM
	(
		.i_clk(clk),
		.i_rst(rst),
		
		.in_1Hz_re(in_1Hz),
		.in_1Hz_im(0),
		.in_2Hz_re(in_2Hz),
		.in_2Hz_im(0),
		.in_4Hz_re(0),
		.in_4Hz_im(0),
		.in_8Hz_re(0),
		.in_8Hz_im(0),
		
		.out_instant(out_instant),
		.o_FFT_cycle_done(o_FFT_cycle_done),
		.fft_out_switcher(fft_out_switcher)
	);
endmodule