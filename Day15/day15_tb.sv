// TB for round robin

module day15_tb ();

  logic         clk;
  logic         reset;

  logic [3:0]   req_in;
  logic [3:0]   grant_out;

  day15 DAY15 (.*);


  initial begin
    $dumpfile("day15.vcd");
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
    req_in <= 4'h0;
    @(posedge clk);
    reset <= 1'b0;
    @(posedge clk);
    @(posedge clk);
    for (int i =0; i<32; i++) begin
      req_in <= $urandom_range(0, 4'hF);
      @(posedge clk);
    end
    $finish();
  end
endmodule