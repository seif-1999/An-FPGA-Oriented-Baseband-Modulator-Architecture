module OFDM_Top_tb ();
    



    reg             signalIn_tb;
    reg             clk_tb;
    reg             rst_tb;
    reg             go_tb;
    
    wire            outValid_tb;
    wire            serialOut_tb;
    wire            busy_tb;


    OFDM_Top DUT(
        .signalIn       (signalIn_tb),
        .clk            (clk_tb),
        .rst            (rst_tb),
        .go             (go_tb),
        
        .outValid        (outValid_tb),
        .serialOut       (serialOut_tb),
        .busy            (busy_tb)
    );




     // Clock generation & scaling
    `timescale 1ms/1ps
    always #5 clk_tb = ~clk_tb; // 100KHz clock


    initial 
        begin
            $dumpfile("S2P.vcd");
            $dumpvars;

           
            // intials
            signalIn_tb = 0;
            clk_tb      = 0;
            rst_tb      = 0;
            go_tb       = 0;

#10
            #3
            rst_tb  = 1;
            go_tb   = 1;
#7
#10

            // serial inputs

           
           
 // input 1 0011
            #3
            signalIn_tb = 1'b1;
            #7



             
            #3

            signalIn_tb = 1'b1;
            #7

             
            #3
            signalIn_tb = 1'b0;
            #7

             
            #3
            signalIn_tb = 1'b0;
            #7

            
#50

// input 2 1001
             

            #3
            
            signalIn_tb = 1'b1;
            #7
            
             
            #3
            signalIn_tb = 1'b0;
            #7

             
            #3
            signalIn_tb = 1'b0;
            #7

             
            #3
            signalIn_tb = 1'b1;
            #7



#50

// input 3 0101

           
            #3
            signalIn_tb = 1'b1;
            #7
            
             
            #3
            signalIn_tb = 1'b0;
            #7

             
            #3
            signalIn_tb = 1'b1;
            #7

             
            #3
            signalIn_tb = 1'b0;
            #7


#50

// input 4 0101

            
            #3
            signalIn_tb = 1'b1;
            #7
            
             
            #3
            signalIn_tb = 1'b0;
            #7

             
            #3
            signalIn_tb = 1'b1;
            #7

             
            #3
            signalIn_tb = 1'b0;
            #7

#50
 
// input 5 0011
            #3
            signalIn_tb = 1;
            #7



            
            #3

            signalIn_tb = 1'b1;
            #7

             
            #3
            signalIn_tb = 1'b0;
            #7

             
            #3
            signalIn_tb = 1'b0;
            #7

            
#50

// input 6 1001
             

            #3
            
            signalIn_tb = 1'b1;
            #7
            
             
            #3
            signalIn_tb = 1'b0;
            #7

            
            #3
            signalIn_tb = 1'b0;
            #7

             
            #3
            signalIn_tb = 1'b1;
            #7


#50

// input 7 0101

            
            #3
            signalIn_tb = 1'b1;
            #7
            
            
            #3
            signalIn_tb = 1'b0;
            #7

             
            #3
            signalIn_tb = 1'b1;
            #7

             
            #3
            signalIn_tb = 1'b0;
            #7

#50

// input 8 0101

            
            #3
            signalIn_tb = 1'b1;
            #7
            
             
            #3
            signalIn_tb = 1'b0;
            #7

             
            #3
            signalIn_tb = 1'b1;
            #7

             
            #3
            signalIn_tb = 1'b0;
            #7



            go_tb = 1'b0;
            #15000

        
            $finish;

        end


endmodule