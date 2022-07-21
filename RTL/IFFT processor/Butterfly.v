module Butterfly #(
        parameter portWidth = 16
    ) (
    input wire signed [portWidth-1:0]   bflyIn1R,          // Butterfly Real input 1
    input wire signed [portWidth-1:0]   bflyIn1I,          // Butterfly Img input 1
    input wire signed [portWidth-1:0]   bflyIn2R,          // Butterfly Real input 2
    input wire signed [portWidth-1:0]   bflyIn2I,          // Butterfly Img input 2
    input wire signed [portWidth-1:0]   bflyWr,            // Butterfly Real Twiddle factor
    input wire signed [portWidth-1:0]   bflyWi,            // Butterfly Img Twiddle factor
    input wire                          clk,
    input wire                          rst,
    output reg signed [portWidth-1:0]   bflyOut1R,         // Butterfly Real Output 1
    output reg signed [portWidth-1:0]   bflyOut1I,         // Butterfly Img Output 1
    output reg signed [portWidth-1:0]   bflyOut2R,         // Butterfly Real Output 2
    output reg signed [portWidth-1:0]   bflyOut2I          // Butterfly Img Output 2
);
    wire signed [portWidth-1:0] mul1;                             // Reg to store Wr * In2R
    wire signed [portWidth-1:0] mul2;                             // Reg to store Wi * In2I
    wire signed [portWidth-1:0] mul3;                             // Reg to store Wr * In2I
    wire signed [portWidth-1:0] mul4;                             // Reg to store WI * In2R

        // Calculate mul1 = Wr * In2R
    Multiplier Multiplier_U1(
        .in1    (bflyWr),
        .in2    (bflyIn2R),
        .clk    (clk),
        .rst    (rst),
        .out    (mul1)
    );

        // Calculate mul2 = Wi * In2I
     Multiplier Multiplier_U2(
        .in1    (bflyWi),
        .in2    (bflyIn2I),
        .clk    (clk),
        .rst    (rst),
        .out    (mul2)
    );

        // Calculate mul3 = Wr * In2I
     Multiplier Multiplier_U3(
        .in1    (bflyWr),
        .in2    (bflyIn2I),
        .clk    (clk),
        .rst    (rst),
        .out    (mul3)
    );

        // Calculate mul4 = WI * In2R
     Multiplier Multiplier_U4(
        .in1    (bflyWi),
        .in2    (bflyIn2R),
        .clk    (clk),
        .rst    (rst),
        .out    (mul4)
    );

    always @(*) 
        begin
            bflyOut1R <= bflyIn1R + mul1 - mul2;     // Output1R = In1R + Wr*In2R - Wi*In2I
            bflyOut1I <= bflyIn1I + mul3 + mul4;     // Output1I = In1R + Wr*In2I + Wi*In2R
            bflyOut2R <= bflyIn1R - mul1 + mul2;     // Output2R = In1R - Wr*In2R + Wi*In2I
            bflyOut2I <= bflyIn1I - mul3 - mul4;     // Output2I = In1R - Wr*In2I - Wi*In2R
        end

endmodule