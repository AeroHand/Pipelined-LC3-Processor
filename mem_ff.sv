 import lc3b_types::*;

module mem_ff
(
    input clk,
	
	// Load ff Signals
	input load_mem_npc,
	input load_mem_cs,
	input load_mem_ir,
	input load_mem_address,
	input load_mem_aluresult,
	input load_mem_cc,
	input load_mem_drid,
	
	// Load ff Contents
	input lc3b_word mem_address_in,
	input lc3b_cs mem_cs_in,
	input lc3b_word mem_npc_in,
	input lc3b_nzp mem_cc_in,
	input lc3b_word mem_aluresult_in,
	input lc3b_word mem_ir_in,
	input lc3b_nzp mem_drid_in,
	
	// Output ff Contents
	output lc3b_word mem_address_out,
	output lc3b_cs mem_cs_out,
	output lc3b_word mem_npc_out,
	output lc3b_cc mem_cc_out,
	output lc3b_word mem_aluresult_out,
	output lc3b_word mem_ir_out,
	output lc3b_drid mem_drid_out
	
 );

ff mem_address
(
	.clk,
	.load(load_mem_address),
	.in(mem_address_in),
	.out(mem_address_out)
);

ff #(11) mem_cs
(
	.clk,
	.load(load_mem_cs),
	.in(mem_cs_in),
	.out(mem_cs_out)
);

ff mem_npc
(
	.clk,
	.load(load_mem_npc),
	.in(mem_npc_in),
	.out(mem_npc_out)
);

ff #(3) mem_cc
(
	.clk,
	.load(load_mem_cc),
	.in(mem_cc_in),
	.out(mem_cc_out)
);

ff mem_aluresult
(
	.clk,
	.load(load_mem_aluresult),
	.in(mem_alureult_in),
	.out(mem_aluresult_out)
);

ff mem_ir
(
	.clk,
	.load(load_mem_ir),
	.in(mem_ir_in),
	.out(mem_ir_out)
);

ff #(3) mem_drid
(
	.clk,
	.load(load_mem_drid),
	.in(mem_drid_in),
	.out(mem_drid_out)
);

endmodule : mem_ff