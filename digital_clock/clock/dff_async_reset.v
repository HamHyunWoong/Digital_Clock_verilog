module dff_async_reset(data,clk,reset,q);
  input data,clk,reset;
  output q;
  reg q;
  
  always @(posedge clk or negedge reset)
   begin
     if(~reset)
       begin
         q<= 1'b0;
       end
   else
     begin
       q<=data;
    end
end
endmodule