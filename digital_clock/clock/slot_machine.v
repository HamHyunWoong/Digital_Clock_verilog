module slot_machine(sw3, key3, clk_random,
       slot_bcd1, slot_bcd2, slot_bcd3, mode, carry3);
input sw3, key3, clk_random;
output [3:0] slot_bcd1;
output [3:0] slot_bcd2;
output [3:0] slot_bcd3;
output mode, carry3;
wire sw3_key3;
wire mode;
wire [3:0] random_100, random_10, random_1;
wire [9:0] random_value;
wire [3:0] stop_bcd;
wire [3:0] go_bcd1;
wire [3:0] go_bcd2;
wire [3:0] go_bcd3;
wire clk_100Hz;
wire carry1, carry2, carry3;
clk_100Hz_mod SLT1 (.clk(clk_random), .rst(1), .clk_out(clk_100Hz));

assign random_1 = random_value%4'b1010;
assign random_10 = ((random_value - random_1)/4'b1010)%4'b1010;
assign random_100 = (random_value - random_1 - (random_10*4'b1010))/7'b1100100;

assign sw3_key3 = (sw3 == 1) && !key3;

slot_display S8 (.go_bcd(go_bcd1),.stop_bcd(stop_bcd),.slot_bcd(slot_bcd1),.mode(mode&&carry2));

slot_display S7 (.go_bcd(go_bcd2),.stop_bcd(stop_bcd),.slot_bcd(slot_bcd2),.mode(mode&&carry1));

slot_display S6 (.go_bcd(go_bcd3),.stop_bcd(stop_bcd),.slot_bcd(slot_bcd3),.mode(mode));

slot_counter S5 (.go_bcd(go_bcd3),.random(random_100),.clk_100Hz(clk_100Hz),.mode(mode),.carry(carry1));
slot_counter S4 (.go_bcd(go_bcd2),.random(random_10),.clk_100Hz(clk_100Hz),.mode(mode&&carry1),.carry(carry2));
slot_counter S3 (.go_bcd(go_bcd1),.random(random_1),.clk_100Hz(clk_100Hz),.mode(mode&&carry2),.carry(carry3));
go_stop_mode S2 (.sw3_key3(key3), .mode(mode), .sw3(sw3));
stop_count S1 (.clk_100Hz(clk_100Hz),.stop_bcd(stop_bcd),.mode(mode));

random R1 (.clk(clk_random),.mode(mode),.random_value(random_value), .key3(key3), .sw3(sw3));
endmodule

module slot_display(go_bcd, stop_bcd, slot_bcd, mode);
input mode;
input [3:0] go_bcd;
input [3:0] stop_bcd;
output [3:0] slot_bcd;
wire [3:0] slot_bcd, stop_bcd, go_bcd;
assign slot_bcd = (mode) ? go_bcd : stop_bcd;
endmodule

module go_stop_mode(sw3_key3, mode, sw3);
input sw3_key3, sw3;
output reg mode;

always@(negedge sw3_key3)
begin
if(sw3 == 1) begin
if(mode == 1)
mode = 0;
else
mode = 1;
end end
endmodule

module slot_counter(go_bcd, random, clk_100Hz, mode, carry);
input [3:0] random;
input clk_100Hz, mode;
output reg [3:0] go_bcd;
output reg carry;
reg [9:0] count_random;
wire [6:0] number [0:9];

assign number[0] = (random)%4'b1010;
assign number[1] = (random + 4'b0001)%4'b1010;
assign number[2] = (random + 4'b0010)%4'b1010;
assign number[3] = (random + 4'b0011)%4'b1010;
assign number[4] = (random + 4'b0100)%4'b1010;
assign number[5] = (random + 4'b0101)%4'b1010;
assign number[6] = (random + 4'b0110)%4'b1010;
assign number[7] = (random + 4'b0111)%4'b1010;
assign number[8] = (random + 4'b1000)%4'b1010;
assign number[9] = (random + 4'b1001)%4'b1010;

always@ (posedge clk_100Hz)
begin
if(mode == 0)
begin
count_random <= 0;
carry <= 0;
end
else if(count_random < 498)
begin
count_random <= count_random + 1'b1;
carry <= 0;
end
else
begin
count_random <= count_random;
carry <= 1;
end
end

always@ (*)
begin
if(count_random < 2) 
go_bcd <= number[4];
else if(count_random < 7)
go_bcd <= number[5];
else if(count_random < 13)
go_bcd <= number[6];
else if(count_random < 23)
go_bcd <= number[7];
else if(count_random < 33)
go_bcd <= number[8];
else if(count_random < 43)
go_bcd <= number[9];
else if(count_random < 53)
go_bcd <= number[0];
else if(count_random < 63)
go_bcd <= number[1];
else if(count_random < 74)
go_bcd <= number[2];
else if(count_random < 86)
go_bcd <= number[3];
else if(count_random < 100)
go_bcd <= number[4];
else if(count_random < 115)
go_bcd <= number[5];
else if(count_random < 149)
go_bcd <= number[6];
else if(count_random < 224)
go_bcd <= number[7];
else if(count_random < 343)
go_bcd <= number[8];
else if(count_random < 497)
go_bcd <= number[9];
else if(count_random < 500)
go_bcd <= number[0];
else;
end
endmodule

module random (random_value, mode, clk, key3, sw3);
input mode, clk, key3, sw3;
output reg [9:0] random_value;
reg [9:0] random_count = 0;
always@(posedge clk)
begin
if(random_count < 999)
random_count <= random_count + 1;
else
random_count <= 0;
end

always@(posedge key3)
begin
if(sw3 == 1) begin
random_value <= random_count;
end
end
endmodule

module stop_count (clk_100Hz, stop_bcd, mode);
input clk_100Hz, mode;
output reg [3:0] stop_bcd;
always@(posedge clk_100Hz)
begin
if(stop_bcd < 9)
stop_bcd <= stop_bcd + 1;
else
stop_bcd <= 0; 
end
endmodule

module clk_100Hz_mod(clk, rst, clk_out);
input clk, rst;
reg [17:0] cnt_out;
wire [17:0] count_out;
wire invert_q;
output clk_out;
assign invert_q = !clk_out;

always @(posedge clk or negedge rst)
 begin
   if(!rst)
  cnt_out <= 0;
 else if(cnt_out < 249999)
  cnt_out <= cnt_out + 1'b1;
 else
  cnt_out <= 0;
 end
assign count_out  = cnt_out;

dff_counter2 DUT (.d(invert_q), .clk(count_out[17]), .rst(rst), .q(clk_out));


endmodule
 
