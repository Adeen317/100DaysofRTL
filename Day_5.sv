//ODD COUNTER
module Day_5(a,x,clk,counter);
  input a,x,clk;
  output [0:7] counter;
  logic [7:0] counter=1;
  always@(posedge clk)begin
    if (x) counter<=7'b0;
    else if (a) 
      counter<=counter+2;
  end
endmodule
