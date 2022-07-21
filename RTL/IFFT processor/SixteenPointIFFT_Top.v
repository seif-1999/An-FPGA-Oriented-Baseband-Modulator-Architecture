// to preform IFFT operations using FFT processor we have to multiply the img inputs and outputs by -1 as well as
// dividing all the outputs by N, where N is the no. off FFT points(16)

module SixteenPointIFFT_Top #( parameter portWidth = 16
    
) (
    input wire signed [portWidth-1:0]   IFFTin0R,
    input wire signed [portWidth-1:0]   IFFTin0I,
    input wire signed [portWidth-1:0]   IFFTin1R,
    input wire signed [portWidth-1:0]   IFFTin1I,
    input wire signed [portWidth-1:0]   IFFTin2R,
    input wire signed [portWidth-1:0]   IFFTin2I,
    input wire signed [portWidth-1:0]   IFFTin3R,
    input wire signed [portWidth-1:0]   IFFTin3I,
    input wire signed [portWidth-1:0]   IFFTin4R,
    input wire signed [portWidth-1:0]   IFFTin4I,
    input wire signed [portWidth-1:0]   IFFTin5R,
    input wire signed [portWidth-1:0]   IFFTin5I,
    input wire signed [portWidth-1:0]   IFFTin6R,
    input wire signed [portWidth-1:0]   IFFTin6I,
    input wire signed [portWidth-1:0]   IFFTin7R,
    input wire signed [portWidth-1:0]   IFFTin7I,
    input wire signed [portWidth-1:0]   IFFTin8R,
    input wire signed [portWidth-1:0]   IFFTin8I,
    input wire signed [portWidth-1:0]   IFFTin9R,
    input wire signed [portWidth-1:0]   IFFTin9I,
    input wire signed [portWidth-1:0]   IFFTin10R,
    input wire signed [portWidth-1:0]   IFFTin10I,
    input wire signed [portWidth-1:0]   IFFTin11R,
    input wire signed [portWidth-1:0]   IFFTin11I,
    input wire signed [portWidth-1:0]   IFFTin12R,
    input wire signed [portWidth-1:0]   IFFTin12I,
    input wire signed [portWidth-1:0]   IFFTin13R,
    input wire signed [portWidth-1:0]   IFFTin13I,
    input wire signed [portWidth-1:0]   IFFTin14R,
    input wire signed [portWidth-1:0]   IFFTin14I,
    input wire signed [portWidth-1:0]   IFFTin15R,
    input wire signed [portWidth-1:0]   IFFTin15I,
    input wire                          IFFTCLK,
    input wire                          IFFTRST,
    output reg        [portWidth-1:0]   IFFTout0R,
    output reg        [portWidth-1:0]   IFFTout0I,
    output reg        [portWidth-1:0]   IFFTout1R,
    output reg        [portWidth-1:0]   IFFTout1I,
    output reg        [portWidth-1:0]   IFFTout2R,
    output reg        [portWidth-1:0]   IFFTout2I,
    output reg        [portWidth-1:0]   IFFTout3R,
    output reg        [portWidth-1:0]   IFFTout3I,
    output reg        [portWidth-1:0]   IFFTout4R,
    output reg        [portWidth-1:0]   IFFTout4I,
    output reg        [portWidth-1:0]   IFFTout5R,
    output reg        [portWidth-1:0]   IFFTout5I,
    output reg        [portWidth-1:0]   IFFTout6R,
    output reg        [portWidth-1:0]   IFFTout6I,
    output reg        [portWidth-1:0]   IFFTout7R,
    output reg        [portWidth-1:0]   IFFTout7I,
    output reg        [portWidth-1:0]   IFFTout8R,
    output reg        [portWidth-1:0]   IFFTout8I,
    output reg        [portWidth-1:0]   IFFTout9R,
    output reg        [portWidth-1:0]   IFFTout9I,
    output reg        [portWidth-1:0]   IFFTout10R,
    output reg        [portWidth-1:0]   IFFTout10I,
    output reg        [portWidth-1:0]   IFFTout11R,
    output reg        [portWidth-1:0]   IFFTout11I,
    output reg        [portWidth-1:0]   IFFTout12R,
    output reg        [portWidth-1:0]   IFFTout12I,
    output reg        [portWidth-1:0]   IFFTout13R,
    output reg        [portWidth-1:0]   IFFTout13I,
    output reg        [portWidth-1:0]   IFFTout14R,
    output reg        [portWidth-1:0]   IFFTout14I,
    output reg        [portWidth-1:0]   IFFTout15R,
    output reg        [portWidth-1:0]   IFFTout15I
);


    wire signed [portWidth-1:0] FFTOut0R;
    wire signed [portWidth-1:0] FFTOut0I;
    wire signed [portWidth-1:0] FFTOut1R;
    wire signed [portWidth-1:0] FFTOut1I;
    wire signed [portWidth-1:0] FFTOut2R;
    wire signed [portWidth-1:0] FFTOut2I;
    wire signed [portWidth-1:0] FFTOut3R;
    wire signed [portWidth-1:0] FFTOut3I;
    wire signed [portWidth-1:0] FFTOut4R;
    wire signed [portWidth-1:0] FFTOut4I;
    wire signed [portWidth-1:0] FFTOut5R;
    wire signed [portWidth-1:0] FFTOut5I;
    wire signed [portWidth-1:0] FFTOut6R;
    wire signed [portWidth-1:0] FFTOut6I;
    wire signed [portWidth-1:0] FFTOut7R;
    wire signed [portWidth-1:0] FFTOut7I;
    wire signed [portWidth-1:0] FFTOut8R;
    wire signed [portWidth-1:0] FFTOut8I;
    wire signed [portWidth-1:0] FFTOut9R;
    wire signed [portWidth-1:0] FFTOut9I;
    wire signed [portWidth-1:0] FFTOut10R;
    wire signed [portWidth-1:0] FFTOut10I;
    wire signed [portWidth-1:0] FFTOut11R;
    wire signed [portWidth-1:0] FFTOut11I;
    wire signed [portWidth-1:0] FFTOut12R;
    wire signed [portWidth-1:0] FFTOut12I;
    wire signed [portWidth-1:0] FFTOut13R;
    wire signed [portWidth-1:0] FFTOut13I;
    wire signed [portWidth-1:0] FFTOut14R;
    wire signed [portWidth-1:0] FFTOut14I;
    wire signed [portWidth-1:0] FFTOut15R;
    wire signed [portWidth-1:0] FFTOut15I;


    wire signed [portWidth-1:0] FFTin0I;
    wire signed [portWidth-1:0] FFTin1I;
    wire signed [portWidth-1:0] FFTin2I;
    wire signed [portWidth-1:0] FFTin3I;
    wire signed [portWidth-1:0] FFTin4I;
    wire signed [portWidth-1:0] FFTin5I;
    wire signed [portWidth-1:0] FFTin6I;
    wire signed [portWidth-1:0] FFTin7I;
    wire signed [portWidth-1:0] FFTin8I;
    wire signed [portWidth-1:0] FFTin9I;
    wire signed [portWidth-1:0] FFTin10I;
    wire signed [portWidth-1:0] FFTin11I;
    wire signed [portWidth-1:0] FFTin12I;
    wire signed [portWidth-1:0] FFTin13I;
    wire signed [portWidth-1:0] FFTin14I;
    wire signed [portWidth-1:0] FFTin15I;

    wire signed [portWidth-1:0] negFFTOut0I;
    wire signed [portWidth-1:0] negFFTOut1I;
    wire signed [portWidth-1:0] negFFTOut2I;
    wire signed [portWidth-1:0] negFFTOut3I;
    wire signed [portWidth-1:0] negFFTOut4I;
    wire signed [portWidth-1:0] negFFTOut5I;
    wire signed [portWidth-1:0] negFFTOut6I;
    wire signed [portWidth-1:0] negFFTOut7I;
    wire signed [portWidth-1:0] negFFTOut8I;
    wire signed [portWidth-1:0] negFFTOut9I;
    wire signed [portWidth-1:0] negFFTOut10I;
    wire signed [portWidth-1:0] negFFTOut11I;
    wire signed [portWidth-1:0] negFFTOut12I;
    wire signed [portWidth-1:0] negFFTOut13I;
    wire signed [portWidth-1:0] negFFTOut14I;
    wire signed [portWidth-1:0] negFFTOut15I;

    wire signed [portWidth-1:0] ScaledFFTOut0R;
    wire signed [portWidth-1:0] ScaledFFTOut0I;
    wire signed [portWidth-1:0] ScaledFFTOut1R;
    wire signed [portWidth-1:0] ScaledFFTOut1I;
    wire signed [portWidth-1:0] ScaledFFTOut2R;
    wire signed [portWidth-1:0] ScaledFFTOut2I;
    wire signed [portWidth-1:0] ScaledFFTOut3R;
    wire signed [portWidth-1:0] ScaledFFTOut3I;
    wire signed [portWidth-1:0] ScaledFFTOut4R;
    wire signed [portWidth-1:0] ScaledFFTOut4I;
    wire signed [portWidth-1:0] ScaledFFTOut5R;
    wire signed [portWidth-1:0] ScaledFFTOut5I;
    wire signed [portWidth-1:0] ScaledFFTOut6R;
    wire signed [portWidth-1:0] ScaledFFTOut6I;
    wire signed [portWidth-1:0] ScaledFFTOut7R;
    wire signed [portWidth-1:0] ScaledFFTOut7I;
    wire signed [portWidth-1:0] ScaledFFTOut8R;
    wire signed [portWidth-1:0] ScaledFFTOut8I;
    wire signed [portWidth-1:0] ScaledFFTOut9R;
    wire signed [portWidth-1:0] ScaledFFTOut9I;
    wire signed [portWidth-1:0] ScaledFFTOut10R;
    wire signed [portWidth-1:0] ScaledFFTOut10I;
    wire signed [portWidth-1:0] ScaledFFTOut11R;
    wire signed [portWidth-1:0] ScaledFFTOut11I;
    wire signed [portWidth-1:0] ScaledFFTOut12R;
    wire signed [portWidth-1:0] ScaledFFTOut12I;
    wire signed [portWidth-1:0] ScaledFFTOut13R;
    wire signed [portWidth-1:0] ScaledFFTOut13I;
    wire signed [portWidth-1:0] ScaledFFTOut14R;
    wire signed [portWidth-1:0] ScaledFFTOut14I;
    wire signed [portWidth-1:0] ScaledFFTOut15R;
    wire signed [portWidth-1:0] ScaledFFTOut15I;


    // Multiply all the img inputs by -1
    assign FFTin0I  = (~IFFTin0I)  +1;   
    assign FFTin1I  = (~IFFTin1I)  +1;   
    assign FFTin2I  = (~IFFTin2I)  +1;   
    assign FFTin3I  = (~IFFTin3I)  +1;    
    assign FFTin4I  = (~IFFTin4I)  +1;    
    assign FFTin5I  = (~IFFTin5I)  +1;   
    assign FFTin6I  = (~IFFTin6I)  +1;    
    assign FFTin7I  = (~IFFTin7I)  +1;    
    assign FFTin8I  = (~IFFTin8I)  +1;    
    assign FFTin9I  = (~IFFTin9I)  +1;   
    assign FFTin10I = (~IFFTin10I) +1;    
    assign FFTin11I = (~IFFTin11I) +1;    
    assign FFTin12I = (~IFFTin12I) +1;   
    assign FFTin13I = (~IFFTin13I) +1;   
    assign FFTin14I = (~IFFTin14I) +1;
    assign FFTin15I = (~IFFTin15I) +1;


    

    SixteenPointsFFT_Top U0(
        .in0R   (IFFTin0R),
        .in0I   (FFTin0I),
        .in1R   (IFFTin1R),
        .in1I   (FFTin1I),
        .in2R   (IFFTin2R),
        .in2I   (FFTin2I),
        .in3R   (IFFTin3R),
        .in3I   (FFTin3I),
        .in4R   (IFFTin4R),
        .in4I   (FFTin4I),
        .in5R   (IFFTin5R),
        .in5I   (FFTin5I),
        .in6R   (IFFTin6R),
        .in6I   (FFTin6I),
        .in7R   (IFFTin7R),
        .in7I   (FFTin7I),
        .in8R   (IFFTin8R),
        .in8I   (FFTin8I),
        .in9R   (IFFTin9R),
        .in9I   (FFTin9I),
        .in10R  (IFFTin10R),
        .in10I  (FFTin10I),
        .in11R  (IFFTin11R),
        .in11I  (FFTin11I),
        .in12R  (IFFTin12R),
        .in12I  (FFTin12I),
        .in13R  (IFFTin13R),
        .in13I  (FFTin13I),
        .in14R  (IFFTin14R),
        .in14I  (FFTin14I),
        .in15R  (IFFTin15R),
        .in15I  (FFTin15I),
        .CLK    (IFFTCLK),
        .RST    (IFFTRST),
        .out0R  (FFTOut0R),
        .out0I  (FFTOut0I),
        .out1R  (FFTOut1R),
        .out1I  (FFTOut1I),
        .out2R  (FFTOut2R),
        .out2I  (FFTOut2I),
        .out3R  (FFTOut3R),
        .out3I  (FFTOut3I),
        .out4R  (FFTOut4R),
        .out4I  (FFTOut4I),
        .out5R  (FFTOut5R),
        .out5I  (FFTOut5I),
        .out6R  (FFTOut6R),
        .out6I  (FFTOut6I),
        .out7R  (FFTOut7R),
        .out7I  (FFTOut7I),
        .out8R  (FFTOut8R),
        .out8I  (FFTOut8I),
        .out9R  (FFTOut9R),
        .out9I  (FFTOut9I),
        .out10R (FFTOut10R),
        .out10I (FFTOut10I),
        .out11R (FFTOut11R),
        .out11I (FFTOut11I),
        .out12R (FFTOut12R),
        .out12I (FFTOut12I),
        .out13R (FFTOut13R),
        .out13I (FFTOut13I),
        .out14R (FFTOut14R),
        .out14I (FFTOut14I),
        .out15R (FFTOut15R),
        .out15I (FFTOut15I)
    );



