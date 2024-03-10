module multiplier #(parameter N = 16, Q = 8)
(
	input 						i_clk,
	input 						i_rst,
	input 		[N-1:0] 		i_A,
	input 		[N-1:0] 		i_B,
	output 		[N-1:0] 		out
);
	
	reg [2*N-1:0] 	P;
	reg [N-1:0]		temp1;
	reg [N-1:0]		temp2;
	reg [N-1:0]    temp3;
	
	always @(posedge i_clk or posedge i_rst) begin
		if(i_rst) begin
			temp1 <= 0;
			temp2 <= 0;
			temp3 <= 0;
			P 		<= 0;
		end
		else begin
			case({i_A[N-1], i_B[N-1]})
				2'b00:
				begin
					//two positive number
					temp1 <= i_A;
					temp2 <= i_B;
					temp3 <= P[N - 1 + Q:Q];
				end
				
				2'b01:
				begin
					//one positive and one negative number
					temp1 <= i_A;
					//take complement of negative number
					temp2 <= ~i_B + 1'b1;
					//take complement of negative number
					temp3 <= ~P[N - 1 + Q:Q] + 1'b1;
				end
				
				2'b10:
				begin
					//one positive and one negative number
					temp1 <= ~i_A + 1'b1;
					temp2 <= i_B;
					temp3 <= ~P[N - 1 + Q:Q] + 1'b1;
				end
				
				2'b11:
				begin
					//two negative number
					temp1 <= ~i_A + 1'b1;
					temp2 <= ~i_B + 1'b1;
					temp3 <= P[N - 1 + Q:Q];
				end	
			endcase
			
			P <= temp1 * temp2;
		end
	end
	
	//result of multiplying 2 numbers is 32 bit lengths, so we need to cut it to 16 bit
	//fot that we take 8 bit for int part of number and 8 bit for fractional part of number [23:8] 
	assign out = temp3;
endmodule