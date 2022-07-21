module EightPointsFFT #( parameter inWidth = 16
)(
    // Inputs
    input wire signed [inWidth-1:0]   in0R,
    input wire signed [inWidth-1:0]   in0I,
    input wire signed [inWidth-1:0]   in1R,
    input wire signed [inWidth-1:0]   in1I,
    input wire signed [inWidth-1:0]   in2R,
    input wire signed [inWidth-1:0]   in2I,
    input wire signed [inWidth-1:0]   in3R,
    input wire signed [inWidth-1:0]   in3I,
    input wire signed [inWidth-1:0]   in4R,
    input wire signed [inWidth-1:0]   in4I,
    input wire signed [inWidth-1:0]   in5R,
    input wire signed [inWidth-1:0]   in5I,
    input wire signed [inWidth-1:0]   in6R,
    input wire signed [inWidth-1:0]   in6I,
    input wire signed [inWidth-1:0]   in7R,
    input wire signed [inWidth-1:0]   in7I,
    
    input wire                        clk,
    input wire                        rst,

    // Outputs
    output reg        [15:0]          out0R,
    output reg        [15:0]          out0I,
    output reg        [15:0]          out1R,
    output reg        [15:0]          out1I,
    output reg        [15:0]          out2R,
    output reg        [15:0]          out2I,
    output reg        [15:0]          out3R,
    output reg        [15:0]          out3I,
    output reg        [15:0]          out4R,
    output reg        [15:0]          out4I,
    output reg        [15:0]          out5R,
    output reg        [15:0]          out5I,
    output reg        [15:0]          out6R,
    output reg        [15:0]          out6I,
    output reg        [15:0]          out7R,
    output reg        [15:0]          out7I
);

    //Twiddle Factor lookup table
    // W0 = 1 + j0
    parameter signed W0r = 16'b00001_00000000000;
    parameter signed W0i = 16'b0;
 
    // W1 = 0.923 - j0.382
    parameter signed W1r = 16'b00000_11101100100;
    parameter signed W1i = 16'b11111_10011110010;
 
    // W2 = 0.707 - j0.707
    parameter signed W2r = 16'b00000_10110101000;
    parameter signed W2i = 16'b11111_01001011000;
 
    // W3 = 0.382 - j0.923
    parameter signed W3r = 16'b00000_01100001110;
    parameter signed W3i = 16'b11111_00010001110;
 
    // W4 = 0 - j1
    parameter signed W4r = 16'b00000_00000000000;
    parameter signed W4i = 16'b11111_00000000000;
 
    // W5 = -0.382 - j0.923
    parameter signed W5r = 16'b11111_10011110010;
    parameter signed W5i = 16'b11111_00010001110;
     
    // W6 = -0.707 - j0.707
    parameter signed W6r = 16'b11111_01001011000;
    parameter signed W6i = 16'b11111_01001011000;
 
    // W7 = -0.923 - j0.382
    parameter signed W7r = 16'b11111_0001000111;
    parameter signed W7i = 16'b11111_1001111001;
    

    // Stage 1 outputs
    wire signed [15:0] stage1Out0R;
    wire signed [15:0] stage1Out0I;
    wire signed [15:0] stage1Out1R;
    wire signed [15:0] stage1Out1I;
    wire signed [15:0] stage1Out2R;
    wire signed [15:0] stage1Out2I;
    wire signed [15:0] stage1Out3R;
    wire signed [15:0] stage1Out3I;
    wire signed [15:0] stage1Out4R;
    wire signed [15:0] stage1Out4I;
    wire signed [15:0] stage1Out5R;
    wire signed [15:0] stage1Out5I;
    wire signed [15:0] stage1Out6R;
    wire signed [15:0] stage1Out6I;
    wire signed [15:0] stage1Out7R;
    wire signed [15:0] stage1Out7I;

    // Stage 2 outputs
    wire signed [15:0] stage2Out0R;
    wire signed [15:0] stage2Out0I;
    wire signed [15:0] stage2Out1R;
    wire signed [15:0] stage2Out1I;
    wire signed [15:0] stage2Out2R;
    wire signed [15:0] stage2Out2I;
    wire signed [15:0] stage2Out3R;
    wire signed [15:0] stage2Out3I;
    wire signed [15:0] stage2Out4R;
    wire signed [15:0] stage2Out4I;
    wire signed [15:0] stage2Out5R;
    wire signed [15:0] stage2Out5I;
    wire signed [15:0] stage2Out6R;
    wire signed [15:0] stage2Out6I;
    wire signed [15:0] stage2Out7R;
    wire signed [15:0] stage2Out7I;

    // Stage 3 outputs
    wire signed [15:0] stage3Out0R;
    wire signed [15:0] stage3Out0I;
    wire signed [15:0] stage3Out1R;
    wire signed [15:0] stage3Out1I;
    wire signed [15:0] stage3Out2R;
    wire signed [15:0] stage3Out2I;
    wire signed [15:0] stage3Out3R;
    wire signed [15:0] stage3Out3I;
    wire signed [15:0] stage3Out4R;
    wire signed [15:0] stage3Out4I;
    wire signed [15:0] stage3Out5R;
    wire signed [15:0] stage3Out5I;
    wire signed [15:0] stage3Out6R;
    wire signed [15:0] stage3Out6I;
    wire signed [15:0] stage3Out7R;
    wire signed [15:0] stage3Out7I;


