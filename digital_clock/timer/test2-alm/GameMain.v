module GameMain(input rst,input  btn2, input gameclk, output[3:0] gamecount_out);

reg [3:0] gamecount;

always @(posedge gameclk or negedge rst)
	begin
	
	 if(!rst)
        begin
          gamecount <=0;
          
        end
    else if(gamecount <9) ////////////pls mod
      begin
        gamecount <= gamecount +1;
      end
	 else if(gamecount==9)
		begin
			gamecount <= 0;
		end
	end
assign gamecount_out = gamecount;
	
endmodule


	