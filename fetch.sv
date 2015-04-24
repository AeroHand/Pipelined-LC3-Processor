import lc3b_types::*;

module fetch
(
	input clk,
	
	input [15:0] target_pc,
   input [15:0] trap_pc,
   input logic load_pc,
	
	output logic [15:0] pcplus2_out
);

lc3b_word pc_out;
lc3b_word pcmux_out;

// Must add the instruction cache to this stage

mux4 #(.width(16)) pcmux
(
	.sel1(pcmux_sel1),
	.sel2(pcmux_sel2),
	.a(pcplus2_out),
	.b(target_pc),
	.c(trap_pc),
	.d(),
	.f(pcmux_out)
);

register pc
(
    .clk(clk),
    .load(load_pc),
    .in(pcmux_out),
    .out(pc_out)
);

plus2 plus2_unit
(
	.in(pc_out),
	.out(pcplus2_out)
);

endmodule : fetch