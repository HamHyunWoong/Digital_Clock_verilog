module bcd_to_seg(button1,button2,button3,button4,
						sw1, sw2, sw3, sw4,clk,
						tap_out,ampm,
                  blink_count1,blink_count2,blink_count3,blink_count4,blink_count5,blink_count6,setting_toggle,count);
   input button1,button2,button3,button4,setting_toggle,sw1, sw2, sw3, sw4;
	input clk;
	input [1:0] tap_out;
   output [3:0] blink_count1,blink_count2,blink_count3,blink_count4,blink_count5,blink_count6;
   output  [1:0] ampm;
	output   [3:0] count;
	

   wire[3:0] count1, count2, count3, count4, count5, count6;
   wire [3:0] blink_count1, blink_count2, blink_count3, blink_count4, blink_count5, blink_count6;
	
	wire carry_p1;
	wire carry_p2;
	wire carry_p3;
	wire carry_p4;
	wire carry_p5;
	wire carry_p6;
	
   wire carry_m1;
	wire carry_m2;
	wire carry_m3;
	wire carry_m4;
	wire carry_m5;
	wire carry_m6;

	wire [3:0] game_count1;
	wire [3:0] game_count2;
	wire [3:0] game_count3;
	wire [3:0] game_count4;
	wire [3:0] game_count5;
	wire [3:0] game_count6;
	
	
	wire game_clk1;
	wire game_clk2;
	wire game_clk3;
	
	
	///////////////////////////////////////////////////////////////////////////////
	
	reg  flg_tap;
	
	reg [3:0] alm_min01=0;
	reg [3:0] alm_min10=0;
	reg [3:0] alm_hou01=0;
	reg [3:0] alm_hou10=0;
	reg [3:0] alm_AP;
	
	reg [3:0] tap;
	integer num=0;

	always @ (posedge !button4)
	begin
		if(blink_count3 >=3)
			begin
				tap <= 0;
			end
	end

	////////////////////////////////////////////////////////////////////////////////
	assign count = ((tap ==9) ? 9: count1) ;
	//assign count = LED_alm;

	assign blink_count1 = (clk && setting_toggle && tap_out == 0) ? 4'b1111 : count1; 
	assign blink_count2 = (clk && setting_toggle && tap_out == 0) ? 4'b1111 : count2; 
	assign blink_count3 = (clk && setting_toggle && tap_out == 1) ? 4'b1111 : count3; 
	assign blink_count4 = (clk && setting_toggle && tap_out == 1) ? 4'b1111 : count4; 
	assign blink_count5 = (clk && setting_toggle && tap_out == 2) ? 4'b1111 : count5; 
	assign blink_count6 = (clk && setting_toggle && tap_out == 2) ? 4'b1111 : count6; 
	
	mod_10_re_counter CNT1(.tap_out(tap_out == 0),.clk(clk && !setting_toggle),.count(count1),.carry_p(carry_p1),.button3(button3));
	mod_06_re_counter CNT2(.clk(carry_p1),.count(count2),.carry_p(carry_p2),.button4(button4));
	mod_10_re_counter CNT3(.gap(back_t1),.tap_out(tap_out == 1),.clk(carry_p2),.count(count3),.carry_p(carry_p3),.button3(button3),.button4(button4));
	mod_06_re_counter CNT4(.gap(back_t2),.clk(carry_p3),.count(count4),.carry_p(carry_p4),.button4(button4));
	mod_24_re_counter CNT24(.tap_out(tap_out==2),.clk(carry_p4),.count(count5),.count_ten(count6),.carry_p(carry_p5),.button3(button3),.ampm(ampm));
	
	
	/*mod_10_re_counter CNT5(.tap_out(tap_out == 2),.clk(carry_p4),.count(count5),.carry_p(carry_p5),.button3(button3));
	 mod_06_re_counter CNT6(.minus(carry_m5),.button3(1),.button4(1),.clk(carry_p5),.count(count6),.carry_p(carry_p6),.carry_m(carry_m6));
   */
	
	
	
   
endmodule