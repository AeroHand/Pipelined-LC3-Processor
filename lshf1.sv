import lc3b_types::*;

module lshf1
(
	input enable,
	input lc3b_word in,
	output lc3b_word out

);
always_comb
begin
	
	if(enable)
	begin
		out = in << 1;
	end
	
	else
	begin
		out = in;
	end
	
end
endmodule : lshf1