// Multiply all the img outputs by -1
    assign negFFTOut0I  = (~FFTOut0I)  +1;   
    assign negFFTOut1I  = (~FFTOut1I)  +1;   
    assign negFFTOut2I  = (~FFTOut2I)  +1;   
    assign negFFTOut3I  = (~FFTOut3I)  +1;    
    assign negFFTOut4I  = (~FFTOut4I)  +1;    
    assign negFFTOut5I  = (~FFTOut5I)  +1;   
    assign negFFTOut6I  = (~FFTOut6I)  +1;    
    assign negFFTOut7I  = (~FFTOut7I)  +1;    
    assign negFFTOut8I  = (~FFTOut8I)  +1;    
    assign negFFTOut9I  = (~FFTOut9I)  +1;   
    assign negFFTOut10I = (~FFTOut10I) +1;    
    assign negFFTOut11I = (~FFTOut11I) +1;    
    assign negFFTOut12I = (~FFTOut12I) +1;   
    assign negFFTOut13I = (~FFTOut13I) +1;   
    assign negFFTOut14I = (~FFTOut14I) +1;
    assign negFFTOut15I = (~FFTOut15I) +1;



   // divide all the outputs by 16 = 2^4 (or multiply by 2^-4) by shifting >>> each one to the right 
   // arithmetically (to preserve the sign bitt) by 4
   assign ScaledFFTOut0R  = FFTOut0R     >>> 4;
   assign ScaledFFTOut0I  = negFFTOut0I  >>> 4;
   assign ScaledFFTOut1R  = FFTOut1R     >>> 4;
   assign ScaledFFTOut1I  = negFFTOut1I  >>> 4;
   assign ScaledFFTOut2R  = FFTOut2R     >>> 4;
   assign ScaledFFTOut2I  = negFFTOut2I  >>> 4;
   assign ScaledFFTOut3R  = FFTOut3R     >>> 4;
   assign ScaledFFTOut3I  = negFFTOut3I  >>> 4;
   assign ScaledFFTOut4R  = FFTOut4R     >>> 4;
   assign ScaledFFTOut4I  = negFFTOut4I  >>> 4;
   assign ScaledFFTOut5R  = FFTOut5R     >>> 4;
   assign ScaledFFTOut5I  = negFFTOut5I  >>> 4;
   assign ScaledFFTOut6R  = FFTOut6R     >>> 4;
   assign ScaledFFTOut6I  = negFFTOut6I  >>> 4;
   assign ScaledFFTOut7R  = FFTOut7R     >>> 4;
   assign ScaledFFTOut7I  = negFFTOut7I  >>> 4;
   assign ScaledFFTOut8R  = FFTOut8R     >>> 4;
   assign ScaledFFTOut8I  = negFFTOut8I  >>> 4;
   assign ScaledFFTOut9R  = FFTOut9R     >>> 4;
   assign ScaledFFTOut9I  = negFFTOut9I  >>> 4;
   assign ScaledFFTOut10R = FFTOut10R    >>> 4;
   assign ScaledFFTOut10I = negFFTOut10I >>> 4;
   assign ScaledFFTOut11R = FFTOut11R    >>> 4;
   assign ScaledFFTOut11I = negFFTOut11I >>> 4;
   assign ScaledFFTOut12R = FFTOut12R    >>> 4;
   assign ScaledFFTOut12I = negFFTOut12I >>> 4;
   assign ScaledFFTOut13R = FFTOut13R    >>> 4;
   assign ScaledFFTOut13I = negFFTOut13I >>> 4;
   assign ScaledFFTOut14R = FFTOut14R    >>> 4;
   assign ScaledFFTOut14I = negFFTOut14I >>> 4;
   assign ScaledFFTOut15R = FFTOut15R    >>> 4; 
   assign ScaledFFTOut15I = negFFTOut15I >>> 4;


    always @(posedge IFFTCLK) 
        begin
           IFFTout0R  <= ScaledFFTOut0R; 
           IFFTout0I  <= ScaledFFTOut0I; 
           IFFTout1R  <= ScaledFFTOut1R; 
           IFFTout1I  <= ScaledFFTOut1I; 
           IFFTout2R  <= ScaledFFTOut2R; 
           IFFTout2I  <= ScaledFFTOut2I; 
           IFFTout3R  <= ScaledFFTOut3R; 
           IFFTout3I  <= ScaledFFTOut3I; 
           IFFTout4R  <= ScaledFFTOut4R; 
           IFFTout4I  <= ScaledFFTOut4I; 
           IFFTout5R  <= ScaledFFTOut5R; 
           IFFTout5I  <= ScaledFFTOut5I; 
           IFFTout6R  <= ScaledFFTOut6R; 
           IFFTout6I  <= ScaledFFTOut6I; 
           IFFTout7R  <= ScaledFFTOut7R; 
           IFFTout7I  <= ScaledFFTOut7I; 
           IFFTout8R  <= ScaledFFTOut8R; 
           IFFTout8I  <= ScaledFFTOut8I; 
           IFFTout9R  <= ScaledFFTOut9R; 
           IFFTout9I  <= ScaledFFTOut9I; 
           IFFTout10R <= ScaledFFTOut10R;
           IFFTout10I <= ScaledFFTOut10I;
           IFFTout11R <= ScaledFFTOut11R;
           IFFTout11I <= ScaledFFTOut11I;
           IFFTout12R <= ScaledFFTOut12R;
           IFFTout12I <= ScaledFFTOut12I;
           IFFTout13R <= ScaledFFTOut13R;
           IFFTout13I <= ScaledFFTOut13I;
           IFFTout14R <= ScaledFFTOut14R;
           IFFTout14I <= ScaledFFTOut14I;
           IFFTout15R <= ScaledFFTOut15R;
           IFFTout15I <= ScaledFFTOut15I; 
        end

