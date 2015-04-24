import lc3b_types::*;

module decode
(
	input clk,
	
	input lc3b_word de_npc_out,
	input lc3b_word de_ir_out,
	input lc3b_nzp gencc_out,
	input lc3b_word sr_reg_data,
	input sr_ld_cc,
	input lc3b_reg sr_drid_out,
	input idmux_sel,
	input srmux_sel,
	
	output lc3b_word agex_npc_in,
	output lc3b_word agex_ir_in,
	output lc3b_word agex_sr1_in,
	output lc3b_word agex_sr2_in,
	output lc3b_reg agex_cc_in,
	output lc3b_reg agex_drid_in

);

lc3b_reg idmux_out;
lc3b_reg drmux_out;

assign agex_npc_in = de_npc_out;
assign agex_ir_in = de_ir_out;

//Add Control Here

regfile reg_file
(
	.clk(clk),
	.load(load_regfile),
	.in(sr_reg_data),
	.src_a(de_npc_out[8:6]), //sr1
	.src_b(idmux_out),
	.dest(sr_drid_out),
	.reg_a(sr1_out),
	.reg_b(sr2_out)
);

mux2 #(.width(3)) drmux
(
	.sel(drmux_sel),
	.a(de_npc_out[11:9]), //dest
	.b(3'b111),
	.f(agex_drid_in)
);

mux2 #(.width(3)) idmux
(
	.sel(idmux_sel),
	.a(de_npc_out[2:0]), //sr2
	.b(de_npc_out[11:9]), //dest
	.f(idmux_out)
);

register #(3) cc
(
	.clk,
	.load(load_cc),
	.in(gencc_out),
	.out(agex_cc_in)
);

endmodule : decode