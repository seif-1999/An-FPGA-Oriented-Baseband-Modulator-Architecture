module SixteenPointsFFT_Top #( parameter portWidth = 16
)(
    input wire signed [portWidth-1:0]   in0R,
    input wire signed [portWidth-1:0]   in0I,
    input wire signed [portWidth-1:0]   in1R,
    input wire signed [portWidth-1:0]   in1I,
    input wire signed [portWidth-1:0]   in2R,
    input wire signed [portWidth-1:0]   in2I,
    input wire signed [portWidth-1:0]   in3R,
    input wire signed [portWidth-1:0]   in3I,
    input wire signed [portWidth-1:0]   in4R,
    input wire signed [portWidth-1:0]   in4I,
    input wire signed [portWidth-1:0]   in5R,
    input wire signed [portWidth-1:0]   in5I,
    input wire signed [portWidth-1:0]   in6R,
    input wire signed [portWidth-1:0]   in6I,
    input wire signed [portWidth-1:0]   in7R,
    input wire signed [portWidth-1:0]   in7I,
    input wire signed [portWidth-1:0]   in8R,
    input wire signed [portWidth-1:0]   in8I,
    input wire signed [portWidth-1:0]   in9R,
    input wire signed [portWidth-1:0]   in9I,
    input wire signed [portWidth-1:0]   in10R,
    input wire signed [portWidth-1:0]   in10I,
    input wire signed [portWidth-1:0]   in11R,
    input wire signed [portWidth-1:0]   in11I,
    input wire signed [portWidth-1:0]   in12R,
    input wire signed [portWidth-1:0]   in12I,
    input wire signed [portWidth-1:0]   in13R,
    input wire signed [portWidth-1:0]   in13I,
    input wire signed [portWidth-1:0]   in14R,
    input wire signed [portWidth-1:0]   in14I,
    input wire signed [portWidth-1:0]   in15R,
    input wire signed [portWidth-1:0]   in15I,
    input wire                          CLK,
    input wire                          RST,
    output reg        [portWidth-1:0]   out0R,
    output reg        [portWidth-1:0]   out0I,
    output reg        [portWidth-1:0]   out1R,
    output reg        [portWidth-1:0]   out1I,
    output reg        [portWidth-1:0]   out2R,
    output reg        [portWidth-1:0]   out2I,
    output reg        [portWidth-1:0]   out3R,
    output reg        [portWidth-1:0]   out3I,
    output reg        [portWidth-1:0]   out4R,
    output reg        [portWidth-1:0]   out4I,
    output reg        [portWidth-1:0]   out5R,
    output reg        [portWidth-1:0]   out5I,
    output reg        [portWidth-1:0]   out6R,
    output reg        [portWidth-1:0]   out6I,
    output reg        [portWidth-1:0]   out7R,
    output reg        [portWidth-1:0]   out7I,
    output reg        [portWidth-1:0]   out8R,
    output reg        [portWidth-1:0]   out8I,
    output reg        [portWidth-1:0]   out9R,
    output reg        [portWidth-1:0]   out9I,
    output reg        [portWidth-1:0]   out10R,
    output reg        [portWidth-1:0]   out10I,
    output reg        [portWidth-1:0]   out11R,
    output reg        [portWidth-1:0]   out11I,
    output reg        [portWidth-1:0]   out12R,
    output reg        [portWidth-1:0]   out12I,
    output reg        [portWidth-1:0]   out13R,
    output reg        [portWidth-1:0]   out13I,
    output reg        [portWidth-1:0]   out14R,
    output reg        [portWidth-1:0]   out14I,
    output reg        [portWidth-1:0]   out15R,
    output reg        [portWidth-1:0]   out15I
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
    parameter signed W7r = 16'b11111_00010001110;
    parameter signed W7i = 16'b11111_10011110010;
    

    // Stage 1 output signals
    wire signed [portWidth-1:0] stage1Out0R;
    wire signed [portWidth-1:0] stage1Out0I;
    wire signed [portWidth-1:0] stage1Out1R;
    wire signed [portWidth-1:0] stage1Out1I;
    wire signed [portWidth-1:0] stage1Out2R;
    wire signed [portWidth-1:0] stage1Out2I;
    wire signed [portWidth-1:0] stage1Out3R;
    wire signed [portWidth-1:0] stage1Out3I;
    wire signed [portWidth-1:0] stage1Out4R;
    wire signed [portWidth-1:0] stage1Out4I;
    wire signed [portWidth-1:0] stage1Out5R;
    wire signed [portWidth-1:0] stage1Out5I;
    wire signed [portWidth-1:0] stage1Out6R;
    wire signed [portWidth-1:0] stage1Out6I;
    wire signed [portWidth-1:0] stage1Out7R;
    wire signed [portWidth-1:0] stage1Out7I;
    wire signed [portWidth-1:0] stage1Out8R;
    wire signed [portWidth-1:0] stage1Out8I;
    wire signed [portWidth-1:0] stage1Out9R;
    wire signed [portWidth-1:0] stage1Out9I;
    wire signed [portWidth-1:0] stage1Out10R;
    wire signed [portWidth-1:0] stage1Out10I;
    wire signed [portWidth-1:0] stage1Out11R;
    wire signed [portWidth-1:0] stage1Out11I;
    wire signed [portWidth-1:0] stage1Out12R;
    wire signed [portWidth-1:0] stage1Out12I;
    wire signed [portWidth-1:0] stage1Out13R;
    wire signed [portWidth-1:0] stage1Out13I;
    wire signed [portWidth-1:0] stage1Out14R;
    wire signed [portWidth-1:0] stage1Out14I;
    wire signed [portWidth-1:0] stage1Out15R;
    wire signed [portWidth-1:0] stage1Out15I;

    // Stage 2 output signals
    wire signed [portWidth-1:0] stage2Out0R;
    wire signed [portWidth-1:0] stage2Out0I;
    wire signed [portWidth-1:0] stage2Out1R;
    wire signed [portWidth-1:0] stage2Out1I;
    wire signed [portWidth-1:0] stage2Out2R;
    wire signed [portWidth-1:0] stage2Out2I;
    wire signed [portWidth-1:0] stage2Out3R;
    wire signed [portWidth-1:0] stage2Out3I;
    wire signed [portWidth-1:0] stage2Out4R;
    wire signed [portWidth-1:0] stage2Out4I;
    wire signed [portWidth-1:0] stage2Out5R;
    wire signed [portWidth-1:0] stage2Out5I;
    wire signed [portWidth-1:0] stage2Out6R;
    wire signed [portWidth-1:0] stage2Out6I;
    wire signed [portWidth-1:0] stage2Out7R;
    wire signed [portWidth-1:0] stage2Out7I;
    wire signed [portWidth-1:0] stage2Out8R;
    wire signed [portWidth-1:0] stage2Out8I;
    wire signed [portWidth-1:0] stage2Out9R;
    wire signed [portWidth-1:0] stage2Out9I;
    wire signed [portWidth-1:0] stage2Out10R;
    wire signed [portWidth-1:0] stage2Out10I;
    wire signed [portWidth-1:0] stage2Out11R;
    wire signed [portWidth-1:0] stage2Out11I;
    wire signed [portWidth-1:0] stage2Out12R;
    wire signed [portWidth-1:0] stage2Out12I;
    wire signed [portWidth-1:0] stage2Out13R;
    wire signed [portWidth-1:0] stage2Out13I;
    wire signed [portWidth-1:0] stage2Out14R;
    wire signed [portWidth-1:0] stage2Out14I;
    wire signed [portWidth-1:0] stage2Out15R;
    wire signed [portWidth-1:0] stage2Out15I;

    // Stage 3 output signals
    wire signed [portWidth-1:0] stage3Out0R;
    wire signed [portWidth-1:0] stage3Out0I;
    wire signed [portWidth-1:0] stage3Out1R;
    wire signed [portWidth-1:0] stage3Out1I;
    wire signed [portWidth-1:0] stage3Out2R;
    wire signed [portWidth-1:0] stage3Out2I;
    wire signed [portWidth-1:0] stage3Out3R;
    wire signed [portWidth-1:0] stage3Out3I;
    wire signed [portWidth-1:0] stage3Out4R;
    wire signed [portWidth-1:0] stage3Out4I;
    wire signed [portWidth-1:0] stage3Out5R;
    wire signed [portWidth-1:0] stage3Out5I;
    wire signed [portWidth-1:0] stage3Out6R;
    wire signed [portWidth-1:0] stage3Out6I;
    wire signed [portWidth-1:0] stage3Out7R;
    wire signed [portWidth-1:0] stage3Out7I;
    wire signed [portWidth-1:0] stage3Out8R;
    wire signed [portWidth-1:0] stage3Out8I;
    wire signed [portWidth-1:0] stage3Out9R;
    wire signed [portWidth-1:0] stage3Out9I;
    wire signed [portWidth-1:0] stage3Out10R;
    wire signed [portWidth-1:0] stage3Out10I;
    wire signed [portWidth-1:0] stage3Out11R;
    wire signed [portWidth-1:0] stage3Out11I;
    wire signed [portWidth-1:0] stage3Out12R;
    wire signed [portWidth-1:0] stage3Out12I;
    wire signed [portWidth-1:0] stage3Out13R;
    wire signed [portWidth-1:0] stage3Out13I;
    wire signed [portWidth-1:0] stage3Out14R;
    wire signed [portWidth-1:0] stage3Out14I;
    wire signed [portWidth-1:0] stage3Out15R;
    wire signed [portWidth-1:0] stage3Out15I;

    // Stage 4 output signals
    wire signed [portWidth-1:0] stage4Out0R;
    wire signed [portWidth-1:0] stage4Out0I;
    wire signed [portWidth-1:0] stage4Out1R;
    wire signed [portWidth-1:0] stage4Out1I;
    wire signed [portWidth-1:0] stage4Out2R;
    wire signed [portWidth-1:0] stage4Out2I;
    wire signed [portWidth-1:0] stage4Out3R;
    wire signed [portWidth-1:0] stage4Out3I;
    wire signed [portWidth-1:0] stage4Out4R;
    wire signed [portWidth-1:0] stage4Out4I;
    wire signed [portWidth-1:0] stage4Out5R;
    wire signed [portWidth-1:0] stage4Out5I;
    wire signed [portWidth-1:0] stage4Out6R;
    wire signed [portWidth-1:0] stage4Out6I;
    wire signed [portWidth-1:0] stage4Out7R;
    wire signed [portWidth-1:0] stage4Out7I;
    wire signed [portWidth-1:0] stage4Out8R;
    wire signed [portWidth-1:0] stage4Out8I;
    wire signed [portWidth-1:0] stage4Out9R;
    wire signed [portWidth-1:0] stage4Out9I;
    wire signed [portWidth-1:0] stage4Out10R;
    wire signed [portWidth-1:0] stage4Out10I;
    wire signed [portWidth-1:0] stage4Out11R;
    wire signed [portWidth-1:0] stage4Out11I;
    wire signed [portWidth-1:0] stage4Out12R;
    wire signed [portWidth-1:0] stage4Out12I;
    wire signed [portWidth-1:0] stage4Out13R;
    wire signed [portWidth-1:0] stage4Out13I;
    wire signed [portWidth-1:0] stage4Out14R;
    wire signed [portWidth-1:0] stage4Out14I;
    wire signed [portWidth-1:0] stage4Out15R;
    wire signed [portWidth-1:0] stage4Out15I;


//////////////////Stage1/////////////////////
    Butterfly s11 (
        .bflyIn1R   (in0R),
        .bflyIn1I   (in0I),
        .bflyIn2R   (in8R),
        .bflyIn2I   (in8I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage1Out0R),
        .bflyOut1I  (stage1Out0I),
        .bflyOut2R  (stage1Out1R),
        .bflyOut2I  (stage1Out1I)
    );


     Butterfly s12 (
        .bflyIn1R   (in4R),
        .bflyIn1I   (in4I),
        .bflyIn2R   (in12R),
        .bflyIn2I   (in12I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage1Out2R),
        .bflyOut1I  (stage1Out2I),
        .bflyOut2R  (stage1Out3R),
        .bflyOut2I  (stage1Out3I)
    );


     Butterfly s13 (
        .bflyIn1R   (in2R),
        .bflyIn1I   (in2I),
        .bflyIn2R   (in10R),
        .bflyIn2I   (in10I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage1Out4R),
        .bflyOut1I  (stage1Out4I),
        .bflyOut2R  (stage1Out5R),
        .bflyOut2I  (stage1Out5I)
    );


     Butterfly s14 (
        .bflyIn1R   (in6R),
        .bflyIn1I   (in6I),
        .bflyIn2R   (in14R),
        .bflyIn2I   (in14I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage1Out6R),
        .bflyOut1I  (stage1Out6I),
        .bflyOut2R  (stage1Out7R),
        .bflyOut2I  (stage1Out7I)
    );


    Butterfly s15 (
        .bflyIn1R   (in1R),
        .bflyIn1I   (in1I),
        .bflyIn2R   (in9R),
        .bflyIn2I   (in9I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage1Out8R),
        .bflyOut1I  (stage1Out8I),
        .bflyOut2R  (stage1Out9R),
        .bflyOut2I  (stage1Out9I)
    );


     Butterfly s16 (
        .bflyIn1R   (in5R),
        .bflyIn1I   (in5I),
        .bflyIn2R   (in13R),
        .bflyIn2I   (in13I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage1Out10R),
        .bflyOut1I  (stage1Out10I),
        .bflyOut2R  (stage1Out11R),
        .bflyOut2I  (stage1Out11I)
    );


     Butterfly s17 (
        .bflyIn1R   (in3R),
        .bflyIn1I   (in3I),
        .bflyIn2R   (in11R),
        .bflyIn2I   (in11I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage1Out12R),
        .bflyOut1I  (stage1Out12I),
        .bflyOut2R  (stage1Out13R),
        .bflyOut2I  (stage1Out13I)
    );


     Butterfly s18 (
        .bflyIn1R   (in7R),
        .bflyIn1I   (in7I),
        .bflyIn2R   (in15R),
        .bflyIn2I   (in15I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage1Out14R),
        .bflyOut1I  (stage1Out14I),
        .bflyOut2R  (stage1Out15R),
        .bflyOut2I  (stage1Out15I)
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
        .bflyCLK    (CLK),
        .bflyRST    (RST),
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
        .bflyCLK    (CLK),
        .bflyRST    (RST),
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
        .bflyCLK    (CLK),
        .bflyRST    (RST),
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
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage2Out5R),
        .bflyOut1I  (stage2Out5I),
        .bflyOut2R  (stage2Out7R),
        .bflyOut2I  (stage2Out7I)
    );


    Butterfly s25 (
        .bflyIn1R   (stage1Out8R),
        .bflyIn1I   (stage1Out8I),
        .bflyIn2R   (stage1Out10R),
        .bflyIn2I   (stage1Out10I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage2Out8R),
        .bflyOut1I  (stage2Out8I),
        .bflyOut2R  (stage2Out10R),
        .bflyOut2I  (stage2Out10I)
    );


     Butterfly s26 (
        .bflyIn1R   (stage1Out9R),
        .bflyIn1I   (stage1Out9I),
        .bflyIn2R   (stage1Out11R),
        .bflyIn2I   (stage1Out11I),
        .bflyWr     (W4r),
        .bflyWi     (W4i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage2Out9R),
        .bflyOut1I  (stage2Out9I),
        .bflyOut2R  (stage2Out11R),
        .bflyOut2I  (stage2Out11I)
    );


     Butterfly s27 (
        .bflyIn1R   (stage1Out12R),
        .bflyIn1I   (stage1Out12I),
        .bflyIn2R   (stage1Out14R),
        .bflyIn2I   (stage1Out14I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage2Out12R),
        .bflyOut1I  (stage2Out12I),
        .bflyOut2R  (stage2Out14R),
        .bflyOut2I  (stage2Out14I)
    );


     Butterfly s28 (
        .bflyIn1R   (stage1Out13R),
        .bflyIn1I   (stage1Out13I),
        .bflyIn2R   (stage1Out15R),
        .bflyIn2I   (stage1Out15I),
        .bflyWr     (W4r),
        .bflyWi     (W4i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage2Out13R),
        .bflyOut1I  (stage2Out13I),
        .bflyOut2R  (stage2Out15R),
        .bflyOut2I  (stage2Out15I)
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
        .bflyCLK    (CLK),
        .bflyRST    (RST),
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
        .bflyCLK    (CLK),
        .bflyRST    (RST),
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
        .bflyCLK    (CLK),
        .bflyRST    (RST),
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
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage3Out3R),
        .bflyOut1I  (stage3Out3I),
        .bflyOut2R  (stage3Out7R),
        .bflyOut2I  (stage3Out7I)
    );


    Butterfly s35 (
        .bflyIn1R   (stage2Out8R),
        .bflyIn1I   (stage2Out8I),
        .bflyIn2R   (stage2Out12R),
        .bflyIn2I   (stage2Out12I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage3Out8R),
        .bflyOut1I  (stage3Out8I),
        .bflyOut2R  (stage3Out12R),
        .bflyOut2I  (stage3Out12I)
    );


     Butterfly s36 (
        .bflyIn1R   (stage2Out9R),
        .bflyIn1I   (stage2Out9I),
        .bflyIn2R   (stage2Out13R),
        .bflyIn2I   (stage2Out13I),
        .bflyWr     (W2r),
        .bflyWi     (W2i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage3Out9R),
        .bflyOut1I  (stage3Out9I),
        .bflyOut2R  (stage3Out13R),
        .bflyOut2I  (stage3Out13I)
    );


     Butterfly s37 (
        .bflyIn1R   (stage2Out10R),
        .bflyIn1I   (stage2Out10I),
        .bflyIn2R   (stage2Out14R),
        .bflyIn2I   (stage2Out14I),
        .bflyWr     (W4r),
        .bflyWi     (W4i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage3Out10R),
        .bflyOut1I  (stage3Out10I),
        .bflyOut2R  (stage3Out14R),
        .bflyOut2I  (stage3Out14I)
    );


     Butterfly s38 (
        .bflyIn1R   (stage2Out11R),
        .bflyIn1I   (stage2Out11I),
        .bflyIn2R   (stage2Out15R),
        .bflyIn2I   (stage2Out15I),
        .bflyWr     (W6r),
        .bflyWi     (W6i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage3Out11R),
        .bflyOut1I  (stage3Out11I),
        .bflyOut2R  (stage3Out15R),
        .bflyOut2I  (stage3Out15I)
    );
