module mod_10_re_counter(clk, count, carry_p, button3,button4,tap_out,gap);
    output reg [3:0] count;
	 output reg carry_p;
	 input clk, button3,button4;
	 input [1:0] tap_out;
	 wire clk_button;
	 assign clk_button = (clk || (!button3 && tap_out));
	 
	 input [3:0] gap;
	 
	 always@(posedge clk_button)
	 begin
	 
		
	   if(count < 9)
	    begin
	    count <= count + 1;
	    carry_p <= 0;
	    end
	   else
	    begin
	    count <= 0;
	    carry_p <= 1;
	    end
		end
		 /*
	 always @(posedge clkbutton or posedge minusbutton)
	 begin
	 if(clkbutton)
	  begin
	   if(count < 9)
	    begin
	    count <= count + 1;
	    carry_p <= 0;
	    end
	   else
	    begin
	    count <= 0;
	    carry_p <= 1;
	    end
	  end
	 else if(minusbutton)
	 begin
	  if(count > 0)
	  begin
	   count <= count - 1;
		carry_m <= 0;
		end
	  else if(count == 0)
	  begin
		count <= 9;
		carry_m <= 1;
		end
    end
	 else;
	 end*/
endmodule
	 
	 
	 
	 