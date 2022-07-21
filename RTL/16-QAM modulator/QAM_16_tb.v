module QAM_16_tb #(
    parameter inPortWidth = 4,
    parameter outPortWidth = 16
)();

    reg [inPortWidth-1:0]    in_tb;
    reg                      clk_tb;
    reg                      rst_tb;
    wire [outPortWidth-1:0]  outR_tb;
    wire [outPortWidth-1:0]  outI_tb;

    // DUT instantiation

    QAM_16 DUT (
        .in      (in_tb),
        .clk     (clk_tb),
        .rst     (rst_tb),
        .outR    (outR_tb),  
        .outI    (outI_tb) 
    );
    

    // Clock generation & scaling
    `timescale 1ms/1ps
    always #5 clk_tb = ~clk_tb; // 100KHz clock


    initial 
        begin

          $dumpfile("QAM_16.vcd");
          $dumpvars;
          // set intial values
          in_tb   = 0; 
          clk_tb  = 0; 
          rst_tb  = 0; 
          #10
          rst_tb = 1;
          #10
          $display("Test Case");
          // Input (0)
          #3
          in_tb = 4'b0000;
          #7

          // Input (1)
          #3
          in_tb = 4'b0001;
          #7

          // Input (2)
          #3
          in_tb = 4'b0010;
          #7

          // Input (3)
          #3
          in_tb = 4'b0011;
          #7

          // Input (4)
          #3
          in_tb = 4'b0100;
          #7

          // Input (5)
          #3
          in_tb = 4'b0101;
          #7

          // Input (6)
          #3
          in_tb = 4'b0110;
          #7

          // Input (7)
          #3
          in_tb = 4'b0111;
          #7

          // Input (8)
          #3
          in_tb = 4'b1000;
          #7

          // Input (9)
          #3
          in_tb = 4'b1001;
          #7

          // Input (10)
          #3
          in_tb = 4'b1010;
          #7

          // Input (11)
          #3
          in_tb = 4'b1011;
          #7

          // Input (12)
          #3
          in_tb = 4'b1100;
          #7

          // Input (13)
          #3
          in_tb = 4'b1101;
          #7

          // Input (14)
          #3
          in_tb = 4'b1110;
          #7

          // Input (15)
          #3
          in_tb = 4'b1111;
          #7

          #100

          $finish;


        end

endmodule