//////////////////Stage1/////////////////////
    Butterfly s11 (
        .bflyIn1R   (in0R),
        .bflyIn1I   (in0I),
        .bflyIn2R   (in4R),
        .bflyIn2I   (in4I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .clk        (clk),
        .rst        (rst),
        .bflyOut1R  (stage1Out0R),
        .bflyOut1I  (stage1Out0I),
        .bflyOut2R  (stage1Out1R),
        .bflyOut2I  (stage1Out1I)
    );


     Butterfly s12 (
        .bflyIn1R   (in2R),
        .bflyIn1I   (in2I),
        .bflyIn2R   (in6R),
        .bflyIn2I   (in6I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .clk        (clk),
        .rst        (rst),
        .bflyOut1R  (stage1Out2R),
        .bflyOut1I  (stage1Out2I),
        .bflyOut2R  (stage1Out3R),
        .bflyOut2I  (stage1Out3I)
    );


     Butterfly s13 (
        .bflyIn1R   (in1R),
        .bflyIn1I   (in1I),
        .bflyIn2R   (in5R),
        .bflyIn2I   (in5I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .clk        (clk),
        .rst        (rst),
        .bflyOut1R  (stage1Out4R),
        .bflyOut1I  (stage1Out4I),
        .bflyOut2R  (stage1Out5R),
        .bflyOut2I  (stage1Out5I)
    );


     Butterfly s14 (
        .bflyIn1R   (in3R),
        .bflyIn1I   (in3I),
        .bflyIn2R   (in7R),
        .bflyIn2I   (in7I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .clk        (clk),
        .rst        (rst),
        .bflyOut1R  (stage1Out6R),
        .bflyOut1I  (stage1Out6I),
        .bflyOut2R  (stage1Out7R),
        .bflyOut2I  (stage1Out7I)
    );

//////////////////////////////////////////////


//////////////////Stage2/////////////////////
    Butterfly s21 (
        .bflyIn1R   (stage1Out0R),
        .bflyIn1I   (stage1Out0I),
        .bflyIn2R   (stage1Out2R),
        .bflyIn2I   (stage1Out2I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .clk        (clk),
        .rst        (rst),
        .bflyOut1R  (stage2Out0R),
        .bflyOut1I  (stage2Out0I),
        .bflyOut2R  (stage2Out2R),
        .bflyOut2I  (stage2Out2I)
    );


     Butterfly s22 (
        .bflyIn1R   (stage1Out1R),
        .bflyIn1I   (stage1Out1I),
        .bflyIn2R   (stage1Out3R),
        .bflyIn2I   (stage1Out3I),
        .bflyWr     (W4r),
        .bflyWi     (W4i),
        .clk        (clk),
        .rst        (rst),
        .bflyOut1R  (stage2Out1R),
        .bflyOut1I  (stage2Out1I),
        .bflyOut2R  (stage2Out3R),
        .bflyOut2I  (stage2Out3I)
    );


     Butterfly s23 (
        .bflyIn1R   (stage1Out4R),
        .bflyIn1I   (stage1Out4I),
        .bflyIn2R   (stage1Out6R),
        .bflyIn2I   (stage1Out6I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .clk        (clk),
        .rst        (rst),
        .bflyOut1R  (stage2Out4R),
        .bflyOut1I  (stage2Out4I),
        .bflyOut2R  (stage2Out6R),
        .bflyOut2I  (stage2Out6I)
    );


     Butterfly s24 (
        .bflyIn1R   (stage1Out5R),
        .bflyIn1I   (stage1Out5I),
        .bflyIn2R   (stage1Out7R),
        .bflyIn2I   (stage1Out7I),
        .bflyWr     (W4r),
        .bflyWi     (W4i),
        .clk        (clk),
        .rst        (rst),
        .bflyOut1R  (stage2Out5R),
        .bflyOut1I  (stage2Out5I),
        .bflyOut2R  (stage2Out7R),
        .bflyOut2I  (stage2Out7I)
    );
/////////////////////////////////////////////


//////////////////Stage3/////////////////////
    Butterfly s31 (
        .bflyIn1R   (stage2Out0R),
        .bflyIn1I   (stage2Out0I),
        .bflyIn2R   (stage2Out4R),
        .bflyIn2I   (stage2Out4I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .clk        (clk),
        .rst        (rst),
        .bflyOut1R  (stage3Out0R),
        .bflyOut1I  (stage3Out0I),
        .bflyOut2R  (stage3Out4R),
        .bflyOut2I  (stage3Out4I)
    );


     Butterfly s32 (
        .bflyIn1R   (stage2Out1R),
        .bflyIn1I   (stage2Out1I),
        .bflyIn2R   (stage2Out5R),
        .bflyIn2I   (stage2Out5I),
        .bflyWr     (W2r),
        .bflyWi     (W2i),
        .clk        (clk),
        .rst        (rst),
        .bflyOut1R  (stage3Out1R),
        .bflyOut1I  (stage3Out1I),
        .bflyOut2R  (stage3Out5R),
        .bflyOut2I  (stage3Out5I)
    );


     Butterfly s33 (
        .bflyIn1R   (stage2Out2R),
        .bflyIn1I   (stage2Out2I),
        .bflyIn2R   (stage2Out6R),
        .bflyIn2I   (stage2Out6I),
        .bflyWr     (W4r),
        .bflyWi     (W4i),
        .clk        (clk),
        .rst        (rst),
        .bflyOut1R  (stage3Out2R),
        .bflyOut1I  (stage3Out2I),
        .bflyOut2R  (stage3Out6R),
        .bflyOut2I  (stage3Out6I)
    );


     Butterfly s34 (
        .bflyIn1R   (stage2Out3R),
        .bflyIn1I   (stage2Out3I),
        .bflyIn2R   (stage2Out7R),
        .bflyIn2I   (stage2Out7I),
        .bflyWr     (W6r),
        .bflyWi     (W6i),
        .clk        (clk),
        .rst        (rst),
        .bflyOut1R  (stage3Out3R),
        .bflyOut1I  (stage3Out3I),
        .bflyOut2R  (stage3Out7R),
        .bflyOut2I  (stage3Out7I)
    );
///////////////////////////////////////////


// Assigning FFT results to the output ports
    always @(posedge clk or negedge rst) 
        begin
            if(!rst)
                begin
                    out0R <= 0;
                    out0I <= 0;
                    out1R <= 0;
                    out1I <= 0;
                    out2R <= 0;
                    out2I <= 0;
                    out3R <= 0;
                    out3I <= 0;
                    out4R <= 0;
                    out4I <= 0;
                    out5R <= 0;
                    out5I <= 0;
                    out6R <= 0;
                    out6I <= 0;
                    out7R <= 0;
                    out7I <= 0;
                end
            else
                begin
                    out0R <= stage3Out0R;
                    out0I <= stage3Out0I;
                    out1R <= stage3Out1R;
                    out1I <= stage3Out1I;
                    out2R <= stage3Out2R;
                    out2I <= stage3Out2I;
                    out3R <= stage3Out3R;
                    out3I <= stage3Out3I; 
                    out4R <= stage3Out4R;
                    out4I <= stage3Out4I;
                    out5R <= stage3Out5R;
                    out5I <= stage3Out5I;
                    out6R <= stage3Out6R;
                    out6I <= stage3Out6I;
                    out7R <= stage3Out7R;
                    out7I <= stage3Out7I;
                end
        end



endmodule