module Multiplier #(
    parameter portWidth = 16,
    parameter tempWidth = 2*portWidth
    // Qi.f notation    i < integer  = 5    f < fraction = 11
) (
    input   wire signed [portWidth-1:0] in1,
    input   wire signed [portWidth-1:0] in2,
    input   wire                        clk,
    input   wire                        rst,
    output  reg         [portWidth-1:0] out
);

    reg  signed [tempWidth-1:0] temp;   // a temporary 32-bit regster to hold the multiplication result

    always @(*) 
        begin
            temp = in1 * in2;
            out <= temp[26:11];
        end
endmodule