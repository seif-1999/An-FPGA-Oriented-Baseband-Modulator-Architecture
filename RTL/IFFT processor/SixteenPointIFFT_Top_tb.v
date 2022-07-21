module SixteenPointIFFT_Top_new_tb #( parameter portWidth = 16
)();
    reg  signed [portWidth-1:0]   IFFTin0R_tb;
    reg  signed [portWidth-1:0]   IFFTin0I_tb;
    reg  signed [portWidth-1:0]   IFFTin1R_tb;
    reg  signed [portWidth-1:0]   IFFTin1I_tb;
    reg  signed [portWidth-1:0]   IFFTin2R_tb;
    reg  signed [portWidth-1:0]   IFFTin2I_tb;
    reg  signed [portWidth-1:0]   IFFTin3R_tb;
    reg  signed [portWidth-1:0]   IFFTin3I_tb;
    reg  signed [portWidth-1:0]   IFFTin4R_tb;
    reg  signed [portWidth-1:0]   IFFTin4I_tb;
    reg  signed [portWidth-1:0]   IFFTin5R_tb;
    reg  signed [portWidth-1:0]   IFFTin5I_tb;
    reg  signed [portWidth-1:0]   IFFTin6R_tb;
    reg  signed [portWidth-1:0]   IFFTin6I_tb;
    reg  signed [portWidth-1:0]   IFFTin7R_tb;
    reg  signed [portWidth-1:0]   IFFTin7I_tb;
    reg  signed [portWidth-1:0]   IFFTin8R_tb;
    reg  signed [portWidth-1:0]   IFFTin8I_tb;
    reg  signed [portWidth-1:0]   IFFTin9R_tb;
    reg  signed [portWidth-1:0]   IFFTin9I_tb;
    reg  signed [portWidth-1:0]   IFFTin10R_tb;
    reg  signed [portWidth-1:0]   IFFTin10I_tb;
    reg  signed [portWidth-1:0]   IFFTin11R_tb;
    reg  signed [portWidth-1:0]   IFFTin11I_tb;
    reg  signed [portWidth-1:0]   IFFTin12R_tb;
    reg  signed [portWidth-1:0]   IFFTin12I_tb;
    reg  signed [portWidth-1:0]   IFFTin13R_tb;
    reg  signed [portWidth-1:0]   IFFTin13I_tb;
    reg  signed [portWidth-1:0]   IFFTin14R_tb;
    reg  signed [portWidth-1:0]   IFFTin14I_tb;
    reg  signed [portWidth-1:0]   IFFTin15R_tb;
    reg  signed [portWidth-1:0]   IFFTin15I_tb;
    reg                           IFFTCLK_tb;
    reg                           IFFTRST_tb;
    wire        [portWidth-1:0]   IFFTout0R_tb;
    wire        [portWidth-1:0]   IFFTout0I_tb;
    wire        [portWidth-1:0]   IFFTout1R_tb;
    wire        [portWidth-1:0]   IFFTout1I_tb;
    wire        [portWidth-1:0]   IFFTout2R_tb;
    wire        [portWidth-1:0]   IFFTout2I_tb;
    wire        [portWidth-1:0]   IFFTout3R_tb;
    wire        [portWidth-1:0]   IFFTout3I_tb;
    wire        [portWidth-1:0]   IFFTout4R_tb;
    wire        [portWidth-1:0]   IFFTout4I_tb;
    wire        [portWidth-1:0]   IFFTout5R_tb;
    wire        [portWidth-1:0]   IFFTout5I_tb;
    wire        [portWidth-1:0]   IFFTout6R_tb;
    wire        [portWidth-1:0]   IFFTout6I_tb;
    wire        [portWidth-1:0]   IFFTout7R_tb;
    wire        [portWidth-1:0]   IFFTout7I_tb;
    wire        [portWidth-1:0]   IFFTout8R_tb;
    wire        [portWidth-1:0]   IFFTout8I_tb;
    wire        [portWidth-1:0]   IFFTout9R_tb;
    wire        [portWidth-1:0]   IFFTout9I_tb;
    wire        [portWidth-1:0]   IFFTout10R_tb;
    wire        [portWidth-1:0]   IFFTout10I_tb;
    wire        [portWidth-1:0]   IFFTout11R_tb;
    wire        [portWidth-1:0]   IFFTout11I_tb;
    wire        [portWidth-1:0]   IFFTout12R_tb;
    wire        [portWidth-1:0]   IFFTout12I_tb;
    wire        [portWidth-1:0]   IFFTout13R_tb;
    wire        [portWidth-1:0]   IFFTout13I_tb;
    wire        [portWidth-1:0]   IFFTout14R_tb;
    wire        [portWidth-1:0]   IFFTout14I_tb;
    wire        [portWidth-1:0]   IFFTout15R_tb;
    wire        [portWidth-1:0]   IFFTout15I_tb;

    

    // DUT instantiation
