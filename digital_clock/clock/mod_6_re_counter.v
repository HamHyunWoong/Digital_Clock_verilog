module mod_06_re_counter(minus,button3,button4,clk,count,carry_p,carry_m,gap);
    output reg [3:0] count;
	 output reg carry_p;
	 output carry_m;
	 input minus;
	 input button3;
	 input button4;
    input clk;
	 input [3:0] gap;
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
	 
endmodule
	 
	 
	 