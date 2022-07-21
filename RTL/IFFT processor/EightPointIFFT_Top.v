// to preform IFFT operations using FFT processor we have to multiply the img inputs and outputs by -1 as well as
// dividing all the outputs by N, where N is the no. off FFT points(16)

module EightPointIFFT_Top #( parameter portWidth = 16
    
) (
    // Inputs
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
    
    input wire                          clk,
    input wire                          rst,

    // Outputs
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
    output reg        [portWidth-1:0]   IFFTout7I
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
    


    wire signed [portWidth-1:0] FFTin0I;
    wire signed [portWidth-1:0] FFTin1I;
    wire signed [portWidth-1:0] FFTin2I;
    wire signed [portWidth-1:0] FFTin3I;
    wire signed [portWidth-1:0] FFTin4I;
    wire signed [portWidth-1:0] FFTin5I;
    wire signed [portWidth-1:0] FFTin6I;
    wire signed [portWidth-1:0] FFTin7I;
    

    wire signed [portWidth-1:0] negFFTOut0I;
    wire signed [portWidth-1:0] negFFTOut1I;
    wire signed [portWidth-1:0] negFFTOut2I;
    wire signed [portWidth-1:0] negFFTOut3I;
    wire signed [portWidth-1:0] negFFTOut4I;
    wire signed [portWidth-1:0] negFFTOut5I;
    wire signed [portWidth-1:0] negFFTOut6I;
    wire signed [portWidth-1:0] negFFTOut7I;
   

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
   

    // Multiply all the img inputs by -1
    assign FFTin0I  = (~IFFTin0I)  +1;   
    assign FFTin1I  = (~IFFTin1I)  +1;   
    assign FFTin2I  = (~IFFTin2I)  +1;   
    assign FFTin3I  = (~IFFTin3I)  +1;    
    assign FFTin4I  = (~IFFTin4I)  +1;    
    assign FFTin5I  = (~IFFTin5I)  +1;   
    assign FFTin6I  = (~IFFTin6I)  +1;    
    assign FFTin7I  = (~IFFTin7I)  +1;    
    


    

    EightPointsFFT U0(
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
        
        .clk    (clk),
        .rst    (rst),
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
        .out7I  (FFTOut7I)
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
   



   // divide all the outputs by 16 = 2^4 (or multiply by 2^-4) by shifting >>> each one to the right 
   // arithmetically (to preserve the sign bitt) by 4
   assign ScaledFFTOut0R  = FFTOut0R     >>> 3;
   assign ScaledFFTOut0I  = negFFTOut0I  >>> 3;
   assign ScaledFFTOut1R  = FFTOut1R     >>> 3;
   assign ScaledFFTOut1I  = negFFTOut1I  >>> 3;
   assign ScaledFFTOut2R  = FFTOut2R     >>> 3;
   assign ScaledFFTOut2I  = negFFTOut2I  >>> 3;
   assign ScaledFFTOut3R  = FFTOut3R     >>> 3;
   assign ScaledFFTOut3I  = negFFTOut3I  >>> 3;
   assign ScaledFFTOut4R  = FFTOut4R     >>> 3;
   assign ScaledFFTOut4I  = negFFTOut4I  >>> 3;
   assign ScaledFFTOut5R  = FFTOut5R     >>> 3;
   assign ScaledFFTOut5I  = negFFTOut5I  >>> 3;
   assign ScaledFFTOut6R  = FFTOut6R     >>> 3;
   assign ScaledFFTOut6I  = negFFTOut6I  >>> 3;
   assign ScaledFFTOut7R  = FFTOut7R     >>> 3;
   assign ScaledFFTOut7I  = negFFTOut7I  >>> 3;
  

    always @(posedge clk or negedge rst) 
        begin
           if(!rst)
            begin
                IFFTout0R  <= 0;
                IFFTout0I  <= 0;
                IFFTout1R  <= 0;
                IFFTout1I  <= 0;
                IFFTout2R  <= 0;
                IFFTout2I  <= 0;
                IFFTout3R  <= 0;
                IFFTout3I  <= 0;
                IFFTout4R  <= 0;
                IFFTout4I  <= 0;
                IFFTout5R  <= 0;
                IFFTout5I  <= 0;
                IFFTout6R  <= 0;
                IFFTout6I  <= 0;
                IFFTout7R  <= 0;
                IFFTout7I  <= 0;
            end
            else
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
                end
        end


endmodule