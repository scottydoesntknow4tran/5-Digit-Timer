// CPEN 230L timerModN test bench
// Scott Tornquist

`timescale 1ms / 100ns  // 1 sim tick = 1 ms, times to 100 ns resolution

module cnt5digits_tb;
      
  wire [1:0] count0;     // DUT count output
  wire [1:0] count1;
  wire [1:0] count2;
  wire [1:0] count3;
  wire [1:0] count4;                    // DUT inputs and outputs
  reg        enable_i=1;  
  reg        nload_i=1;
  reg 	     loadvalue1_i= 0;
  reg 	     loadvalue2_i= 0;
  reg	     up_i=1;
  reg        clk = 1;   // clock input to DUT
      
            

  // We want 5 clock periods to correspond with 1 second, or 1/2 clock
  // period to correspond with 1/10 seconds = 100 ms = 100 simulation
  // time ticks.
  always
    #.25 clk = ~clk;   // clock + edges at 200, 400, 600... ms

  initial begin
    $dumpfile("a.vcd");         // for GTKWave
    $dumpvars(0, cnt5digits_tb); // for GTKWave
    $display(" time  count0 count1 count2 count3 count4");    // table header
    $monitor("%5d %6d %2 %2 %2 %2",         // table formatting
      $time, count0, count1, count2, count3, count4);            // table signals

                         // Test Procedure
           nRst = 1'b0;  // @t=0, reset
    #100   nRst = 1'b1;  // @t=100ms, 1st falling clock edge, count
    #12400 nRst = 1'b0;  // @t=12.5s, mid "2", stop counting
    #1500  $finish;      // @t=14s, finish
  end

  cnt5digits #(.stage0_tc (4)) DUT (  // 5 clocks per count update
    .count0_o (count0),
    .count1_o (count1),
    .count2_o (count2),
    .count3_o (count3),
    .count4_o (count4),
    .enable_i (enable_i),
    .nload_i  (nload_i),
    .loadvalue1_i (loadvalue1_i),
    .loadvalue2_i (loadvalue2_i),
    .up_i     (up_i),
    .clk_i    (clk));

endmodule


#(parameter base_p=2)(
		output [$clog2(base_p)-1:0]  count0_o, 
		output [$clog2(base_p)-1:0]  count1_o, 
		output [$clog2(base_p)-1:0]  count2_o,
		output [$clog2(base_p)-1:0]  count3_o, 
		output [$clog2(base_p)-1:0]  count4_o, 
		input  enable_i, 
		input  nload_i,  
		input  [$clog2(base_p)-1:0]  loadvalue1_i, 
		input  [$clog2(base_p)-1:0]  loadvalue2_i, 
		input  up_i, 
		input  clk_i);