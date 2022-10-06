module day14_tb ();

  localparam bits = 8;

  logic[bits-1:0] req_in;
  logic[bits-1:0] grant_out;

  day14 #(bits) DAY14 (.*);

  initial begin
    $dumpfile("day14.vcd");
    $dumpvars(1);
  end
  initial begin
    for (int i=0; i<16; i=i+1) begin
      req_in = i+1;
      #5;
    end
  end