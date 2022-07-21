module S2P_tb #(
    parameter outPortWidth = 4,
    parameter counterWidth = $clog2(outPortWidth) // the counter width is log to the 
                                                  //base 2 of the deesired output port width
) ();
    

    reg                      serialIn_tb;
    reg                      CLK_tb;
    reg                      RST_tb;
    reg                      start_tb;
    wire    [outPortWidth-1:0] parallelOut_tb;
    wire                       done_tb;
    //wire       [counterWidth:0]   count_tb; // debugging


    S2P DUT (
        .serialIn    (serialIn_tb),
        .CLK         (CLK_tb),
        .RST         (RST_tb),
        .start       (start_tb),
        .parallelOut (parallelOut_tb),
        .done        (done_tb)
        //.count     (count_tb)
    );


     // Clock generation & scaling
    `timescale 1ms/1ps
    always #5 CLK_tb = ~CLK_tb; // 100KHz clock


    initial 
        begin
            $dumpfile("S2P.vcd");
            $dumpvars;

            $monitor("In=%b , Out=%b", serialIn_tb , parallelOut_tb);

            // set intial values
            serialIn_tb = 1'b0;
            CLK_tb   = 1'b0;
            RST_tb   = 1'b0;
            start_tb = 1'b0;
            //parallelOut_tb = 4'b0000;

           
            #3
            RST_tb   = 1'b1;
            //#14
            start_tb = 1'b1;
            //#3

            // In 1
            //#3
            serialIn_tb = 1'b1;
            #7
            
             // In 2
            #3

            serialIn_tb = 1'b1;
            #7

             // In 3
            #3
            serialIn_tb = 1'b0;
            #7

             // In 4
            #3
            serialIn_tb = 1'b0;
            #7

             // In 5

            #3
            
            serialIn_tb = 1'b1;
            #7
            
             // In 6
            #3
            serialIn_tb = 1'b0;
            #7

             // In 7
            #3
            serialIn_tb = 1'b0;
            #7

             // In 8
            #3
            serialIn_tb = 1'b1;
            #7





            // In 1
            #3
            serialIn_tb = 1'b1;
            #7
            
             // In 2
            #3
            serialIn_tb = 1'b0;
            #7

             // In 3
            #3
            serialIn_tb = 1'b1;
            #7

             // In 4
            #3
            serialIn_tb = 1'b0;
            #7


            #3





            #7
            #50

            start_tb = 1'b0;
            #100
            $finish;



            
        end
endmodule