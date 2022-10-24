// Construct the class in TB

module day22_tb();

  day22 DAY22;

  initial begin
    DAY22 = new();
    DAY22.hello();
    $finish();
  end

endmodule