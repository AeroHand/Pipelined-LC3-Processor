import lc3b_types::*;

module mem
(
	input lc3b_word mem_address_out,
	input lc3b_eleven mem_cs_out,
	input lc3b_word mem_npc_out,
	input lc3b_nzp mem_cc_out,
	input lc3b_word mem_aluresult_out,
	input lc3b_word mem_ir_out,
	input lc3b_nzp mem_drid_out,
	
	output lc3b_word sr_address_in,
	output lc3b_word sr_data_in,
	output lc3b_four sr_cs_in,
	output lc3b_word sr_npc_in,
	output lc3b_word sr_aluresult_in,
	output lc3b_word sr_ir_in,
	output lc3b_nzp sr_drid_in,
	
	input [15:0] mem_rdata,
	output logic [15:0] mem_address,
	output logic [15:0] mem_wdata
);

// Transfer over all necessary signals
assign sr_address_in = mem_address_out;
assign sr_data_in = mem_rdata;
assign sr_cs_in = mem_cs_out[10:7];
assign sr_aluresult_in = mem_aluresult_out;
assign sr_npc_in = mem_npc_out;
assign sr_aluresult_in = mem_aluresult_out;
assign sr_ir_in = mem_ir_out;
assign sr_drid_in = mem_drid_out;

assign mem_address = mem_address_out;
assign mem_wdata = mem_aluresult_out;

endmodule: mem