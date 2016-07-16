module decoer_selecter(sw1,bcd_in1,bcd_in2,bcd_in3,bcd_in4,bcd_in5,bcd_in6,bcd_in7,bcd_in_led,bcd_in11,bcd_in22,bcd_in33,bcd_in44,bcd_in55,bcd_in66,bcd_in77,bcd_in_ledled,bcd_out1,bcd_out2,bcd_out3,bcd_out4,bcd_out5,bcd_out6,bcd_out7,bcd_out_led);





input sw1; 
input [3:0]bcd_in1;
input [3:0]bcd_in2;
input [3:0]bcd_in3;
input [3:0]bcd_in4;
input [3:0]bcd_in5;
input [3:0]bcd_in6;
input [3:0]bcd_in7;
input [3:0]bcd_in_led;

 
input [3:0]bcd_in11;
input [3:0]bcd_in22;
input [3:0]bcd_in33;
input [3:0]bcd_in44;
input [3:0]bcd_in55;
input [3:0]bcd_in66;
input [3:0]bcd_in77;
input [3:0]bcd_in_ledled;


output reg [3:0] bcd_out1;
output reg [3:0] bcd_out2;
output reg [3:0] bcd_out3;
output reg [3:0] bcd_out4;
output reg [3:0] bcd_out5;
output reg [3:0] bcd_out6;
output reg [3:0] bcd_out7;
output reg [3:0] bcd_out_led;


parameter S0 =0;
parameter S1 =1;

reg state;


always@(1)
begin
	
  if(sw1 ==0) // clock
		begin
		if(state ==0)
			begin
				bcd_out1 <=0;
				bcd_out2 <=0;
				bcd_out3 <=0;
				bcd_out4 <=0;
				bcd_out5 <=0;
				bcd_out6 <=0;
				bcd_out7 <=0;
				bcd_out_led <=0;
				state =1;
			end
		else if(state ==1)
			begin
			bcd_out1 <=bcd_in1;
			bcd_out2 <=bcd_in2;
			bcd_out3 <=bcd_in3;
			bcd_out4 <=bcd_in4;
			bcd_out5 <=bcd_in5;
			bcd_out6 <=bcd_in6;
			bcd_out7 <=bcd_in7;
			bcd_out_led <=bcd_in_led;
		 end
		end
	else if(sw1 ==1)//alm
		begin
		if(state ==1)
			begin
				bcd_out1 <=0;
				bcd_out2 <=0;
				bcd_out3 <=0;
				bcd_out4 <=0;
				bcd_out5 <=0;
				bcd_out6 <=0;
				bcd_out7 <=0;
				bcd_out_led <=0;
				state =0;
			
			end
		else if(state ==0)
		begin
		bcd_out1 <=11;
		bcd_out2 <=11;
		bcd_out3 <=11;
		bcd_out4 <=11;
		bcd_out5 <=11;
		bcd_out6 <=11;
		bcd_out7 <=10;
		bcd_out_led <=10;
		end
		end


end

endmodule