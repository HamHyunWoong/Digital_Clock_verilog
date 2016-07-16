module counter_mod_25000000(count,clk,rst);

output [24:0] count;
input clk;
input rst;

reg [24:0]counter_out;
always @(posedge clk or negedge rst)
  begin
   if(!rst)
    begin
       counter_out <=0;
    end
   else if(counter_out<24999999)
    begin
      counter_out <= count+1;
    end
    else
      counter_out <= 0;
  end
  
  assign count = counter_out;

endmodule