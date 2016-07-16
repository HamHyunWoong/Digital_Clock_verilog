module mod_24_re_counter(clk, count_ten, count, carry_p, button3,tap_out,ampm);
    output reg [3:0] count;
	 output reg [3:0] count_ten;
	 output reg carry_p;
	 output reg ampm;
	 
	 input clk, button3;
	 input [1:0] tap_out;
	 wire clk_button;
	 assign clk_button = (clk || (!button3 && tap_out));

	 always@(posedge clk_button)
	 begin

		 if(count <9)
			begin
				count <= count +1;
				if(count_ten==1 && count ==1)
					begin
					
						ampm <=ampm +1;
					end
				
				if(count_ten == 1&& count ==2) //12 
					begin
						count <= 0;
						count_ten <=0;
					end
				
			end
		 else if(count == 9)
			begin
				count <=0;
				count_ten <= count_ten +1;
			end
		 end
	   
	 
endmodule