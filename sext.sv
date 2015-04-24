import lc3b_types::*;

module sext #(parameter width = 16)
(
	input logic [width-1:0] in,
	output lc3b_word out

);
always_comb
begin
	out = $signed(in);
end
endmodule : sext