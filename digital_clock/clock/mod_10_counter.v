 module mod_10_counter(btn2,btn3,rst,clk,count1,count2,count3,count4,count5,count6);
   output [3:0] count1;
   output [3:0] count2;
	output [3:0] count3;
	output [3:0] count4;
	output [3:0] count5;
	output [3:0] count6;
	
	input btn3;
   input clk;
   input rst;
	input btn2;
	
   reg [3:0] counter_out;
   reg [3:0] counter_out2;
	reg [3:0] counter_out3;
	reg [3:0] counter_out4;
	reg [3:0] counter_out5;
	reg [3:0] counter_out6;
	
   wire btn3_tap;
	wire btn2_tap;
	
	assign btn3_tap = btn3;
   assign btn2_tap = btn2;
	
///////////////////////////////////////////////////////////////////////////////////////////////	
   always @(posedge (clk||!btn3_tap ||!btn2_tap) or negedge rst )
    begin
	 if(!rst)
        begin
          counter_out <=0;
          counter_out2 <=0;
			 counter_out3 <=0;
			 counter_out4 <=0;
			 counter_out5 <=0;
			 counter_out6 <=0;
        end
		  
		  
 
		  
		  
		  
    else if(counter_out <9 && btn2_tap != 0) ////////////pls mod
      begin
        counter_out <= count1 +1;
      end
	
		
    else if(counter_out==9 && btn2_tap != 0 )
      begin
///////////////////////////////////////////////////		
        if(counter_out2<5 && btn2_tap != 0)
          begin
			 counter_out <= 0;
          counter_out2 <= count2 +1;
          end
		  else if(counter_out2 ==5 && btn2_tap != 0)
		    begin
	////////////////////////////////////////////////////  
				if(counter_out3<7 && btn2_tap != 0)
					begin
						counter_out <= 0;
						counter_out2 <=0;
						counter_out3 <= count3 +1;
					end
				else if(counter_out3 == 7 && btn2_tap != 0 )
					begin		
	////////////////////////////////////////////////////////
						if(counter_out4<3 && btn2_tap != 0)
							begin
							counter_out <= 0;
						   counter_out2 <=0;
							counter_out3 <=0;
							counter_out4 <=counter_out4 +1;
							end
						else if(counter_out4 == 3 && btn2_tap != 0)
							begin
								counter_out4 <= 0;
							end
						else
							begin
								counter_out <= 0;
								counter_out2 <=0;
								counter_out3 <=0;
								counter_out4 <=0;
							end
						
					end
			 
			 
			 
			 end
		
		  else
          begin
			 counter_out <= 0;
          counter_out2 <=0;
          end
	
      end
	 //////////////////////////////////min mod
	else if (counter_out>0 && btn2_tap != 1)
		begin
			counter_out <= count1 -1;
		end
	else if (counter_out == 0 && btn2_tap != 1)
		begin
			counter_out <= count1 +9;
			if(counter_out2>0 && btn2_tap != 1)
				begin
					counter_out2 <= count2 -1;
				end
			else if (counter_out2 == 0 && btn2_tap != 1)
				begin
					counter_out <= count1 +9;
					counter_out2 <= count2 +5;
				   if (counter_out3 > 0 && btn2_tap != 1)
						begin
							counter_out3 <= count3 -1;
						end
					else if (counter_out3 == 0 && btn2_tap != 1)
							begin
								counter_out <= count1 +9;
								counter_out2 <= count2 +5;
								counter_out3 <= count3 +9;
								
								if(counter_out4>0 && btn2_tap != 1)
									begin
										
									end
								
							end
					
				end
		end
	 
    else
		begin
			counter_out <=0;
		end
    end
	 
    assign count1 = counter_out;
    assign count2 = counter_out2;
	 assign count3 = counter_out3;
	 assign count4 = counter_out4;
	 assign count3 = counter_out5;
	 assign count4 = counter_out6;
endmodule
	 
