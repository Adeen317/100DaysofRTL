module day8_tb();

  logic [3:0] input_b;
  logic [15:0] binary_to_one_o;

  day8 DAY8 (.input_b(input_b),
             .binary_to_one_o(binary_to_one_o));

    initial begin
    $dumpfile("day8.vcd");
      $dumpvars(1, day8_tb);
  end

  initial begin
    input_b = $urandom_range(0, 4'hF);
      #5;
    input_b = $urandom_range(0, 4'hF);
      #5;
    input_b = $urandom_range(0, 4'hF);
      #5;
    input_b = $urandom_range(0, 4'hF);
      #5;
    input_b = $urandom_range(0, 4'hF);
      #5;
        input_b = $urandom_range(0, 4'hF);
      #5;
        input_b = $urandom_range(0, 4'hF);
      #5;
        input_b = $urandom_range(0, 4'hF);
      #5;
  end

endmodule
