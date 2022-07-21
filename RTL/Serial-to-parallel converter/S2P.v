module S2P #(
    parameter outPortWidth = 4,
    parameter counterWidth = 2                    // the counter width is log to the 
                                                  //base 2 of the deesired output port width
) (
    // Inputs
    input  wire                       serialIn,
    input  wire                       clk,
    input  wire                       rst,
    input  wire                       start,
    
    // Outputs
    output reg    [outPortWidth-1:0]  parallelOut,
    output reg                        done 
);

 reg  [outPortWidth-1:0] tempReg;
 reg  [counterWidth:0]   counter;
 reg  [counterWidth:0]   count;
 reg                     convDone;
 wire                    countDone;
 



 // Shift serial inputs to fill the a register in prallel
 always @(posedge clk or negedge rst) 
    begin
        if(!rst)
            begin
               tempReg <= 'b0;
            end 
         else if(!start)
            begin
                tempReg <= tempReg;
            end
         else
            begin
                tempReg <= {serialIn, tempReg[outPortWidth-1:1]};
            end
    end   




 // assign the parallel output to the output register after conversion
 always @(posedge clk) 
    begin
        if(!rst)
        begin
            parallelOut <= 4'b0;
        end
         else if(convDone && start) 
            begin
                parallelOut <= tempReg;
               
            end
         else 
            begin
                parallelOut <= parallelOut;
            end
    end




// Incremnet and reset a counter to start and finish conversion
 always @(posedge clk or negedge rst) 
    begin
        if(!rst)
            begin
                counter <= 0;
            end
         else if(start && !countDone) 
            begin
                counter <= counter + 'b1;
            end
         else
            begin
                counter <= 0; 
            end
    end

 // Handle the done flag
 assign countDone = (counter == outPortWidth-1) ? 1'b1 : 1'b0;

    always @(posedge clk or negedge rst) 
    begin
        if(!rst)
            begin
                convDone <= 0;
                done <= 0;
            end
        else
            begin
                convDone <= countDone;
                done <= convDone;
            end
    end


 

endmodule