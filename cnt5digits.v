// CPEN 230L 5 digit counter
// Scott Tornquist
module cnt5digits 
	#(parameter base_p=10)( //inputs of variable width, 6 instances of modified cntr stage
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
		
		wire term_cnt_o_w0, term_cnt_o_w1, term_cnt_o_w2, term_cnt_o_w3, term_cnt_o_w4, fake,fake1;
cntrStage_m 
#( .cntr_tc_p(50000000/(base_p**3)-1), .cntr_bits_p($clog2(50000000/(base_p**3)-1))) //stage 0 with no output and specialized parameters for term cnt and bits
	stage0 (
		clk_i,
		enable_i,
		nload_i,
		0,
		up_i,
		term_cnt_o_w0,
		fake1);
		
cntrStage_m  #(.cntr_tc_p(base_p-1), .cntr_bits_p ($clog2(base_p-1))) //all other stages connected to output, compunding enables, and the same parameters 
	stage1 (
		clk_i,
		term_cnt_o_w0,
		nload_i,
		0,
		up_i,
		term_cnt_o_w1,
		count0_o);
		
cntrStage_m #(.cntr_tc_p(base_p-1), .cntr_bits_p ($clog2(base_p-1)))
	stage2 (
		clk_i,
		term_cnt_o_w0 && term_cnt_o_w1,
		nload_i,
		0,
		up_i,
		term_cnt_o_w2,
		count1_o);
		
cntrStage_m #(.cntr_tc_p(base_p-1), .cntr_bits_p($clog2(base_p-1)))
	stage3 (
		clk_i,
		term_cnt_o_w0 && term_cnt_o_w1 && term_cnt_o_w2,
		nload_i,
		0,
		up_i,
		term_cnt_o_w3,
		count2_o);

cntrStage_m #(.cntr_tc_p(base_p-1), .cntr_bits_p($clog2(base_p-1)))
	stage4 (
		clk_i,
		term_cnt_o_w0 && term_cnt_o_w1 && term_cnt_o_w2 && term_cnt_o_w3,
		nload_i,
		loadvalue1_i,
		up_i,
		term_cnt_o_w4,
		count3_o);

cntrStage_m #(.cntr_tc_p(base_p-1), .cntr_bits_p($clog2(base_p-1)))
	stage5 (
		clk_i,
		term_cnt_o_w0 && term_cnt_o_w1 && term_cnt_o_w2 && term_cnt_o_w3 && term_cnt_o_w4,
		nload_i,
		loadvalue2_i,
		up_i,
		fake,
		count4_o);
endmodule

		
		
		
		
		
		
		
		
		


 
