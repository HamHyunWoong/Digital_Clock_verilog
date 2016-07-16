module clk_gen(sw1,sw2,sw3,sw4,
					button1, button2, button3, button4,
               clk,
	            seven_seg1,seven_seg2,seven_seg3,seven_seg4,seven_seg5,seven_seg6,seven_seg7,seven_seg8,LEDR0,LEDR1,LEDR2,LEDR3,LEDR4,LEDR5,LEDR6,LEDR7,LEDR8,LEDR9);
  

  input clk, sw1, sw2, sw3, sw4, button1, button2, button3, button4;
  output [6:0] seven_seg1;
  output [6:0] seven_seg2;
  output [6:0] seven_seg3;
  output [6:0] seven_seg4;
  output [6:0] seven_seg5;
  output [6:0] seven_seg6;
  output [6:0] seven_seg7;
  output [6:0] seven_seg8;
  output  LEDR0;
  output  LEDR1;
  output  LEDR2;
  output  LEDR3;
  output  LEDR4;
  output  LEDR5;
  output  LEDR6;
  output  LEDR7;
  output  LEDR8;
  output  LEDR9;
  
  wire [3:0] blink_count1, blink_count2, blink_count3, blink_count4, blink_count5, blink_count6;
  wire [3:0] blink_count11, blink_count22, blink_count33,blink_count44,blink_count55,blink_count66;
  
  wire [1:0] tap_out;
  wire [24:0] counter_out;
  
  wire [3:0] count;
  
  wire setting_toggle;
  wire inv_q;
  wire clk_out;
  assign inv_q = !clk_out;
  
  wire [1:0] tap_ap;
  
  wire [3:0] LED;


seven_seg_decoder SSD1(.bcd_in(blink_count1),.game_bcd_in(game_count1),.display(seven_seg1));
seven_seg_decoder SSD2(.bcd_in(blink_count2),.game_bcd_in(game_count2),.display(seven_seg2));
seven_seg_decoder SSD3(.bcd_in(blink_count3),.game_bcd_in(game_count3),.display(seven_seg3));
seven_seg_decoder SSD4(.bcd_in(blink_count4),.game_bcd_in(game_count4),.display(seven_seg4));
seven_seg_decoder SSD5(.bcd_in(blink_count5),.game_bcd_in(game_count5),.display(seven_seg5));
seven_seg_decoder SSD6(.bcd_in(blink_count6),.game_bcd_in(game_count6),.display(seven_seg6));
seven_seg_AP_decoder APD(.display(seven_seg7),.bcd_in(tap_ap)) ;
seven_seg_decoder SSD8(.bcd_in(10),.game_bcd_in(game_count8),.display(seven_seg8));



 alm AL(.button1(button1),.button2(button2),.button3(button3),.button4(button),
			  .sw1(sw1), .sw2(sw2), .sw3(sw3), .sw4(sw4), .clk(clk), .tap_out(tap_out),
           .blink_count11(blink_count11), .blink_count22(blink_count22), .blink_count33(blink_count33), .blink_count44(blink_count44), .blink_count55(blink_count55), .blink_count66(blink_count66),
			  .setting_toggle(setting_toggle),.LED_alm(LED));

led_counter_decoder LD(.clk(clk),.bcd_in(count),.LEDR0(LEDR0),.LEDR1(LEDR1),.LEDR2(LEDR2),.LEDR3(LEDR3),.LEDR4(LEDR4),.LEDR5(LEDR5),.LEDR6(LEDR6),.LEDR7(LEDR7),.LEDR8(LEDR8));

  mode_selector M1 (.sw1(sw1),.sw2(sw2),.sw3(sw3),.sw4(sw4),
                    .button1(button1),.button2(button2),.button3(button3),.button4(button4),
						  .sw1_button3(sw1_button3),.sw2_button3(sw2_button3),
						  .switch1(switch1),.switch2(switch2),
						  .switch1and2(switch1and2),.setting_toggle(setting_toggle), .tap_out(tap_out)
						  
						  );  
  counter_mod_25000000 U1 (.count(counter_out),.clk(clk),.rst(button4));
  dff_async_reset U2 (.data(inv_q),.clk(counter_out[24]),.reset(button4),.q(clk_out));
  
  bcd_to_seg BTS(.button1(button1),.button2(button2),.button3(button3),.button4(button4),
					  .sw1(sw1),.sw2(sw2),.sw3(sw3),.sw4(sw4),.clk(clk_out),.ampm(tap_ap),
                 .blink_count1(blink_count1),.blink_count2(blink_count2),.blink_count3(blink_count3),
					  .blink_count4(blink_count4),.blink_count5(blink_count5),.blink_count6(blink_count6),
					  .setting_toggle(setting_toggle), .tap_out(tap_out),.count(count));
  
endmodule

module mode_selector (sw1, sw2, sw3, sw4,
							 button1, button2, button3, button4,
							 sw1_button3,sw2_button3,
							 switch1, switch2, switch1and2, setting_toggle, tap_out);
 input sw1, sw2, sw3, sw4, button1, button2, button3, button4;
 output switch1, switch2, sw1_button3, sw2_button3, switch1and2;
 output reg setting_toggle = 0;
 output reg [1:0] tap_out;
 wire switch1, switch2, sw1_button3, sw2_button3, switch1and2;
 assign switch1 = (sw1 && sw2 == 0);
 assign switch2 = (sw1 == 0 && sw2);
 assign switch1and2 = (sw1 && sw2);
 assign sw1_button3 = (switch1 && !button3);
 assign sw2_button3 = (switch2 && !button3);
 assign toggle_key = !button1 &&(sw1 == 0 && sw2 == 0);
 always@(posedge toggle_key)

 begin
 if(setting_toggle == 1)
 setting_toggle <= 0;
 else
 setting_toggle <= 1;
 end
 always@(posedge button2)
 begin
 if(tap_out < 2)
 tap_out <= tap_out + 1;
 else
 tap_out <= 0;
 end
 endmodule
 
 
 
 
 
 
 
 /*
module slot(clk, sw1, sw2, sw1_button3, sw2_button3,
            game_count1, game_count2, game_count3, game_count4, game_count5, game_count6, game_count7, game_count8);
input sw1, sw2, sw1_button3, sw2_button3;
output [3:0] game_count1, game_count2, game_count3, game_count4, game_count5, game_count6, game_count7, game_count8;


endmodule
module money(clk, clk_out, sw2, sw2_button3, 
             money_count1, money_count2, money_count3, money_count4, money_count5, money_count6, money_count7, money_count8);
input clk, sw2, sw2_button3;
output [3:0] money_count1, money_count2, money_count3, money_count4, money_count5, money_count6, money_count7, money_count8;
reg [1:0] upgrade;
reg money_clk;
integer money;
wire [3:0] money_count1, money_count2, money_count3, money_count4;

assign money_count1 = money%10;
assign money count2 = (money/10)%10;
assign money count3 = (money/100)%10;
assign money count4 = (money/1000)%10;

assign money_clk = clk_out;

always@(negedge button3)
begin
if(button3)
money_clk <= 1;
end

always@(posedge money_clk)
begin
money <= money + (upgrade+1);
end


always@(negedge sw2_button3)
begin
if(upgrade < 2)
upgrade <= upgrade + 1;
else
upgrade <= upgrade;
end
endmodule
 */
 
 
 
 
 
 
 
 
 
 
 
 
 