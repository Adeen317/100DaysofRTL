// Detecting a big sequence - 1110_1101_1011
module day12 (
  input    clk,
  input    reset,
  input    x_i,

  output   det_o
);

  // Use a shift register to sample the serial input
  reg[11:0] shift_ff;
  wire[11:0] nxt_shift;

  always @(posedge clk or posedge reset)
    if (reset)
      shift_ff <= 12'h0;
    else
      shift_ff <= nxt_shift;

  assign nxt_shift = {shift_ff[10:0], x_i};

  assign det_o = (shift_ff[11:0] == 12'b1110_1101_1011);

endmodule