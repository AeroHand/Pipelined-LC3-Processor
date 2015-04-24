import lc3b_types::*;

module zext_lshf1 #(parameter width = 8)
(
    input [width-1:0] in,
    output lc3b_word out
);

assign out = (($unsigned(in)) << 1);

endmodule : zext_lshf1