// CPEN 230L lab 10, 5 digit counter top file
// Scott Tornquist 11/13/2019
module cnt5digits_top 
# (parameter base=10)(
output [6:0] HEX5,
output [6:0] HEX4,
output [6:0] HEX3,
output [6:0] HEX2,
output [6:0] HEX1,
input KEY3, //Enable
input KEY0, //Load
input [17:9] SW,
input CLOCK_50);

wire enable_c, nload_c; //creates wires for buttons
wire [$clog2(base)-1:0]  count0_w,  count1_w,  count2_w,  count3_w, count4_w; //creates wires for count values, with variable size

debouncer enable( //puts KEY3 into a clean wire
CLOCK_50,
KEY3,
enable_c);

debouncer nload( //puts KEY1 into a clean wire
CLOCK_50,
KEY0,
nload_c); 

cnt5digits  // instance of cnt5digits with wires connecting to decoder, switch inputs and the clock
#(.base_p(base))
stageM(
count0_w,
count1_w,
count2_w,
count3_w,
count4_w,
enable_c,
nload_c,
SW [13:10],
SW [17:14],
SW [9],
CLOCK_50);
hex7seg // decoders connect to ouput wires 
stage0(
1, // first 4 stages have extra input set to 1
count0_w,
HEX1);
hex7seg
stage1(
1,
count1_w,
HEX2);
hex7seg
stage2(
1,
count2_w,
HEX3);
hex7seg
stage3(
1,
count3_w,
HEX4);
hex7seg
stage4(
count4_w, // last stage input is set ot count, so i blanked out the tens place
count4_w,
HEX5);
endmodule
