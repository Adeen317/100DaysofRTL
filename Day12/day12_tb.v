`timescale 10ms/10ms
`include "day12.v"
// Detecting a big sequence - 1110_1101_1011
module day12_tb ();

  reg      clk;
  reg      reset;
  reg      x_i;
  wire     det_o;

  day12 DAY12 (.*);

  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end

  wire [11:0] seq = 12'b1110_1101_1011;

  initial begin
    reset <= 1'b1;
    x_i <= 1'b1;
    @(posedge clk);
    reset <= 1'b0;
    @(posedge clk);
    for (integer i=0; i<=14; i=i+1) begin
      x_i <= seq[i];
      @(posedge clk);
    end
    $finish();
  end

  initial begin
    $dumpfile("day12.vcd");
    $dumpvars(0, day12_tb);
  end

endmodule