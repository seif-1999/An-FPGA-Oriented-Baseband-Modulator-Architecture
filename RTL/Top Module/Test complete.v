module OFDM_Top (
    // Inputs
    input   wire	       signalIn,
    input   wire           clk,
    input   wire           rst,
    input   wire           go,
    
    // Outputs
    output  wire           outValid,
    output  wire           serialOut,
    output  wire           busy
);
    

   
   
    

    


    wire          S2P_REG_done;
    wire          S2P_REG_start;
    wire          S2P_done;
    wire          S2P_start;
    wire  [3:0]   nibble;
    wire          CPI_done;
    wire          CPI_start;
    wire          CPIdataValid;

    // QAM outputs - S2P_REG inputs
    wire  [15:0]  outR;
    wire  [15:0]  outI;

    // S2P_REG outputs - IFFT inputs
    wire  [15:0]  out0R;
    wire  [15:0]  out0I;
    wire  [15:0]  out1R;
    wire  [15:0]  out1I;
    wire  [15:0]  out2R;
    wire  [15:0]  out2I;
    wire  [15:0]  out3R;
    wire  [15:0]  out3I;
    wire  [15:0]  out4R;
    wire  [15:0]  out4I;
    wire  [15:0]  out5R;
    wire  [15:0]  out5I;
    wire  [15:0]  out6R;
    wire  [15:0]  out6I;
    wire  [15:0]  out7R;
    wire  [15:0]  out7I;

    // IFFT outputs - CPI inputs
    wire [15:0]   Fout0R;
    wire [15:0]   Fout0I;
    wire [15:0]   Fout1R;
    wire [15:0]   Fout1I;
    wire [15:0]   Fout2R;
    wire [15:0]   Fout2I;
    wire [15:0]   Fout3R;
    wire [15:0]   Fout3I;
    wire [15:0]   Fout4R;
    wire [15:0]   Fout4I;
    wire [15:0]   Fout5R;
    wire [15:0]   Fout5I;
    wire [15:0]   Fout6R;
    wire [15:0]   Fout6I;
    wire [15:0]   Fout7R;
    wire [15:0]   Fout7I;

    Controller U0 (
        // Inputs
        .S2P_done       (S2P_done),
        .S2P_REG_done   (S2P_REG_done),
        .CPI_done       (CPI_done),
        .clk            (clk),
        .rst            (rst),
        .go             (go),

        // Outputs
        .S2P_start      (S2P_start),
        .S2P_REG_start  (S2P_REG_start),
        .CPI_start      (CPI_start),
        .CPIdataValid   (CPIdataValid),
        .busy           (busy)
    );


    S2P U1 (
        // Inputs
        .serialIn       (signalIn),
        .clk            (clk),
        .rst            (rst),
        .start          (S2P_start),

        // Outputs
        .parallelOut    (nibble),
        .done           (S2P_done)
    );


    QAM_16 U2 (
        // Inputs
        .in      (nibble),
        .clk     (clk),
        .rst     (rst),

        // Outputs
        .outR    (outR),
        .outI    (outI)
    );

    S2P_REG U3 (
        // Inputs
        .serialInR  (outR),
        .serialInI  (outI),

        .clk        (clk),
        .rst        (rst),

        // Outputs
        .start      (S2P_REG_start),
        .done       (S2P_REG_done),

        .out0R      (out0R),
        .out0I      (out0I),
        .out1R      (out1R),
        .out1I      (out1I),
        .out2R      (out2R),
        .out2I      (out2I),
        .out3R      (out3R),
        .out3I      (out3I),
        .out4R      (out4R),
        .out4I      (out4I),
        .out5R      (out5R),
        .out5I      (out5I),
        .out6R      (out6R),
        .out6I      (out6I),
        .out7R      (out7R),
        .out7I      (out7I)
    );

    

    EightPointIFFT_Top U4 (
        // Inputs
        .IFFTin0R   (out0R),
        .IFFTin0I   (out0I),
        .IFFTin1R   (out1R),
        .IFFTin1I   (out1I),
        .IFFTin2R   (out2R),
        .IFFTin2I   (out2I),
        .IFFTin3R   (out3R),
        .IFFTin3I   (out3I),
        .IFFTin4R   (out4R),
        .IFFTin4I   (out4I),
        .IFFTin5R   (out5R),
        .IFFTin5I   (out5I),
        .IFFTin6R   (out6R),
        .IFFTin6I   (out6I),
        .IFFTin7R   (out7R),
        .IFFTin7I   (out7I),
        
        
        .clk        (clk),
        .rst        (rst),

        // Outputs
        .IFFTout0R  (Fout0R),
        .IFFTout0I  (Fout0I),
        .IFFTout1R  (Fout1R),
        .IFFTout1I  (Fout1I),
        .IFFTout2R  (Fout2R),
        .IFFTout2I  (Fout2I),
        .IFFTout3R  (Fout3R),
        .IFFTout3I  (Fout3I),
        .IFFTout4R  (Fout4R),
        .IFFTout4I  (Fout4I),
        .IFFTout5R  (Fout5R),
        .IFFTout5I  (Fout5I),
        .IFFTout6R  (Fout6R),
        .IFFTout6I  (Fout6I),
        .IFFTout7R  (Fout7R),
        .IFFTout7I  (Fout7I)
    );





    CPI U5 (
        // Inputs
        .in0R         (Fout0R),
        .in0I         (Fout0I),
        .in1R         (Fout1R),
        .in1I         (Fout1I),
        .in2R         (Fout2R),
        .in2I         (Fout2I),
        .in3R         (Fout3R),
        .in3I         (Fout3I),
        .in4R         (Fout4R),
        .in4I         (Fout4I),
        .in5R         (Fout5R),
        .in5I         (Fout5I),
        .in6R         (Fout6R),
        .in6I         (Fout6I),
        .in7R         (Fout7R),
        .in7I         (Fout7I),

        .clk          (clk),
        .rst          (rst),
        .dataValid    (CPIdataValid),
        .start        (CPI_start),

        // Outputs
        .done         (CPI_done),
        .outValid     (outValid),
        .serialOut    (serialOut)
    );
    

endmodule