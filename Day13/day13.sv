// Various ways to implement a mux

module day13 (
  input [3:0] a_i,
  input [3:0] sel_i,

  output logic ternary_out,
  output logic case_o,
  output logic ifelse_o,
  output logic loop_o,
  output logic and_or_o
);

  // Ternary operator
  assign ternary_out = sel_i[0] ? a_i[0] :sel_i[1] ? a_i[1] :sel_i[2] ? a_i[2] :a_i[3];

  // Using case
  always_comb begin
    case (sel_i)
      4'b0001 : case_o = a_i[0];
      4'b0010 : case_o = a_i[1];
      4'b0100 : case_o = a_i[2];
      4'b1000 : case_o = a_i[3];
      default : case_o = 1'bx;
    endcase
  end

  // Using ifelse
  always_comb begin
    if (sel_i[0])      ifelse_o = a_i[0];
    else if (sel_i[1]) ifelse_o = a_i[1];
    else if (sel_i[2]) ifelse_o = a_i[2];
    else if (sel_i[3]) ifelse_o = a_i[3];
    else               ifelse_o = 1'bx;
  end

  // Using and-or tree
  assign and_or_o = (sel_i[0] & a_i[0]) |
                   (sel_i[1] & a_i[1]) |
                   (sel_i[2] & a_i[2]) |
                   (sel_i[3] & a_i[3]);

endmodule
