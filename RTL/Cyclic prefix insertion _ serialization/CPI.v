module CPI (
    // Inputs
    input   wire [15:0]  in0R,
    input   wire [15:0]  in0I,
    input   wire [15:0]  in1R,
    input   wire [15:0]  in1I,
    input   wire [15:0]  in2R,
    input   wire [15:0]  in2I,
    input   wire [15:0]  in3R,
    input   wire [15:0]  in3I,
    input   wire [15:0]  in4R,
    input   wire [15:0]  in4I,
    input   wire [15:0]  in5R,
    input   wire [15:0]  in5I,
    input   wire [15:0]  in6R,
    input   wire [15:0]  in6I,
    input   wire [15:0]  in7R,
    input   wire [15:0]  in7I,

    input   wire         clk,
    input   wire         rst,
    input   wire         dataValid,
    input   wire         start, 

    // Outputs   
    output  reg          done,
    output  reg          outValid,       // = 1 if the ouput is valid
    output  reg          serialOut
);
    
    reg [0:31] frame [0:8];
    reg [6:0]  count; 
    reg [5:0]  regCount;
    wire       countDone; 
    wire       regCountDone;
    wire       ready;
    integer    i;


    always @(posedge clk or negedge rst) 
        begin
            if(!rst)                                // Zero out the income register on reset
                begin
                    for(i = 0; i < 9 ; i = i + 1)
                        begin
                            frame[i] <= 32'b0;
                        end 

                    serialOut <= 0;
                    outValid <= 0;
                end
             else if(start && dataValid)                      // copy data at module's input if valid
                begin
                    frame[0]  <= {in7R,  in7I};     //last frame
                    frame[1]  <= {in0R,  in0I};     // first frame
                    frame[2]  <= {in1R,  in1I};
                    frame[3]  <= {in2R,  in2I};
                    frame[4]  <= {in3R,  in3I};
                    frame[5]  <= {in4R,  in4I};
                    frame[6]  <= {in5R,  in5I};
                    frame[7]  <= {in6R,  in6I};
                    frame[8]  <= {in7R,  in7I};
                end
             else if(start && !dataValid)
                begin
                    serialOut <= frame [regCount][count];
                    outValid <= ready;
                end
        end

        assign ready = (start && !dataValid) ? 1'b1 : 1'b0;

        // handle bit counter
        always @(posedge clk or negedge rst) 
            begin
                if(!rst)
                    begin
                        count <= 0;
                    end
                    else if(start && !countDone && !dataValid)
                        begin
                            count <= count + 1;
                        end
                    else
                        begin
                            count <= 0;
                        end
            end

            // handle register counter
            always @(posedge clk or negedge rst) 
            begin
                if(!rst)
                    begin
                        regCount <= 0;
                    end
                    else if(start && countDone && !regCountDone)
                        begin
                            regCount <= regCount + 1;
                        end
                    else if(dataValid || regCountDone && countDone)
                        begin
                            regCount <= 0;
                        end
                    else
                        begin
                            regCount <= regCount;
                        end
            end

            // delay done signal by 1 cycle
            always @(posedge clk) 
                begin
                 done <= regCountDone;
                end
             // handle done flags
            assign countDone     = (count == 'd31)    ? 1'b1 : 1'b0;
            assign regCountDone  = (regCount == 'd8 && countDone) ? 1'b1 : 1'b0;
            
endmodule