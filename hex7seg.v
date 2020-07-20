// CPEN 230L lab 10, modified hex to 7-segment decoder
// Scott Tornquist 11/13/2019

module hex7seg (
  input [3:0] none, //new input used to blank
  input  [3:0] num_i,
  output [6:0] disp_o );

  // 7-segment display segment number: 6543210
  assign disp_o = (none  == 4'd0) ? 7'b1111111 : // blank
						(num_i == 4'h0) ? 7'b1000000 : //0
                  (num_i == 4'h1) ? 7'b1111001 : //1
                  (num_i == 4'h2) ? 7'b0100100 : //2
                  (num_i == 4'h3) ? 7'b0110000 : //3
                  (num_i == 4'h4) ? 7'b0011001 ://4
                  (num_i == 4'h5) ? 7'b0010010 ://5
                  (num_i == 4'h6) ? 7'b0000010 ://6
                  (num_i == 4'h7) ? 7'b1111000 ://7
                  (num_i == 4'h8) ? 7'b0000000 ://8
                  (num_i == 4'h9) ? 7'b0011000 ://9
                  (num_i == 4'hA) ? 7'b0001000 ://A
                  (num_i == 4'hB) ? 7'b0000011 ://b
						(num_i == 4'hC) ? 7'b1000110 ://C
						(num_i == 4'hD) ? 7'b0100001 ://d
						(num_i == 4'hE) ? 7'b0000110 ://E
												7'b0001110 ;//else display F
						
                  // complete for C, d ,E, and F.
endmodule
