import lc3b_types::*;

module agex_ff
(
    input clk,
	
	// Load ff Signals
	input load_agex_npc,
	input load_agex_cs,
	input load_agex_ir,
	input load_agex_sr1,
	input load_agex_sr2,
	input load_agex_cc,
	input load_agex_drid,
	
	// Load ff Contents
	input lc3b_word agex_npc_in,
	input lc3b_twenty agex_cs_in,
	input lc3b_word agex_ir_in,
	input lc3b_word agex_sr1_in,
	input lc3b_word agex_sr2_in,
	input lc3b_nzp agex_cc_in,
	input lc3b_nzp agex_drid_in,
	
	// Output ff Contents
	output lc3b_word agex_npc_out,
	output lc3b_twenty agex_cs_out,
	output lc3b_word agex_ir_out,
	output lc3b_word agex_sr1_out,
	output lc3b_word agex_sr2_out,
	output lc3b_nzp agex_cc_out,
	output lc3b_nzp agex_drid_out
	
    );

// Incoming ffs
ff agex_npc
(
	.clk,
	.load(load_agex_npc),
	.in(agex_npc_in),
	.out(agex_npc_out)
);

ff #(20) agex_cs
(
	.clk,
	.load(load_agex_cs),
	.in(agex_cs_in),
	.out(agex_cs_out)
);

ff agex_ir
(
	.clk,
	.load(load_agex_ir),
	.in(agex_ir_in),
	.out(agex_ir_out)
);

ff agex_sr1
(
	.clk,
	.load(load_agex_sr1),
	.in(agex_sr1_in),
	.out(agex_sr1_out)
);

ff agex_sr2
(
	.clk,
	.load(load_agex_sr2),
	.in(agex_sr2_in),
	.out(agex_sr2_out)
);

ff #(3) agex_cc
(
	.clk,
	.load(load_agex_cc),
	.in(agex_cc_in),
	.out(agex_cc_out)
);

ff #(3) agex_drid
(
	.clk,
	.load(load_agex_drid),
	.in(agex_drid_in),
	.out(agex_drid_out)
);

endmodule : agex_ff