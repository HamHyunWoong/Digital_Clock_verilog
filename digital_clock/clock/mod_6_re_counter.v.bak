module mod_06_re_counter(minus,button3,button4,clk,count,carry_p,carry_m);
    output reg [3:0] count;
	 output reg carry_p;
	 output carry_m;
	 input minus;
	 input button3;
	 input button4;
    input clk;
	 
	 reg [3:0] counter_out;
	 reg carry_p_out;
	 reg carry_m_out;
	 
	 always@(posedge clk)
	 begin
	 
	 if(count < 5)
	 begin
	 count <= count + 1;
	 carry_p <=0;
	 end
	 else
	 begin
	 count <= 0;
	 carry_p <= 1;
	 end
	 end
	 
	/*
	 always @(posedge clk or posedge minus)
    begin
	 if(minus)
	 begin
	 if (counter_out > 0 && !minus) //////////min mod
		begin
		   carry_m_out <=0;
			counter_out <= counter_out - 1;
		end
	 else if(counter_out == 0 && !minus)
		begin
			counter_out <= counter_out + 5;
			carry_m_out <= carry_m_out + 1;
		end
	 else
		begin
			counter_out <= 0;
		end
		end
	else 
	  begin
	  if(counter_out < 5)
      begin
		  carry_p_out <=0;
        counter_out <= counter_out + clk;
      end
	 else if(counter_out == 5 && !minus)
      begin
		  counter_out <= 0;
		  carry_p_out <= carry_p_out +1;
		end
		end
		end
	 
	 
	 assign count = counter_out;
	 assign carry_p = carry_p_out;
	 assign carry_m = carry_m_out;
	 */
endmodule
	 
	 
	 