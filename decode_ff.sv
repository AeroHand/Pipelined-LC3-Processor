// Decode Flip Flops

module decode_ff
(
	input clk,
	
	// Load Register Signals
	input load_de_npc,
	input load_de_ir,
	
	// Load Register Contents
	input lc3b_word de_npc_in,
	input lc3b_word de_ir_in,
	
	// Output Register Contents
	output lc3b_word de_npc_out,
	output lc3b_word de_ir_out

);


ff de_npc
(
    .clk(clk),
    .load(load_de_npc),
    .d(de_npc_in),
    .q(de_npc_out)
);

ff de_ir
(
    .clk(clk),
    .load(load_de_ir),
    .d(de_ir_in),
    .q(de_ir_out)
);

endmodule : decode_ff