//Day 5
module d_flipflop(D,clk,q);
  input logic D,clk;
  output logic q;
  
  always@(posedge clk)
    begin
      q<=D;
    end
endmodule