// for debugging
/*
always @(posedge IFFTCLK) 
        begin
           IFFTout0R  <= FFTOut0R;
           IFFTout0I  <= negFFTOut0I;
           IFFTout1R  <= FFTOut1R;
           IFFTout1I  <= negFFTOut1I;
           IFFTout2R  <= FFTOut2R;
           IFFTout2I  <= negFFTOut2I;
           IFFTout3R  <= FFTOut3R;
           IFFTout3I  <= negFFTOut3I;
           IFFTout4R  <= FFTOut4R;
           IFFTout4I  <= negFFTOut4I;
           IFFTout5R  <= FFTOut5R;
           IFFTout5I  <= negFFTOut5I;
           IFFTout6R  <= FFTOut6R;
           IFFTout6I  <= negFFTOut6I;
           IFFTout7R  <= FFTOut7R;
           IFFTout7I  <= negFFTOut7I;
           IFFTout8R  <= FFTOut8R;
           IFFTout8I  <= negFFTOut8I;
           IFFTout9R  <= FFTOut9R;
           IFFTout9I  <= negFFTOut9I;
           IFFTout10R <= FFTOut10R;
           IFFTout10I <= negFFTOut10I;
           IFFTout11R <= FFTOut11R;
           IFFTout11I <= negFFTOut11I;
           IFFTout12R <= FFTOut12R;
           IFFTout12I <= negFFTOut12I;
           IFFTout13R <= FFTOut13R;
           IFFTout13I <= negFFTOut13I;
           IFFTout14R <= FFTOut14R;
           IFFTout14I <= negFFTOut14I;
           IFFTout15R <= FFTOut15R;
           IFFTout15I <= negFFTOut15I; 
        end
*/
/*
always @(posedge IFFTCLK) 
        begin
           IFFTout0R  <= FFTOut0R;
           IFFTout0I  <= FFTOut0I;
           IFFTout1R  <= FFTOut1R;
           IFFTout1I  <= FFTOut1I;
           IFFTout2R  <= FFTOut2R;
           IFFTout2I  <= FFTOut2I;
           IFFTout3R  <= FFTOut3R;
           IFFTout3I  <= FFTOut3I;
           IFFTout4R  <= FFTOut4R;
           IFFTout4I  <= FFTOut4I;
           IFFTout5R  <= FFTOut5R;
           IFFTout5I  <= FFTOut5I;
           IFFTout6R  <= FFTOut6R;
           IFFTout6I  <= FFTOut6I;
           IFFTout7R  <= FFTOut7R;
           IFFTout7I  <= FFTOut7I;
           IFFTout8R  <= FFTOut8R;
           IFFTout8I  <= FFTOut8I;
           IFFTout9R  <= FFTOut9R;
           IFFTout9I  <= FFTOut9I;
           IFFTout10R <= FFTOut10R;
           IFFTout10I <= FFTOut10I;
           IFFTout11R <= FFTOut11R;
           IFFTout11I <= FFTOut11I;
           IFFTout12R <= FFTOut12R;
           IFFTout12I <= FFTOut12I;
           IFFTout13R <= FFTOut13R;
           IFFTout13I <= FFTOut13I;
           IFFTout14R <= FFTOut14R;
           IFFTout14I <= FFTOut14I;
           IFFTout15R <= FFTOut15R;
           IFFTout15I <= FFTOut15I;
        end
*/
endmodule