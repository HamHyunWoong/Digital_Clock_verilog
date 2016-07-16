module seven_seg_AP_decoder(display,bcd_in);
  
  output reg[6:0] display;
  input [3:0] bcd_in;

  
  parameter BLANK = 7'b111_1111;
  parameter AM = 7'b000_1000;
  parameter PM = 7'b000_1100;

  always @(bcd_in)
  case (bcd_in)
    0: display = AM;
    1: display = PM;
  
    default :display =BLANK;
  endcase
endmodule
