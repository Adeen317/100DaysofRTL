`timescale 10ms/10ms

module day10_tb ();

  reg         clk;
  reg          reset;
  reg          load_i;
  reg[3:0]     load_val_i;

  wire[3:0]     count_out;

  day10 DAY10 (.*);

  // Clock
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end

  integer cycles;
  initial begin
    reset <= 1'b1;
    load_i <= 1'b0;
    load_val_i <= 4'h0;
    @(posedge clk);
    reset <= 1'b0;
    for (integer i=0; i<3; i=i+1) begin
      load_i <= 1;
      load_val_i <= 3*i;
      cycles = 4'hF - load_val_i[3:0];
      @(posedge clk);
      load_i <= 0;
      while (cycles) begin
        cycles = cycles - 1;
        @(posedge clk);
      end
    end
    $finish();
  end

  initial begin
    $dumpfile("day10.vcd");
    $dumpvars(1);
  end

endmodule