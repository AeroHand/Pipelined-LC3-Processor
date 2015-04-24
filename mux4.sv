import lc3b_types::*;

module mux4 #(parameter width = 16)
(
input sel1, sel2,
input [width-1:0] a, b, c, d,
output logic [width-1:0] f
);
always_comb
begin
if (sel1 == 0 && sel2 == 0)
f = a;
else if (sel1 == 1 && sel2 == 0)
f = b;
else if (sel1 == 0 && sel2 == 1)
f = c;
else
f = d;
end
endmodule : mux4