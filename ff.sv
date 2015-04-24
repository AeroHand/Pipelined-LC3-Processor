module ff #(parameter width = 16)
(
    input clk,
    input load,
    input [width-1:0] d,
    output logic [width-1:0] q
);

logic [width-1:0] data;

/* Altera device registers are 0 at power on. Specify this
 * so that Modelsim works as expected.
 */
initial
begin
    data = 1'b0;
end

always_ff @(posedge clk)
begin
    if (load)
    begin
        data = d;
    end
end

always_comb
begin
    q = data;
end

endmodule : ff