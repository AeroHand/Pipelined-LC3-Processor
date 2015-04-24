module adder #(parameter width = 16)
(
  input [width-1:0] aa, bb,
  output logic [width-1:0] ff
);
always_comb
begin
  ff=aa+bb;
end
endmodule : adder