SixteenPointIFFT_Top DUT (
    .IFFTin0R   (IFFTin0R_tb),
    .IFFTin0I   (IFFTin0I_tb),
    .IFFTin1R   (IFFTin1R_tb),
    .IFFTin1I   (IFFTin1I_tb),
    .IFFTin2R   (IFFTin2R_tb),
    .IFFTin2I   (IFFTin2I_tb),
    .IFFTin3R   (IFFTin3R_tb),
    .IFFTin3I   (IFFTin3I_tb),
    .IFFTin4R   (IFFTin4R_tb),
    .IFFTin4I   (IFFTin4I_tb),
    .IFFTin5R   (IFFTin5R_tb),
    .IFFTin5I   (IFFTin5I_tb),
    .IFFTin6R   (IFFTin6R_tb),
    .IFFTin6I   (IFFTin6I_tb),
    .IFFTin7R   (IFFTin7R_tb),
    .IFFTin7I   (IFFTin7I_tb),
    .IFFTin8R   (IFFTin8R_tb),
    .IFFTin8I   (IFFTin8I_tb),
    .IFFTin9R   (IFFTin9R_tb),
    .IFFTin9I   (IFFTin9I_tb),
    .IFFTin10R  (IFFTin10R_tb),
    .IFFTin10I  (IFFTin10I_tb),
    .IFFTin11R  (IFFTin11R_tb),
    .IFFTin11I  (IFFTin11I_tb),
    .IFFTin12R  (IFFTin12R_tb),
    .IFFTin12I  (IFFTin12I_tb),
    .IFFTin13R  (IFFTin13R_tb),
    .IFFTin13I  (IFFTin13I_tb),
    .IFFTin14R  (IFFTin14R_tb),
    .IFFTin14I  (IFFTin14I_tb),
    .IFFTin15R  (IFFTin15R_tb),
    .IFFTin15I  (IFFTin15I_tb),
    .IFFTCLK    (IFFTCLK_tb),
    .IFFTRST    (IFFTRST_tb),
    .IFFTout0R  (IFFTout0R_tb),
    .IFFTout0I  (IFFTout0I_tb),
    .IFFTout1R  (IFFTout1R_tb),
    .IFFTout1I  (IFFTout1I_tb),
    .IFFTout2R  (IFFTout2R_tb),
    .IFFTout2I  (IFFTout2I_tb),
    .IFFTout3R  (IFFTout3R_tb),
    .IFFTout3I  (IFFTout3I_tb),
    .IFFTout4R  (IFFTout4R_tb),
    .IFFTout4I  (IFFTout4I_tb),
    .IFFTout5R  (IFFTout5R_tb),
    .IFFTout5I  (IFFTout5I_tb),
    .IFFTout6R  (IFFTout6R_tb),
    .IFFTout6I  (IFFTout6I_tb),
    .IFFTout7R  (IFFTout7R_tb),
    .IFFTout7I  (IFFTout7I_tb),
    .IFFTout8R  (IFFTout8R_tb),
    .IFFTout8I  (IFFTout8I_tb),
    .IFFTout9R  (IFFTout9R_tb),
    .IFFTout9I  (IFFTout9I_tb),
    .IFFTout10R (IFFTout10R_tb),
    .IFFTout10I (IFFTout10I_tb),
    .IFFTout11R (IFFTout11R_tb),
    .IFFTout11I (IFFTout11I_tb),
    .IFFTout12R (IFFTout12R_tb),
    .IFFTout12I (IFFTout12I_tb),
    .IFFTout13R (IFFTout13R_tb),
    .IFFTout13I (IFFTout13I_tb),
    .IFFTout14R (IFFTout14R_tb),
    .IFFTout14I (IFFTout14I_tb),
    .IFFTout15R (IFFTout15R_tb),
    .IFFTout15I (IFFTout15I_tb)
);


