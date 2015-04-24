import lc3b_types::*;

module sr_ff
(
    input clk,
	
	// Load Register Signals
	input load_sr_address,
	input load_sr_data,
	input load_sr_cs,
	input load_sr_npc,
	input load_sr_aluresult,
	input load_sr_ir,
	input load_sr_drid,
	
	// Load Register Contents
	input lc3b_word sr_address_in,
	input lc3b_word sr_data_in,
	input lc3b_four sr_cs_in,
	input lc3b_word sr_npc_in,
	input lc3b_word sr_aluresult_in,
	input lc3b_word sr_ir_in,
	input lc3b_nzp sr_drid_in,
	
	// Output Register Contents
	output lc3b_word sr_address_out,
	output lc3b_word sr_data_out,
	output lc3b_four sr_cs_out,
	output lc3b_word sr_npc_out,
	output lc3b_word sr_aluresult_out,
	output lc3b_word sr_ir_out,
	output lc3b_nzp sr_drid_out
	
    );

// Incoming Registers
register sr_address
(
	.clk,
	.load(load_sr_address),
	.in(sr_address_in),
	.out(sr_address_out)
);

register sr_data
(
	.clk,
	.load(load_sr_data),
	.in(sr_data_in),
	.out(sr_data_out)
);

register #(4) sr_cs
(
	.clk,
	.load(load_sr_cs),
	.in(sr_cs_in),
	.out(sr_cs_out)
);

register sr_npc
(
	.clk,
	.load(load_sr_npc),
	.in(sr_npc_in),
	.out(sr_npc_out)
);

register sr_aluresult
(
	.clk,
	.load(load_sr_aluresult),
	.in(sr_aluresult_in),
	.out(sr_aluresult_out)
);

register sr_ir
(
	.clk,
	.load(load_sr_ir),
	.in(sr_ir_in),
	.out(sr_ir_out)
);

register #(3) sr_drid
(
	.clk,
	.load(load_sr_drid),
	.in(sr_drid_in),
	.out(sr_drid_out)
);

endmodule : sr_ff