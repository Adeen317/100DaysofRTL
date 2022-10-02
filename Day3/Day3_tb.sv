
module opcode_tb(); 
  logic a;
  logic x;
  logic clk;
  logic counter;
  logic ct;
  logic out;
  logic ct1;
  logic counter1;
  logic out1;
  opcode gtel(.clk(clk),
              .a(a),
              .x(x),
           .ct(ct),
              .ct1(ct1),
              .out1(out1),
             .out(out),
           .counter(counter),
       .counter1(counter1));
  initial begin
    $dumpfile("test.vcd");
    $dumpvars(1);
  end
  initial begin
    forever #1 clk=~clk;
  end 
  initial begin
    a=1;
    x=0;
    clk=0;
    #50 $finish();
  end 
  always #45 a=~a;
endmodule
