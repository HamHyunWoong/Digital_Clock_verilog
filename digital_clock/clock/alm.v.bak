module alm(button1,button2,button3,button4,
			  sw1, sw2, sw3, sw4, clk, tap_out,
           blink_count11, blink_count22, blink_count33, blink_count44, blink_count55, blink_count66,
			 ,setting_toggle,LED_alm);
			 
			 
			 
   input button1,button2,button3,button4,setting_toggle,sw1, sw2, sw3, sw4;
   
	input clk;
	input [1:0] tap_out;
   output reg [3:0] blink_count11,blink_count22,blink_count33,blink_count44,blink_count55,blink_count66;
	
	output reg [3:0] LED_alm;

   wire [3:0] count1, count2, count3, count4, count5, count6;
 
	wire carry_p1;
	wire carry_p2;
	wire carry_p3;
	wire carry_p4;
	wire carry_p5;
	wire carry_p6;
	
	reg alm_min01;
	reg alm_min10;
	reg alm_hou01;
	reg alm_hou10;
	reg alm_AP;
	
	assign blink_count1 = (clk && setting_toggle && tap_out == 0) ? 4'b1111 : count1; 
	assign blink_count2 = (clk && setting_toggle && tap_out == 0) ? 4'b1111 : count2; 
	assign blink_count3 = (clk && setting_toggle && tap_out == 1) ? 4'b1111 : count3; 
	assign blink_count4 = (clk && setting_toggle && tap_out == 1) ? 4'b1111 : count4; 
	assign blink_count5 = (clk && setting_toggle && tap_out == 2) ? 4'b1111 : count5; 
	assign blink_count6 = (clk && setting_toggle && tap_out == 2) ? 4'b1111 : count6; 
	
	always @ (1)
	begin
	
		 if(button1 ==0)
		 begin
		 alm_min01 <= count3;
	    alm_min10<= count4;
	    alm_hou01<= count5;
	    alm_hou10<= count6 ;
		 
		 alm_AP <=ampm;
		 
	    LED_alm <=0;
		 
		 blink_count11  <=0;
		 blink_count22 <=0;
		 blink_count33  <=0;
		 blink_count44 <=0;
		 blink_count55 <=0;
		 blink_count66 <=0;
		end
		
		else if((alm_min01 <= count3) && (alm_min10 <= count4) && (alm_hou01 <= count5) && (alm_hou10 <= count6))
		begin
			LED_alm <=9;
			
		end
		else
			LED_alm <=0;
	end
	

	mod_10_re_counter CNT11(.tap_out(tap_out == 0),.clk(!setting_toggle),.count(count1),.carry_p(carry_p1));
	mod_06_re_counter CNT22(.clk(carry_p1),.count(count2),.carry_p(carry_p2));
	mod_10_re_counter CNT33(.tap_out(tap_out == 1),.clk(carry_p2),.count(count3),.carry_p(carry_p3),.button3(button3));
	mod_06_re_counter CNT44(.clk(carry_p3),.count(count4),.carry_p(carry_p4));
	mod_24_re_counter CNT2424(.tap_out(tap_out==2),.clk(carry_p4),.count(count5),.count_ten(count6),.carry_p(carry_p5),.button3(button3),.ampm(ampm));

endmodule



