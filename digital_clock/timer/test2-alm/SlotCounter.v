module SlotCounter (input gameselect,input btn2 , output gameout1,output gameout2,output gameout3);



reg game_clk1=0;
reg game_clk2=0;
reg game_clk3=0;

reg clk;



// Use of initial statement to generate clocks 1fs and 1fs_d

always@(1 gameselect )
	begin
	


      repeat(5000) begin
         #5 game_clk1 = !game_clk1;

         #10 game_clk2 = !game_clk2;

         #7 game_clk3 = !game_clk3;
     end
	
	end

assign gameout1 = game_clk1;
assign gameout2 = game_clk2;
assign gameout3 = game_clk3;
endmodule
 
