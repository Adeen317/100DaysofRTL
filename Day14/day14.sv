// Priority arbiter
// port[0] - highest priority

module day14 #(
  parameter bits = 4
)(
  input  [bits-1:0] req_in,
  output [bits-1:0] grant_out
);
  // Port[0] has highest priority
  assign grant_out[0] = req_in[0];

  genvar i;
  for (i=1; i<bits; i=i+1) begin
    assign grant_out[i] = req_in[i] & ~(|grant_out[i-1:0]);
  end

endmodule