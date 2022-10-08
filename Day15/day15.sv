// Round robin arbiter

module day15 (
  input logic clk,
  input logic reset,

  input [3:0] req_in,
  output    logic[3:0]  grant_out
);

  logic [3:0] mask_q;
  logic [3:0] nxt_mask;

  always_ff @(posedge clk or posedge reset) 
    if (reset)
      mask_q <= 4'hF;
    else
      mask_q <= nxt_mask;


  // Next mask based on the current grant
  always_comb begin
    nxt_mask = mask_q;
    if (grant_out[0]) nxt_mask = 4'b1110;
    else if (grant_out[1]) nxt_mask = 4'b1100;
    else if (grant_out[2]) nxt_mask = 4'b1000;
    else if (grant_out[3]) nxt_mask = 4'b0000;
  end

  // Generate the masked requests
  logic [3:0] mask_req;

  assign mask_req = req_in & mask_q;

  assign grant_out = mask_req ? mask_req : req_in;

endmodule