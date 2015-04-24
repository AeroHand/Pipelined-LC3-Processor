import lc3b_types::*;

module agex
(
	// EXTERNAL SIGNALS
	
	input clk,
	
	// Incoming Registers
	input lc3b_word agex_npc_out,
	input lc3b_twenty agex_cs_out,
	input lc3b_word agex_ir_out,
	input lc3b_word agex_sr1_out,
	input lc3b_word agex_sr2_out,
	input lc3b_nzp agex_cc_out,
	input lc3b_nzp agex_drid_out,
	
	// Address Generation Components
	input addr1mux_sel,
	input addr2mux_sel1,
	input addr2mux_sel2,
	input addressmux_sel,
	input lshf1_enable,
	input aluresultmux_sel,
	input sr2mux_sel,
	input lc3b_aluop aluop,
	
	// Outgoing Registers
	output lc3b_word mem_address_in,
	output lc3b_eleven mem_cs_in,
	output lc3b_word mem_npc_in,
	output lc3b_nzp mem_cc_in,
	output lc3b_word mem_aluresult_in,
	output lc3b_word mem_ir_in,
	output lc3b_drid mem_drid_in
);

// INTERNAL SIGNALS
lc3b_word addr1mux_out;
lc3b_word sext_ir6_out;
lc3b_word sext_ir9_out;
lc3b_word sext_ir11_out;
lc3b_word addr2mux_out;
lc3b_word lshf1_addr_out;
lc3b_word adder_out;
lc3b_word zext_lshf1_ir_out;
lc3b_word addressmux_out;
lc3b_word sext_ir5_out;
lc3b_word sr2mux_out;
lc3b_word alu_out;
lc3b_word shf_out;
lc3b_word aluresultmux_out;

mux2 addr1mux
(
	.sel(addr1mux_sel),
	.a(agex_npc_out),
	.b(agex_sr1_out),
	.f(addr1mux_out)
);

sext sext_ir6
(
	.in(agex_ir_out[5:0]),
	.out(sext_ir6_out)
);

sext sext_ir9
(
	.in(agex_ir_out[8:0]),
	.out(sext_ir9_out)
);

sext sext_ir11
(
	.in(agex_ir_out[10:0]),
	.out(sext_ir11_out)
);

mux4 addr2mux
(
	.sel1(addr2mux_sel1),
	.sel2(addr2mux_sel2),
	.a(/* Zero */),
	.b(sext_ir6_out),
	.c(sext_ir9_out),
	.d(sext_ir11_out),
	.f(addr2mux_out)
);

lshf1 lshf1_addr
(
	.enable(lshf1_enable),
	.in(addr2mux_out),
	.out(lshf1_addr_out)
);

adder adder_agex
(
	.aa(addr1mux_out),
	.bb(lshf1_addr_out),
	.ff(adder_out)
);

zext_lshf1 zext_lshf1_ir
(
	.in(agex_ir_out[7:0]),
	.out(zext_lshf1_ir_out)
);

mux2 addressmux
(
	.sel(addressmux_sel),
	.a(zext_lshf1_ir_out),
	.b(adder_out),
	.f(addressmux_out)
);

sext sext_ir5
(
	.in(agex_ir_out[4:0]),
	.out(sext_ir5_out)
);

mux2 sr2mux
(
	.sel(sr2mux_sel),
	.a(agex_sr2_out),
	.b(sext_ir5_out),
	.f(sr2mux_out)
);

alu alu
(
	.aluop(aluop),
	.a(agex_sr1_out),
	.b(sr2mux_out),
	.f(alu_out)
);

shf shf
(
	.shift(agex_ir_out[5:0]),
	.in(agex_sr1_out),
	.out(shf_out)
);

mux2 aluresultmux
(
	.sel(aluresultmux_sel),
	.a(shf_out),
	.b(alu_out),
	.f(aluresultmux_out)
);

endmodule: agex