// Clock generation & scaling
    `timescale 1ms/1ps
    always #5 IFFTCLK_tb = ~IFFTCLK_tb; // 100KHz clock


initial 
    begin
        $dumpfile("SixteenPointIFFT.vcd");
        $dumpvars;
        // set intial values
        IFFTin0R_tb     = 0;
        IFFTin0I_tb     = 0;
        IFFTin1R_tb     = 0;
        IFFTin1I_tb     = 0;
        IFFTin2R_tb     = 0;
        IFFTin2I_tb     = 0;
        IFFTin3R_tb     = 0;
        IFFTin3I_tb     = 0;
        IFFTin4R_tb     = 0;
        IFFTin4I_tb     = 0;
        IFFTin5R_tb     = 0;
        IFFTin5I_tb     = 0;
        IFFTin6R_tb     = 0;
        IFFTin6I_tb     = 0;
        IFFTin6R_tb     = 0;
        IFFTin6I_tb     = 0;
        IFFTin7R_tb     = 0;
        IFFTin7I_tb     = 0;
        IFFTin8R_tb     = 0;
        IFFTin8I_tb     = 0;
        IFFTin9R_tb     = 0;
        IFFTin9I_tb     = 0;
        IFFTin10R_tb    = 0;    
        IFFTin10I_tb    = 0;    
        IFFTin11R_tb    = 0;    
        IFFTin11I_tb    = 0;    
        IFFTin12R_tb    = 0;    
        IFFTin12I_tb    = 0;    
        IFFTin13R_tb    = 0;    
        IFFTin13I_tb    = 0;    
        IFFTin14R_tb    = 0;    
        IFFTin14I_tb    = 0;    
        IFFTin15R_tb    = 0;    
        IFFTin15I_tb    = 0;    
        IFFTCLK_tb      = 0;
        IFFTRST_tb      = 0;
        

        $display("Test case");
        #10
        IFFTRST_tb = 1;
        
        #3
        IFFTin0R_tb     = 16'b11101_00000000000;     //-3.0
        IFFTin0I_tb     = 16'b00011_00000000000;     //3.0

        IFFTin1R_tb     = 16'b11101_00000000000;     //-3.0
        IFFTin1I_tb     = 16'b00001_00000000000;     //1.0

        IFFTin2R_tb     = 16'b11101_00000000000;     //-3.0
        IFFTin2I_tb     = 16'b11101_00000000000;     //-3.0

        IFFTin3R_tb     = 16'b11101_00000000000;     //-3.0
        IFFTin3I_tb     = 16'b11111_00000000000;     //-1.0

        IFFTin4R_tb     = 16'b11111_00000000000;     //-1.0
        IFFTin4I_tb     = 16'b00011_00000000000;     //3.0

        IFFTin5R_tb     = 16'b11111_00000000000;     //-1.0
        IFFTin5I_tb     = 16'b00001_00000000000;     //1.0

        IFFTin6R_tb     = 16'b11111_00000000000;     //-1.0
        IFFTin6I_tb     = 16'b11101_00000000000;     //-3.0

        IFFTin7R_tb     = 16'b11101_00000000000;     //-3.0
        IFFTin7I_tb     = 16'b11101_00000000000;     //-3.0

        IFFTin8R_tb     = 16'b11111_00000000000;     //-1.0
        IFFTin8I_tb     = 16'b00001_00000000000;     //1.0

        IFFTin9R_tb     = 16'b11111_00000000000;     //-1.0
        IFFTin9I_tb     = 16'b11111_00000000000;     //-1.0

        IFFTin10R_tb    = 16'b11111_00000000000;     //-1.0
        IFFTin10I_tb    = 16'b00001_00000000000;     //1.0

        IFFTin11R_tb    = 16'b11111_00000000000;     //-1.0
        IFFTin11I_tb    = 16'b00001_00000000000;     //1.0

        IFFTin12R_tb    = 16'b11111_00000000000;     //-1.0
        IFFTin12I_tb    = 16'b11101_00000000000;     //-3.0

        IFFTin13R_tb    = 16'b00011_00000000000;     //3.0
        IFFTin13I_tb    = 16'b00001_00000000000;     //1.0

        IFFTin14R_tb    = 16'b11101_00000000000;     //-3.0
        IFFTin14I_tb    = 16'b00001_00000000000;     //1.0

        IFFTin15R_tb    = 16'b11111_00000000000;     //-1.0
        IFFTin15I_tb    = 16'b00001_00000000000;     //1.0
         

         #7


         #10

         #3
        IFFTin0R_tb     = 16'b11101_00000000000;     //-3.0
        IFFTin0I_tb     = 16'b00001_00000000000;     //1.0

        IFFTin1R_tb     = 16'b11111_00000000000;     //-1.0
        IFFTin1I_tb     = 16'b00001_00000000000;     //1.0

        IFFTin2R_tb     = 16'b11111_00000000000;     //-1.0
        IFFTin2I_tb     = 16'b11101_00000000000;     //-3.0

        IFFTin3R_tb     = 16'b11111_00000000000;     //-1.0v
        IFFTin3I_tb     = 16'b00001_00000000000;     //1.0v

        IFFTin4R_tb     = 16'b11111_00000000000;     //-1.0
        IFFTin4I_tb     = 16'b00011_00000000000;     //3.0

        IFFTin5R_tb     = 16'b11111_00000000000;     //-1.0
        IFFTin5I_tb     = 16'b00001_00000000000;     //1.0

        IFFTin6R_tb     = 16'b11111_00000000000;     //-1.0
        IFFTin6I_tb     = 16'b11101_00000000000;     //-3.0

        IFFTin7R_tb     = 16'b11111_00000000000;     //-1.0
        IFFTin7I_tb     = 16'b00001_00000000000;     //1.0

        IFFTin8R_tb     = 16'b11111_00000000000;     //-1.0
        IFFTin8I_tb     = 16'b00001_00000000000;     //1.0

        IFFTin9R_tb     = 16'b11111_00000000000;     //-1.0
        IFFTin9I_tb     = 16'b11111_00000000000;     //-1.0

        IFFTin10R_tb    = 16'b11111_00000000000;     //-1.0
        IFFTin10I_tb    = 16'b00001_00000000000;     //1.0

        IFFTin11R_tb    = 16'b11111_00000000000;     //-1.0
        IFFTin11I_tb    = 16'b00001_00000000000;     //1.0

        IFFTin12R_tb    = 16'b11111_00000000000;     //-1.0
        IFFTin12I_tb    = 16'b00011_00000000000;     //3.0

        IFFTin13R_tb    = 16'b00011_00000000000;     //3.0
        IFFTin13I_tb    = 16'b00001_00000000000;     //1.0

        IFFTin14R_tb    = 16'b11101_00000000000;     //-3.0
        IFFTin14I_tb    = 16'b00001_00000000000;     //1.0

        IFFTin15R_tb    = 16'b11111_00000000000;     //-1.0
        IFFTin15I_tb    = 16'b00001_00000000000;     //1.0
         

         #7
          #100
        $display("Test Complete...");
        $finish;
    

    end

endmodule