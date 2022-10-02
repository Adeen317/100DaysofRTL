// Binary to one-hot

module day8(
  input   wire[3:0]     input_b,
  output  wire[15:0] binary_to_one_o
);

  assign binary_to_one_o = 1'b1<<input_b;

endmodule
