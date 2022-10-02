// Simple shift register
module day6(
  input logic clk,
  input logic reset,
  input logic in,      
  output logic [3:0] out
);

  logic [3:0] sr_ff;
  logic [3:0] nxt_sr;

  always_ff @(posedge clk or posedge reset)
    if (reset)
      sr_ff <= 4'h0;
    else
      sr_ff <= nxt_sr;

  assign nxt_sr = {sr_ff[2:0], in};

  assign out = sr_ff;

endmodule