///////////////////////////////////////////


//////////////////Stage4/////////////////////
    Butterfly s41 (
        .bflyIn1R   (stage3Out0R),
        .bflyIn1I   (stage3Out0I),
        .bflyIn2R   (stage3Out8R),
        .bflyIn2I   (stage3Out8I),
        .bflyWr     (W0r),
        .bflyWi     (W0i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage4Out0R),
        .bflyOut1I  (stage4Out0I),
        .bflyOut2R  (stage4Out8R),
        .bflyOut2I  (stage4Out8I)
    );


     Butterfly s42 (
        .bflyIn1R   (stage3Out1R),
        .bflyIn1I   (stage3Out1I),
        .bflyIn2R   (stage3Out9R),
        .bflyIn2I   (stage3Out9I),
        .bflyWr     (W1r),
        .bflyWi     (W1i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage4Out1R),
        .bflyOut1I  (stage4Out1I),
        .bflyOut2R  (stage4Out9R),
        .bflyOut2I  (stage4Out9I)
    );


     Butterfly s43 (
        .bflyIn1R   (stage3Out2R),
        .bflyIn1I   (stage3Out2I),
        .bflyIn2R   (stage3Out10R),
        .bflyIn2I   (stage3Out10I),
        .bflyWr     (W2r),
        .bflyWi     (W2i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage4Out2R),
        .bflyOut1I  (stage4Out2I),
        .bflyOut2R  (stage4Out10R),
        .bflyOut2I  (stage4Out10I)
    );


     Butterfly s44 (
        .bflyIn1R   (stage3Out3R),
        .bflyIn1I   (stage3Out3I),
        .bflyIn2R   (stage3Out11R),
        .bflyIn2I   (stage3Out11I),
        .bflyWr     (W3r),
        .bflyWi     (W3i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage4Out3R),
        .bflyOut1I  (stage4Out3I),
        .bflyOut2R  (stage4Out11R),
        .bflyOut2I  (stage4Out11I)
    );


    Butterfly s45 (
        .bflyIn1R   (stage3Out4R),
        .bflyIn1I   (stage3Out4I),
        .bflyIn2R   (stage3Out12R),
        .bflyIn2I   (stage3Out12I),
        .bflyWr     (W4r),
        .bflyWi     (W4i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage4Out4R),
        .bflyOut1I  (stage4Out4I),
        .bflyOut2R  (stage4Out12R),
        .bflyOut2I  (stage4Out12I)
    );


     Butterfly s46 (
        .bflyIn1R   (stage3Out5R),
        .bflyIn1I   (stage3Out5I),
        .bflyIn2R   (stage3Out13R),
        .bflyIn2I   (stage3Out13I),
        .bflyWr     (W5r),
        .bflyWi     (W5i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage4Out5R),
        .bflyOut1I  (stage4Out5I),
        .bflyOut2R  (stage4Out13R),
        .bflyOut2I  (stage4Out13I)
    );


     Butterfly s47 (
        .bflyIn1R   (stage3Out6R),
        .bflyIn1I   (stage3Out6I),
        .bflyIn2R   (stage3Out14R),
        .bflyIn2I   (stage3Out14I),
        .bflyWr     (W6r),
        .bflyWi     (W6i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage4Out6R),
        .bflyOut1I  (stage4Out6I),
        .bflyOut2R  (stage4Out14R),
        .bflyOut2I  (stage4Out14I)
    );


     Butterfly s48 (
        .bflyIn1R   (stage3Out7R),
        .bflyIn1I   (stage3Out7I),
        .bflyIn2R   (stage3Out15R),
        .bflyIn2I   (stage3Out15I),
        .bflyWr     (W7r),
        .bflyWi     (W7i),
        .bflyCLK    (CLK),
        .bflyRST    (RST),
        .bflyOut1R  (stage4Out7R),
        .bflyOut1I  (stage4Out7I),
        .bflyOut2R  (stage4Out15R),
        .bflyOut2I  (stage4Out15I)
    );
