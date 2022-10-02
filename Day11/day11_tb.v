`timescale 10ms/10ms
`include "day11.v"
module day11_tb ();

  reg      clk;
  reg      reset;

  wire      empty_o;
  reg[3:0] parallel_i;
  wire     serial_o;
  wire      valid_o;

  day11 DAY11 (.*);

  // Clock
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end

  // Stimulus
  initial begin
    reset <= 1'b1;
    parallel_i <= 4'h0;
    @(negedge clk);
    reset <= 1'b0;
    @(posedge clk);
    for (integer i=0; i<32; i=i+1) begin
      parallel_i <= $urandom_range(0, 4'hF);
      @(posedge clk);
    end
    $finish();
  end

  // VCD
  initial begin
    $dumpfile("day11.vcd");
    $dumpvars(1, day11_tb);
  end

endmodule