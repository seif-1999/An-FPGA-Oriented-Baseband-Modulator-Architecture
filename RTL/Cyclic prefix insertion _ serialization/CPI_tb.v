module CPI_tb #(
    parameter test = 10
) ();

    reg [15:0]  in0R_tb;
    reg [15:0]  in0I_tb;
    reg [15:0]  in1R_tb;
    reg [15:0]  in1I_tb;
    //reg [15:0]  in2R;
    //reg [15:0]  in2I;
    //reg [15:0]  in3R;
    //reg [15:0]  in3I;
    //reg [15:0]  in4R;
    //reg [15:0]  in4I;
    //reg [15:0]  in5R;
    //reg [15:0]  in5I;
    //reg [15:0]  in6R;
    //reg [15:0]  in6I;
    //reg [15:0]  in7R;
    //reg [15:0]  in7I;
    //reg [15:0]  in8R;
    //reg [15:0]  in8I;
    //reg [15:0]  in9R;
    //reg [15:0]  in9I;
    //reg [15:0]  in10R;
    //reg [15:0]  in10I;
    //reg [15:0]  in11R;
    //reg [15:0]  in11I;
    //reg [15:0]  in12R;
    //reg [15:0]  in12I;
    //reg [15:0]  in13R;
    //reg [15:0]  in13I;
    //reg [15:0]  in14R;
    //reg [15:0]  in14I;
    //reg [15:0]  in15R;
    //reg [15:0]  in15I;

     reg         clk_tb;
     reg         rst_tb;
     reg         dataValid_tb;
     reg         start_tb;    
    wire         done_tb;           // TODO // sort out whether the same as regCountDone of different before signing off
    wire         countDone_tb;      // for deguging
    wire         regCountDone_tb;   // for debuging      
    wire [6:0]   count_tb;          // for debuging
    wire [3:0]   regCount_tb;       // for debuging
    wire         outValid_tb;
    wire   serialOut_tb;
    




CPI DUT(
    .in0R        (in0R_tb),
    .in0I        (in0I_tb),
    .in1R        (in1R_tb),
    .in1I        (in1I_tb),
    .clk         (clk_tb),
    .rst         (rst_tb),
    .dataValid   (dataValid_tb),
    .start       (start_tb),   
    .done        (done_tb),   
    .countDone   (countDone_tb),  
    .regCountDone(regCountDone_tb),
    .count       (count_tb),     
    .regCount    (regCount_tb),
    .outValid    (outValid_tb),
    .serialOut   (serialOut_tb)
);
    
// Clock generation & scaling
    `timescale 1ms/1ps
    always #5 clk_tb = ~clk_tb; // 100KHz clock



    initial 
        begin
            // intial values

            in0R_tb = 'b0;
            in0I_tb = 'b0;
            in1R_tb = 'b0;
            in1I_tb = 'b0;

            clk_tb  = 'b0;
            rst_tb  = 'b0;
            start_tb= 'b0;
            dataValid_tb='b0;

            #3
            rst_tb  = 'b1;
            start_tb= 'b1;

            in0R_tb = 16'b00001_10101010001;
            in0I_tb = 16'b00010_10101010001;
            in1R_tb = 16'b00011_10101010001;
            in1I_tb = 16'b00100_10101010001;

            dataValid_tb = 'b1;
            #7

            #3
            dataValid_tb = 'b0;

            #1000

            $finish;



        end

endmodule