///////////////////////////////////////////



    always @(posedge CLK) 
        begin
            out0R   <= stage4Out0R;
            out0I   <= stage4Out0I;
            out1R   <= stage4Out1R;
            out1I   <= stage4Out1I;
            out2R   <= stage4Out2R;
            out2I   <= stage4Out2I;
            out3R   <= stage4Out3R;
            out3I   <= stage4Out3I; 
            out4R   <= stage4Out4R;
            out4I   <= stage4Out4I;
            out5R   <= stage4Out5R;
            out5I   <= stage4Out5I;
            out6R   <= stage4Out6R;
            out6I   <= stage4Out6I;
            out7R   <= stage4Out7R;
            out7I   <= stage4Out7I;
            out8R   <= stage4Out8R;
            out8I   <= stage4Out8I;
            out9R   <= stage4Out9R;
            out9I   <= stage4Out9I;
            out10R  <= stage4Out10R;
            out10I  <= stage4Out10I;
            out11R  <= stage4Out11R;
            out11I  <= stage4Out11I; 
            out12R  <= stage4Out12R;
            out12I  <= stage4Out12I;
            out13R  <= stage4Out13R;
            out13I  <= stage4Out13I;
            out14R  <= stage4Out14R;
            out14I  <= stage4Out14I;
            out15R  <= stage4Out15R;
            out15I  <= stage4Out15I;
        end



endmodule