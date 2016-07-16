module select_mod_clk (clk ,sw1,sw2, time_clk1 ,time_clk2);

input clk , sw1,sw2;
output reg time_clk1 ,time_clk2;

always@(1)
begin
	if(sw1 ==0)
		begin
			time_clk1 <= clk;
			time_clk2 <=0;
		end
	else if(sw1==1)
		begin
			time_clk1 <= 0;
			time_clk2 <=clk;
		end


end
endmodule