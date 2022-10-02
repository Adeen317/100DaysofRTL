module day7_tb ();

  logic         clk;
  logic         reset;
  logic [3:0]   out;

  day7 DAY7 (.*);
   
  initial begin
    $dumpfile("day7.vcd");
    $dumpvars(1);
  end

  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end

  initial begin
    reset <= 1'b1;
    @(posedge clk);
    reset <= 1'b0;
    @(posedge clk);
    for (int i=0; i<32; i=i+1) begin
      @(posedge clk);
    end
    $finish();
  end

endmodule
