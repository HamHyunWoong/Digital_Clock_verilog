module led_counter_decoder(clk,bcd_in,LEDR0,LEDR1,LEDR2,LEDR3,LEDR4,LEDR5,LEDR6,LEDR7,LEDR8);
  
  output reg LEDR0;
  output reg LEDR1;
  output reg LEDR2;
  output reg LEDR3;
  output reg LEDR4;
  output reg LEDR5;
  output reg LEDR6;
  output reg LEDR7;
  output reg LEDR8;
  
  
  input clk;
  input [3:0] bcd_in;
  
  
 
  
  always @(bcd_in)
	begin
		if(bcd_in==0)
			begin
				LEDR0 <= 0;
				LEDR1 <= 0;
				LEDR2 <= 0;
				LEDR3 <= 0;
				LEDR4 <= 0;
				LEDR5 <= 0;
				LEDR6 <= 0;
				LEDR7 <= 0;
				LEDR8 <= 0;
			end
		else if(bcd_in ==1)
			begin
				LEDR0 = clk;
				LEDR1 = 0;
				LEDR2 = 0;
				LEDR3 = 0;
				LEDR4 = 0;
				LEDR5 = 0;
				LEDR6 = 0;
				LEDR7 = 0;
				LEDR8 = 0;
			end
		else if(bcd_in ==2)
			begin
				LEDR0 = clk;
				LEDR1 = clk;
				LEDR2 = 0;
				LEDR3 = 0;
				LEDR4 = 0;
				LEDR5 = 0;
				LEDR6 = 0;
				LEDR7 = 0;
				LEDR8 = 0;
			end
		else if(bcd_in ==3)
			begin
				LEDR0 = clk;
				LEDR1 = clk;
				LEDR2 = clk;
				LEDR3 = 0;
				LEDR4 = 0;
				LEDR5 = 0;
				LEDR6 = 0;
				LEDR7 = 0;
				LEDR8 = 0;
			end
		else if(bcd_in ==4)
			begin
				LEDR0 = clk;
				LEDR1 = clk;
				LEDR2 = clk;
				LEDR3 = clk;
				LEDR4 = 0;
				LEDR5 = 0;
				LEDR6 = 0;
				LEDR7 = 0;
				LEDR8 = 0;
			end
		else if(bcd_in ==5)
			begin
				LEDR0 = clk;
				LEDR1 = clk;
				LEDR2 = clk;
				LEDR3 = clk;
				LEDR4 = clk;
				LEDR5 = 0;
				LEDR6 = 0;
				LEDR7 = 0;
				LEDR8 = 0;
			end
		else if(bcd_in ==6)
			begin
				LEDR0 = clk;
				LEDR1 = clk;
				LEDR2 = clk;
				LEDR3 = clk;
				LEDR4 = clk;
				LEDR5 = clk;
				LEDR6 = 0;
				LEDR7 = 0;
				LEDR8 = 0;
			end
		else if(bcd_in ==7)
			begin
				LEDR0 = clk;
				LEDR1 = clk;
				LEDR2 = clk;
				LEDR3 = clk;
				LEDR4 = clk;
				LEDR5 = clk;
				LEDR6 = clk;
				LEDR7 = 0;
				LEDR8 = 0;
			end
			else if(bcd_in ==8)
			begin
				LEDR0 = clk;
				LEDR1 = clk;
				LEDR2 = clk;
				LEDR3 = clk;
				LEDR4 = clk;
				LEDR5 = clk;
				LEDR6 = clk;
				LEDR7 = clk;
				LEDR8 = 0;
			end
			else if(bcd_in ==9)
			begin
				LEDR0 = clk;
				LEDR1 = clk;
				LEDR2 = clk;
				LEDR3 = clk;
				LEDR4 = clk;
				LEDR5 = clk;
				LEDR6 = clk;
				LEDR7 = clk;
				LEDR8 = clk;
			end
			else;
	
	end

endmodule