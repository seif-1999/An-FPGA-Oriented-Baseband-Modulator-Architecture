module S2P_REG_tb ();

reg  [15:0]  serialIn_tb;
reg          clk_tb;
reg          rst_tb;
reg          start_tb;
wire [4:0]   count_tb;
//wire [4:0]   counter_tb;
wire         done_tb;
wire [15:0]  out1_tb;
wire [15:0]  out2_tb;
wire [15:0]  outx_tb;
wire [15:0]  outy_tb;
    

S2P_REG DUT(
    .serialIn (serialIn_tb),
    .clk      (clk_tb),
    .rst      (rst_tb),
    .start    (start_tb),
    .count    (count_tb),
    //.counter  (counter_tb),
    .done     (done_tb),
    .out1     (out1_tb),
    .out2     (out2_tb),
    .outx     (outx_tb),
    .outy     (outy_tb)
);



// Clock generation & scaling
    `timescale 1ms/1ps
    always #5 clk_tb = ~clk_tb; // 100KHz clock



    initial
        begin
            $dumpfile("S2P_test.vcd");
            $dumpvars;
            
            // set intial values
            serialIn_tb = 'b0;
            clk_tb      = 'b0;
            rst_tb      = 'b0;
            start_tb    = 'b0;


            //begin testing


            #2
            rst_tb      = 1'b1;
            start_tb    = 1'b1;
            //#8
            #3
            // in1
            //#3
            serialIn_tb = 16'b00001_00000000000;
            //#8


            #3
            serialIn_tb = 16'b00010_00000000000;
            #7

            // in2
            #3
            serialIn_tb = 16'b00011_00000000000;
            #7

            #3
            serialIn_tb = 16'b00100_00000000000;
            #7

            // in3
            #3
            serialIn_tb = 16'b00101_00000000000;
            #7

            #3
            serialIn_tb = 16'b00110_00000000000;
            #7

            #20
             start_tb = 1'b0;



            #100 
            $finish;
        end
endmodule