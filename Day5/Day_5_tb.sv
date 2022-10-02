// ODD COUNTER
module Day_5_tb;
  logic a;
  logic x;
  logic clk;
  logic [7:0] counter;
  Day_5 gtel(.clk(clk),
              .a(a),
              .x(x),
          .counter(counter));
  initial begin
    $dumpfile("test.vcd");
    $dumpvars(1);
  end
  initial begin
    a=1;
    x=0;
    clk=0;
    #200 $finish();
  end 
  always #100 a=~a;
  always #1 clk=~clk;
endmodule
