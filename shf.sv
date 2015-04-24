import lc3b_types::*;

module shf #(parameter width = 16)
(
	input logic [width-1:0] shift,
	input lc3b_word in,
	output lc3b_word out

);
always_comb
begin
	out = in << shift;
end
endmodule : shf